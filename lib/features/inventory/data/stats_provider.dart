// Archivo: lib/features/inventory/data/stats_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'inventory_provider.dart';
import '../../../main.dart';

// 1. Obtenemos el total de cromos que existen en el álbum (Se consulta 1 sola vez)
final totalStickersCountProvider = FutureProvider<int>((ref) async {
  final response = await supabase.from('stickers').select('id');
  return response.length;
});

// 2. Calculamos cuántos cromos ÚNICOS tienes (Se actualiza en tiempo real en memoria)
final uniqueCollectedProvider = Provider<int>((ref) {
  final inventoryAsync = ref.watch(inventoryProvider);

  if (!inventoryAsync.hasValue || inventoryAsync.value == null) return 0;

  int uniqueCount = 0;

  inventoryAsync.value!.forEach((stickerId, variants) {
    int totalDeEsteCromo = 0;
    variants.values.forEach((qty) => totalDeEsteCromo += qty);

    // Si la suma de sus variantes es mayor a 0, significa que lo tienes
    if (totalDeEsteCromo > 0) uniqueCount++;
  });

  return uniqueCount;
});
