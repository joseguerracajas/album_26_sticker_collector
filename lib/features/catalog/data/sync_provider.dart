// Archivo: lib/features/sync/data/sync_provider.dart

import 'package:album_26_sticker_collector/features/catalog/data/album_variant_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/data/categories_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/data/variants_provider.dart';
import 'package:album_26_sticker_collector/features/auth/data/guest_session_provider.dart';
import 'package:flutter/foundation.dart' hide Category;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:brick_offline_first/brick_offline_first.dart';
import 'package:album_26_sticker_collector/brick/app_repository.dart';
import 'package:album_26_sticker_collector/features/catalog/domain/album.model.dart';
import 'package:album_26_sticker_collector/features/catalog/domain/album_variant.model.dart';
import 'package:album_26_sticker_collector/features/catalog/domain/album_variant_sticker.model.dart';
import 'package:album_26_sticker_collector/features/catalog/domain/category.model.dart';
import 'package:album_26_sticker_collector/features/catalog/domain/sticker.model.dart';
import 'package:album_26_sticker_collector/features/catalog/domain/sticker_variant.model.dart';
import 'package:album_26_sticker_collector/features/inventory/domain/inventory.model.dart';
import 'package:album_26_sticker_collector/features/inventory/domain/user_variant_preference.model.dart';
import 'package:album_26_sticker_collector/features/catalog/data/stickers_provider.dart';
import 'package:album_26_sticker_collector/features/inventory/data/inventory_provider.dart';
import 'package:album_26_sticker_collector/main.dart'; // Instancia de supabase

final syncServiceProvider = Provider<SyncService>((ref) {
  return SyncService(ref);
});

class SyncService {
  final Ref _ref;
  final _repo = AppRepository();

  SyncService(this._ref);

  Future<void> refreshAll() async {
    // 1. Sincronizar catálogo completo desde remoto (maneja borrados)
    await sincronizarCatalogo();

    // 2. Sincronizar inventario del usuario autenticado
    final user = supabase.auth.currentUser;
    if (user != null) {
      await sincronizacionFisicaEspejo(user.id);
    }

    // 3. Limpiar caché en memoria y re-invalidar todos los providers
    _repo.memoryCacheProvider.reset();
    _ref.invalidate(categoriesProvider);
    _ref.invalidate(allStickersProvider);
    _ref.invalidate(stickersByCategoryProvider);
    _ref.invalidate(variantsProvider);
    _ref.invalidate(inventoryProvider);
    // Providers de álbum y variantes geográficas
    _ref.invalidate(activeAlbumProvider);
    _ref.invalidate(activeAlbumVariantsProvider);
    _ref.invalidate(activeVariantStickerIdsProvider);
    _ref.invalidate(activeVariantPreferenceProvider);
  }

  // --- PROTOCOLO ESPEJO PARA CATÁLOGO ---
  // Igual que sincronizacionFisicaEspejo pero para categorías, stickers y variantes.
  // Garantiza que los borrados en Supabase se reflejen en el SQLite local.
  Future<void> sincronizarCatalogo() async {
    try {
      // --- Categorías ---
      final remoteCategories = await _repo.remoteProvider.get<Category>();
      final localCategories = await _repo.sqliteProvider.get<Category>();
      final remoteCategoryIds = remoteCategories.map((c) => c.id).toSet();

      for (final local in localCategories) {
        if (!remoteCategoryIds.contains(local.id)) {
          await _repo.sqliteProvider.delete<Category>(local);
        }
      }
      for (final remote in remoteCategories) {
        await _repo.sqliteProvider.upsert<Category>(remote);
      }

      // --- Stickers ---
      final remoteStickers = await _repo.remoteProvider.get<Sticker>();
      final localStickers = await _repo.sqliteProvider.get<Sticker>();
      final remoteStickerIds = remoteStickers.map((s) => s.id).toSet();

      for (final local in localStickers) {
        if (!remoteStickerIds.contains(local.id)) {
          await _repo.sqliteProvider.delete<Sticker>(local);
        }
      }
      for (final remote in remoteStickers) {
        await _repo.sqliteProvider.upsert<Sticker>(remote);
      }

      // --- Variantes ---
      final remoteVariants = await _repo.remoteProvider.get<StickerVariant>();
      final localVariants = await _repo.sqliteProvider.get<StickerVariant>();
      final remoteVariantIds = remoteVariants.map((v) => v.id).toSet();

      for (final local in localVariants) {
        if (!remoteVariantIds.contains(local.id)) {
          await _repo.sqliteProvider.delete<StickerVariant>(local);
        }
      }
      for (final remote in remoteVariants) {
        await _repo.sqliteProvider.upsert<StickerVariant>(remote);
      }

      // --- Álbumes ---
      final remoteAlbums = await _repo.remoteProvider.get<Album>();
      final localAlbums = await _repo.sqliteProvider.get<Album>();
      final remoteAlbumIds = remoteAlbums.map((a) => a.id).toSet();

      for (final local in localAlbums) {
        if (!remoteAlbumIds.contains(local.id)) {
          await _repo.sqliteProvider.delete<Album>(local);
        }
      }
      for (final remote in remoteAlbums) {
        await _repo.sqliteProvider.upsert<Album>(remote);
      }

      // --- Variantes de álbum (geográficas) ---
      final remoteAlbumVariants = await _repo.remoteProvider
          .get<AlbumVariant>();
      final localAlbumVariants = await _repo.sqliteProvider.get<AlbumVariant>();
      final remoteAlbumVariantIds = remoteAlbumVariants
          .map((v) => v.id)
          .toSet();

      for (final local in localAlbumVariants) {
        if (!remoteAlbumVariantIds.contains(local.id)) {
          await _repo.sqliteProvider.delete<AlbumVariant>(local);
        }
      }
      for (final remote in remoteAlbumVariants) {
        await _repo.sqliteProvider.upsert<AlbumVariant>(remote);
      }

      // --- Stickers por variante (join table) ---
      final remoteAvs = await _repo.remoteProvider.get<AlbumVariantSticker>();
      final localAvs = await _repo.sqliteProvider.get<AlbumVariantSticker>();
      final remoteAvsIds = remoteAvs.map((r) => r.id).toSet();

      for (final local in localAvs) {
        if (!remoteAvsIds.contains(local.id)) {
          await _repo.sqliteProvider.delete<AlbumVariantSticker>(local);
        }
      }
      for (final remote in remoteAvs) {
        await _repo.sqliteProvider.upsert<AlbumVariantSticker>(remote);
      }

      // --- Preferencias de variante del usuario ---
      final user = supabase.auth.currentUser;
      if (user != null) {
        final query = Query(where: [Where.exact('userId', user.id)]);
        final remotePrefs = await _repo.remoteProvider
            .get<UserVariantPreference>(query: query);
        final localPrefs = await _repo.sqliteProvider
            .get<UserVariantPreference>(query: query);
        final remotePrefIds = remotePrefs.map((p) => p.id).toSet();

        for (final local in localPrefs) {
          if (!remotePrefIds.contains(local.id)) {
            await _repo.sqliteProvider.delete<UserVariantPreference>(local);
          }
        }
        for (final remote in remotePrefs) {
          await _repo.sqliteProvider.upsert<UserVariantPreference>(remote);
        }
      }
    } catch (e) {
      debugPrint('❌ Error en sincronización de catálogo: $e');
    }
  }

