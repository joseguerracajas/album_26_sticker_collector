// Archivo: lib/features/sync/data/sync_provider.dart

import 'package:album_26_sticker_collector/features/catalog/data/categories_provider.dart';
import 'package:album_26_sticker_collector/features/auth/data/guest_session_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:brick_offline_first/brick_offline_first.dart';
import 'package:album_26_sticker_collector/brick/app_repository.dart';
import 'package:album_26_sticker_collector/features/inventory/domain/inventory.model.dart';
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
    final user = supabase.auth.currentUser;
    if (user != null) {
      await sincronizacionFisicaEspejo(user.id);
    }

    _ref.invalidate(stickersByCategoryProvider);
    await Future.wait([
      _ref.refresh(categoriesProvider.future),
      _ref.refresh(inventoryProvider.future),
    ]);
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
