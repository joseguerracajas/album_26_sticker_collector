import 'package:album_26_sticker_collector/brick/app_repository.dart';
import 'package:album_26_sticker_collector/features/catalog/domain/album.model.dart';
import 'package:album_26_sticker_collector/features/catalog/domain/album_variant.model.dart';
import 'package:album_26_sticker_collector/features/catalog/domain/album_variant_sticker.model.dart';
import 'package:album_26_sticker_collector/features/inventory/domain/user_variant_preference.model.dart';
import 'package:album_26_sticker_collector/main.dart';
import 'package:brick_offline_first/brick_offline_first.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ---------------------------------------------------------------------------
// Álbum activo (is_active = true en Supabase)
// ---------------------------------------------------------------------------
final activeAlbumProvider = FutureProvider<Album?>((ref) async {
  final all = await AppRepository().get<Album>(
    policy: OfflineFirstGetPolicy.alwaysHydrate,
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
    policy: OfflineFirstGetPolicy.alwaysHydrate,
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

  final rows = await AppRepository().get<AlbumVariantSticker>(
    policy: OfflineFirstGetPolicy.alwaysHydrate,
    query: Query(where: [Where.exact('albumVariantId', pref.albumVariantId)]),
  );
  return rows.map((r) => r.stickerId).toSet();
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
    if (userId == null) return null;

    final album = await ref.watch(activeAlbumProvider.future);
    if (album == null) return null;

    // 1. Buscar preferencia existente
    final existing = await _repo.get<UserVariantPreference>(
      policy: OfflineFirstGetPolicy.alwaysHydrate,
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
      policy: OfflineFirstGetPolicy.alwaysHydrate,
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
    final current = state.asData?.value;
    if (current == null) return;

    final updated = current.copyWith(
      albumVariantId: newVariantId,
      updatedAt: DateTime.now(),
    );

    state = AsyncData(updated);

    await _repo.upsert<UserVariantPreference>(updated);

    // Invalidar los IDs de stickers para que el catálogo se re-filtre
    ref.invalidate(activeVariantStickerIdsProvider);
  }
}