  Future<bool> hasGuestData() async {
    final guestQuery = Query(
      where: [Where.exact('userId', guestInventoryUserId)],
    );

    final guestItems = await _repo.sqliteProvider.get<Inventory>(
      query: guestQuery,
    );

    return guestItems.isNotEmpty;
  }

  Future<bool> remoteHasInventory(String userId) async {
    final query = Query(where: [Where.exact('userId', userId)]);
    final remoteItems = await _repo.remoteProvider.get<Inventory>(query: query);
    return remoteItems.isNotEmpty;
  }

  Future<void> migrateGuestDataToUser(String userId) async {
    final guestQuery = Query(
      where: [Where.exact('userId', guestInventoryUserId)],
    );

    final guestItems = await _repo.sqliteProvider.get<Inventory>(
      query: guestQuery,
    );

    if (guestItems.isEmpty) return;

    for (final item in guestItems) {
      await _repo.sqliteProvider.delete<Inventory>(item);

      final migrated = Inventory(
        id: item.id,
        userId: userId,
        stickerId: item.stickerId,
        variantId: item.variantId,
        quantity: item.quantity,
        lastUpdated: item.lastUpdated ?? DateTime.now(),
      );

      await _repo.upsert<Inventory>(migrated);
    }

    _repo.memoryCacheProvider.reset();
  }

  Future<void> discardGuestDataAndUseRemote(String userId) async {
    final guestQuery = Query(
      where: [Where.exact('userId', guestInventoryUserId)],
    );

    final guestItems = await _repo.sqliteProvider.get<Inventory>(
      query: guestQuery,
    );

    for (final item in guestItems) {
      await _repo.sqliteProvider.delete<Inventory>(item);
    }

    _repo.memoryCacheProvider.reset();
    await sincronizacionFisicaEspejo(userId);
  }

  // --- EL PROTOCOLO ESPEJO (Destructor de Fantasmas) ---
  Future<void> sincronizacionFisicaEspejo(String userId) async {
    final query = Query(where: [Where.exact('userId', userId)]);

    try {
      // Usamos directamente el remoteProvider para obtener los 15 reales
      final remoteItems = await _repo.remoteProvider.get<Inventory>(
        query: query,
      );

      // 2. Extraemos los IDs que SÍ existen en la nube (Los 15)
      final remoteIds = remoteItems.map((item) => item.id).toSet();

      // 3. LA REALIDAD LOCAL (Leemos directo de SQLite los 19)
      final localItems = await _repo.sqliteProvider.get<Inventory>(
        query: query,
      );

      // 4. Identificamos los 4 fantasmas
      final fantasmas = localItems
          .where((local) => !remoteIds.contains(local.id))
          .toList();

      // 5. Borrado físico de los 4 fantasmas solo en el teléfono
      if (fantasmas.isNotEmpty) {
        for (final fantasma in fantasmas) {
          await _repo.sqliteProvider.delete<Inventory>(fantasma);
        }
      }

      // 6. Upsert de items remotos al SQLite local (espejo completo)
      //    Esto asegura que en instalación nueva o cambio de dispositivo
      //    el inventario esté disponible de inmediato sin requerir un refresh manual.
      for (final item in remoteItems) {
        await _repo.sqliteProvider.upsert<Inventory>(item);
      }
    } catch (e) {
      debugPrint('❌ Error en sincronización física espejo: $e');
    }
  }
}
