import 'package:album_26_sticker_collector/brick/app_repository.dart';
import 'package:album_26_sticker_collector/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:brick_offline_first/brick_offline_first.dart';
import 'package:uuid/uuid.dart';

import 'package:album_26_sticker_collector/features/inventory/domain/inventory.model.dart';

typedef InventoryMap = Map<String, Map<String, int>>;

final inventoryProvider =
    AsyncNotifierProvider<InventoryNotifier, InventoryMap>(() {
      return InventoryNotifier();
    });

class InventoryNotifier extends AsyncNotifier<InventoryMap> {
  final _repo = AppRepository();
  @override
  Future<InventoryMap> build() async {
    final userId = supabase.auth.currentUser!.id;

    final query = Query(where: [Where.exact('userId', userId)]);
    final inventarioLocal = await _repo.get<Inventory>(query: query);

    final InventoryMap inventoryMap = {};

    for (var item in inventarioLocal) {
      final stickerId = item.stickerId;
      final variantId = item.variantId;
      final quantity = item.quantity;

      if (!inventoryMap.containsKey(stickerId)) {
        inventoryMap[stickerId] = {};
      }

      inventoryMap[stickerId]![variantId] = quantity;
    }

    return inventoryMap;
  }

  Future<void> toggleNormalSticker(String stickerId) async {
    if (!state.hasValue) return;

    final userId = supabase.auth.currentUser!.id;

    final currentMap = Map<String, Map<String, int>>.from(
      state.value!.map(
        (key, value) => MapEntry(key, Map<String, int>.from(value)),
      ),
    );

    if (!currentMap.containsKey(stickerId)) {
      currentMap[stickerId] = {};
    }

    final currentNormalQty = currentMap[stickerId]!['normal'] ?? 0;
    final isAdding = currentNormalQty == 0;

    currentMap[stickerId]!['normal'] = isAdding ? 1 : 0;
    state = AsyncData(currentMap);

    try {
      final query = Query(
        where: [
          Where.exact('userId', userId),
          Where.exact('stickerId', stickerId),
          Where.exact('variantId', 'normal'),
        ],
      );
      final registroPrevio = await _repo.get<Inventory>(query: query);

      if (isAdding) {
        if (registroPrevio.isNotEmpty) {
          await _repo.delete<Inventory>(registroPrevio.first);
        }

        final nuevoInventario = Inventory(
          id: const Uuid().v4(),
          userId: userId,
          stickerId: stickerId,
          variantId: 'normal',
          quantity: 1,
          lastUpdated: DateTime.now(),
        );

        await _repo.upsert<Inventory>(nuevoInventario);
      } else {
        if (registroPrevio.isNotEmpty) {
          await _repo.delete<Inventory>(registroPrevio.first);
        }
      }
    } catch (e) {
      print('Error en base local (SQLite lleno/corrupto): $e');
      currentMap[stickerId]!['normal'] = currentNormalQty;
      state = AsyncData(currentMap);
    }
  }

  Future<void> updateVariantQuantity(
    String stickerId,
    String variantId,
    int delta,
  ) async {
    if (!state.hasValue) return;

    final userId = supabase.auth.currentUser!.id;

    final currentMap = Map<String, Map<String, int>>.from(
      state.value!.map(
        (key, value) => MapEntry(key, Map<String, int>.from(value)),
      ),
    );

    if (!currentMap.containsKey(stickerId)) {
      currentMap[stickerId] = {};
    }

    final currentQty = currentMap[stickerId]![variantId] ?? 0;
    final newQty = currentQty + delta;

    if (newQty < 0) return;

    currentMap[stickerId]![variantId] = newQty;
    state = AsyncData(currentMap);

    try {
      final query = Query(
        where: [
          Where.exact('userId', userId),
          Where.exact('stickerId', stickerId),
          Where.exact('variantId', variantId),
        ],
      );

      final registroPrevio = await _repo.get<Inventory>(query: query);

      if (newQty == 0) {
        if (registroPrevio.isNotEmpty) {
          await _repo.delete<Inventory>(registroPrevio.first);
        }
      } else {
        // Reutiliza el id existente o genera uno nuevo
        final existingId = registroPrevio.isNotEmpty
            ? registroPrevio.first.id
            : const Uuid().v4();

        final nuevoInventario = Inventory(
          id: existingId,
          userId: userId,
          stickerId: stickerId,
          variantId: variantId,
          quantity: newQty,
          lastUpdated: DateTime.now(),
        );

        // Si hay registro previo, bórralo primero
        if (registroPrevio.isNotEmpty) {
          await _repo.delete<Inventory>(registroPrevio.first);
        }

        await _repo.upsert<Inventory>(nuevoInventario);
      }
    } catch (e) {
      print('Error en base local (SQLite lleno/corrupto): $e');
      currentMap[stickerId]![variantId] = currentQty;
      state = AsyncData(currentMap);
    }
  }
}
