// Archivo: lib/features/inventory/data/inventory_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../main.dart'; // Tu instancia de supabase

// Creamos un alias para no escribir "Map<String, Map<String, int>>" todo el tiempo.
// Estructura: { 'ECU_1': { 'normal': 1, 'legend': 0 } }
typedef InventoryMap = Map<String, Map<String, int>>;

final inventoryProvider =
    AsyncNotifierProvider<InventoryNotifier, InventoryMap>(() {
      return InventoryNotifier();
    });

class InventoryNotifier extends AsyncNotifier<InventoryMap> {
  @override
  Future<InventoryMap> build() async {
    final userId = supabase.auth.currentUser!.id;
    // Ahora pedimos también el variant_id
    final response = await supabase
        .from('inventory')
        .select('sticker_id, variant_id, quantity')
        .eq('user_id', userId);

    final InventoryMap inventoryMap = {};

    for (var row in response) {
      final stickerId = row['sticker_id'] as String;
      final variantId = row['variant_id'] as String;
      final quantity = row['quantity'] as int;

      // Si es el primer cromo de este ID, inicializamos su mapa interno
      if (!inventoryMap.containsKey(stickerId)) {
        inventoryMap[stickerId] = {};
      }

      // Guardamos la cantidad de esa variante específica
      inventoryMap[stickerId]![variantId] = quantity;
    }

    return inventoryMap;
  }

  // El toque rápido de la cuadrícula: SIEMPRE afecta al cromo 'normal'
  Future<void> toggleNormalSticker(String stickerId) async {
    if (!state.hasValue) return;

    final userId = supabase.auth.currentUser!.id;

    // Hacemos una copia profunda del mapa para que la pantalla se actualice al instante
    final currentMap = Map<String, Map<String, int>>.from(
      state.value!.map(
        (key, value) => MapEntry(key, Map<String, int>.from(value)),
      ),
    );

    // Si no existía en el mapa, lo preparamos
    if (!currentMap.containsKey(stickerId)) {
      currentMap[stickerId] = {};
    }

    // Vemos cuántos cromos NORMALES tiene
    final currentNormalQty = currentMap[stickerId]!['normal'] ?? 0;
    final isAdding = currentNormalQty == 0;

    // Actualizamos la UI al instante (Gris <-> Dorado)
    currentMap[stickerId]!['normal'] = isAdding ? 1 : 0;
    state = AsyncData(currentMap);

    // Guardado en Supabase (solo de la variante normal)
    try {
      if (isAdding) {
        await supabase.from('inventory').insert({
          'user_id': userId,
          'sticker_id': stickerId,
          'variant_id': 'normal',
          'quantity': 1,
        });
      } else {
        await supabase
            .from('inventory')
            .delete()
            .eq('user_id', userId)
            .eq('sticker_id', stickerId)
            .eq('variant_id', 'normal');
      }
    } catch (e) {
      print('Error al guardar: $e');
      // Revertimos si falla
      currentMap[stickerId]!['normal'] = currentNormalQty;
      state = AsyncData(currentMap);
    }
  }

  // Función para sumar (+1) o restar (-1) cualquier variante desde el Bottom Sheet
  Future<void> updateVariantQuantity(
    String stickerId,
    String variantId,
    int delta,
  ) async {
    if (!state.hasValue) return;

    final userId = supabase.auth.currentUser!.id;

    // Copia profunda del estado actual para la UI optimista
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

    // No podemos tener cantidades negativas
    if (newQty < 0) return;

    // 1. Actualizamos la pantalla al instante
    currentMap[stickerId]![variantId] = newQty;
    state = AsyncData(currentMap);

    // 2. Guardamos en Supabase en segundo plano
    try {
      if (newQty == 0) {
        // Si bajó a 0, borramos el registro
        await supabase
            .from('inventory')
            .delete()
            .eq('user_id', userId)
            .eq('sticker_id', stickerId)
            .eq('variant_id', variantId);
      } else if (currentQty == 0 && newQty == 1) {
        // Si no lo teníamos y subió a 1, insertamos
        await supabase.from('inventory').insert({
          'user_id': userId,
          'sticker_id': stickerId,
          'variant_id': variantId,
          'quantity': 1,
        });
      } else {
        // Si ya existía y solo cambió la cantidad, actualizamos
        await supabase
            .from('inventory')
            .update({'quantity': newQty})
            .eq('user_id', userId)
            .eq('sticker_id', stickerId)
            .eq('variant_id', variantId);
      }
    } catch (e) {
      print('Error al actualizar cantidad: $e');
      // Si falla, revertimos al número anterior
      currentMap[stickerId]![variantId] = currentQty;
      state = AsyncData(currentMap);
    }
  }
}
