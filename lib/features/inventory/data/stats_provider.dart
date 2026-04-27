// Archivo: lib/features/inventory/data/stats_provider.dart

import 'package:album_26_sticker_collector/features/catalog/data/album_variant_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/data/stickers_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'inventory_provider.dart';

// 1. Total de cromos en la variante activa del álbum
final totalStickersCountProvider = FutureProvider<int>((ref) async {
  // allStickersProvider ya aplica el filtro de variante activa
  final stickers = await ref.watch(allStickersProvider.future);
  return stickers.length;
});

// 2. Cuántos cromos ÚNICOS tienes (solo los que pertenecen a la variante activa)
final uniqueCollectedProvider = Provider<int>((ref) {
  final inventoryAsync = ref.watch(inventoryProvider);
  final variantIds = ref.watch(activeVariantStickerIdsProvider).asData?.value;

  if (!inventoryAsync.hasValue || inventoryAsync.value == null) return 0;

  int uniqueCount = 0;

  inventoryAsync.value!.forEach((stickerId, variants) {
    // Si hay filtro de variante, ignorar stickers que no pertenezcan
    if (variantIds != null &&
        variantIds.isNotEmpty &&
        !variantIds.contains(stickerId)) {
      return;
    }

    int totalDeEsteCromo = 0;
    for (var qty in variants.values) {
      totalDeEsteCromo += qty;
    }

    if (totalDeEsteCromo > 0) uniqueCount++;
  });

  return uniqueCount;
});
