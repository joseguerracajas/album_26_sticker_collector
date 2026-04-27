import 'package:album_26_sticker_collector/brick/app_repository.dart';
import 'package:album_26_sticker_collector/features/auth/data/guest_session_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/domain/album.model.dart';
import 'package:album_26_sticker_collector/features/catalog/domain/album_variant.model.dart';
import 'package:album_26_sticker_collector/features/catalog/domain/album_variant_sticker.model.dart';
import 'package:album_26_sticker_collector/features/inventory/domain/user_variant_preference.model.dart';
import 'package:album_26_sticker_collector/main.dart';
import 'package:brick_offline_first/brick_offline_first.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _guestVariantIdKey = 'guest_album_variant_id';

// ---------------------------------------------------------------------------
// Álbum activo (is_active = true en Supabase)
// ---------------------------------------------------------------------------
final activeAlbumProvider = FutureProvider<Album?>((ref) async {
  final all = await AppRepository().get<Album>(
    policy: OfflineFirstGetPolicy.awaitRemoteWhenNoneExist,
  );
  try {
    return all.firstWhere((a) => a.isActive);
  } catch (_) {
    return all.isNotEmpty ? all.first : null;
  }
});

// ---------------------------------------------------------------------------
// Variantes del álbum activo
// ---------------------------------------------------------------------------
final activeAlbumVariantsProvider = FutureProvider<List<AlbumVariant>>((
  ref,
) async {
  final album = await ref.watch(activeAlbumProvider.future);
  if (album == null) return [];

  final all = await AppRepository().get<AlbumVariant>(
    policy: OfflineFirstGetPolicy.awaitRemoteWhenNoneExist,
  );
  return all.where((v) => v.albumId == album.id).toList()
    ..sort((a, b) => a.name.compareTo(b.name));
});

// ---------------------------------------------------------------------------
// IDs de stickers que pertenecen a la variante activa
// Devuelve null cuando no hay datos aún (sin restricción → mostrar todo)
// ---------------------------------------------------------------------------
final activeVariantStickerIdsProvider = FutureProvider<Set<String>?>((
  ref,
) async {
  final pref = await ref.watch(activeVariantPreferenceProvider.future);
  if (pref == null) return null;

  // Traemos todos los registros sin WHERE para evitar problemas con la
  // traducción de campos en Brick cuando el caché local está vacío.
  // sincronizarCatalogo ya los popula todos en SQLite antes de que
  // se invaliden los providers.
  final allRows = await AppRepository().get<AlbumVariantSticker>(
    policy: OfflineFirstGetPolicy.alwaysHydrate,
  );

  final filtered = allRows
      .where((r) => r.albumVariantId == pref.albumVariantId)
      .toList();

  // Sin filas para esta variante = sin restricción (mostrar todo)
  if (filtered.isEmpty) return null;
  return filtered.map((r) => r.stickerId).toSet();
});

// ---------------------------------------------------------------------------
// Preferencia de variante del usuario para el álbum activo (AsyncNotifier)
// Se autocrea con la variante default si el usuario no ha elegido aún.
// ---------------------------------------------------------------------------
final activeVariantPreferenceProvider =
    AsyncNotifierProvider<
      ActiveVariantPreferenceNotifier,
      UserVariantPreference?
    >(() => ActiveVariantPreferenceNotifier());

class ActiveVariantPreferenceNotifier
    extends AsyncNotifier<UserVariantPreference?> {
  final _repo = AppRepository();

  String? get _userId => supabase.auth.currentUser?.id;

  @override
  Future<UserVariantPreference?> build() async {
    final userId = _userId;

    // Modo invitado (no autenticado): guardar/leer variante en SharedPreferences
    if (userId == null) {
      final album = await ref.watch(activeAlbumProvider.future);
      if (album == null) return null;

      final prefs = await SharedPreferences.getInstance();
      final guestVariantId = prefs.getString(_guestVariantIdKey);
      if (guestVariantId == null) {
        return null; // Sin selección → diálogo obligatorio
      }

      return UserVariantPreference(
        userId: guestInventoryUserId,
        albumId: album.id,
        albumVariantId: guestVariantId,
        updatedAt: DateTime.now(),
      );
    }

    final album = await ref.watch(activeAlbumProvider.future);
    if (album == null) return null;

    // 1. Buscar preferencia existente
    final existing = await _repo.get<UserVariantPreference>(
      policy: OfflineFirstGetPolicy.awaitRemoteWhenNoneExist,
      query: Query(
        where: [
          Where.exact('userId', userId),
          Where.exact('albumId', album.id),
        ],
      ),
    );

    if (existing.isNotEmpty) return existing.first;

    // 2. Si no existe, buscar la variante default del álbum
    final variants = await _repo.get<AlbumVariant>(
      policy: OfflineFirstGetPolicy.awaitRemoteWhenNoneExist,
    );
    final albumVariants = variants.where((v) => v.albumId == album.id).toList();
    if (albumVariants.isEmpty) return null;

    AlbumVariant defaultVariant;
    try {
      defaultVariant = albumVariants.firstWhere((v) => v.isDefault);
    } catch (_) {
      defaultVariant = albumVariants.first;
    }

    // 3. Crear y persistir la preferencia automáticamente
    final pref = UserVariantPreference(
      userId: userId,
      albumId: album.id,
      albumVariantId: defaultVariant.id,
      updatedAt: DateTime.now(),
    );
    await _repo.upsert<UserVariantPreference>(pref);
    return pref;
  }

  /// Cambia la variante activa del usuario.
  /// El inventario nunca se toca — solo se actualiza este registro.
  Future<void> switchVariant(String newVariantId) async {
    final userId = _userId;

    // Modo invitado: persistir solo en SharedPreferences
    if (userId == null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_guestVariantIdKey, newVariantId);

      final album = await ref.read(activeAlbumProvider.future);
      if (album == null) return;
      state = AsyncData(
        UserVariantPreference(
          userId: guestInventoryUserId,
          albumId: album.id,
          albumVariantId: newVariantId,
          updatedAt: DateTime.now(),
        ),
      );
      return;
    }

    final current = state.asData?.value;
    if (current == null) return;

    final updated = current.copyWith(
      albumVariantId: newVariantId,
      updatedAt: DateTime.now(),
    );

    state = AsyncData(updated);

    await _repo.upsert<UserVariantPreference>(updated);
    // activeVariantStickerIdsProvider ya observa este notifier, se reconstruye
    // automáticamente cuando cambia el estado — no es necesario invalidarlo.
  }
}
