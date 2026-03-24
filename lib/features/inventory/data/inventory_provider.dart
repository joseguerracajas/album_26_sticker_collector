// Archivo: lib/features/inventory/data/inventory_provider.dart

import 'package:album_26_sticker_collector/brick/app_repository.dart';
import 'package:album_26_sticker_collector/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:brick_offline_first/brick_offline_first.dart';

// IMPORTANTE: Asegúrate de importar tu Repositorio y tu Modelo de Brick
import 'package:album_26_sticker_collector/features/inventory/domain/inventory.model.dart';

// Estructura: { 'ECU_1': { 'normal': 1, 'legend': 0 } }
typedef InventoryMap = Map<String, Map<String, int>>;

final inventoryProvider =
    AsyncNotifierProvider<InventoryNotifier, InventoryMap>(() {
      return InventoryNotifier();
    });

class InventoryNotifier extends AsyncNotifier<InventoryMap> {
  @override
  Future<InventoryMap> build() async {
    // 1. Obtenemos el ID del usuario usando Supabase Auth
    final userId = supabase.auth.currentUser!.id;

    // 2. Le pedimos a Brick TODOS los cromos de este usuario
    // (Esto sale de SQLite en 0.001s, no gasta internet)
    final query = Query(where: [Where.exact('userId', userId)]);
    final inventarioLocal = await AppRepository().get<Inventory>(query: query);

    final InventoryMap inventoryMap = {};

    // 3. Mapeamos los objetos de Brick a tu estructura de UI
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

  // El toque rápido de la cuadrícula: SIEMPRE afecta al cromo 'normal'
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

    // Actualizamos la UI al instante (Gris <-> Dorado)
    currentMap[stickerId]!['normal'] = isAdding ? 1 : 0;
    state = AsyncData(currentMap);

    // Guardado con Brick Offline-First
    try {
      final query = Query(
        where: [
          Where.exact('userId', userId),
          Where.exact('stickerId', stickerId),
          Where.exact('variantId', 'normal'),
        ],
      );
      final registroPrevio = await AppRepository().get<Inventory>(query: query);

      if (isAdding) {
        final nuevoInventario = Inventory(
          userId: userId,
          stickerId: stickerId,
          variantId: 'normal',
          quantity: 1,
          lastUpdated: DateTime.now(),
        );

        // Limpiamos rastro viejo por seguridad
        if (registroPrevio.isNotEmpty) {
          await AppRepository().delete<Inventory>(registroPrevio.first);
        }
        // Guardamos en memoria local (Se encola a Supabase automático)
        await AppRepository().upsert<Inventory>(nuevoInventario);
      } else {
        // Borramos el registro si lo está quitando
        if (registroPrevio.isNotEmpty) {
          await AppRepository().delete<Inventory>(registroPrevio.first);
        }
      }
    } catch (e) {
      print('Error en base local (SQLite lleno/corrupto): $e');
      currentMap[stickerId]!['normal'] = currentNormalQty;
      state = AsyncData(currentMap);
    }
  }

  // Función para sumar (+1) o restar (-1) cualquier variante
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

    // Actualizamos la pantalla al instante
    currentMap[stickerId]![variantId] = newQty;
    state = AsyncData(currentMap);

    // Guardado con Brick Offline-First
    try {
      final query = Query(
        where: [
          Where.exact('userId', userId),
          Where.exact('stickerId', stickerId),
          Where.exact('variantId', variantId),
        ],
      );

      final registroPrevio = await AppRepository().get<Inventory>(query: query);

      if (newQty == 0) {
        // Si bajó a 0, destruimos el registro local
        if (registroPrevio.isNotEmpty) {
          await AppRepository().delete<Inventory>(registroPrevio.first);
        }
      } else {
        final nuevoInventario = Inventory(
          userId: userId,
          stickerId: stickerId,
          variantId: variantId,
          quantity: newQty,
          lastUpdated: DateTime.now(),
        );

        if (registroPrevio.isNotEmpty) {
          await AppRepository().delete<Inventory>(registroPrevio.first);
        }

        await AppRepository().upsert<Inventory>(nuevoInventario);
      }
    } catch (e) {
      print('Error en base local (SQLite lleno/corrupto): $e');
      currentMap[stickerId]![variantId] = currentQty;
      state = AsyncData(currentMap);
    }
  }
}
