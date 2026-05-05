// Archivo: lib/features/inventory/data/stats_provider.dart

import 'package:album_26_sticker_collector/features/catalog/data/album_variant_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/data/categories_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/data/stickers_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/domain/category.model.dart';
import 'package:album_26_sticker_collector/features/trade/data/trade_provider.dart';
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

// ---------------------------------------------------------------------------
// Modelo de estadísticas por categoría
// ---------------------------------------------------------------------------
class CategoryStats {
  final Category category;
  final int total;
  final int collected;
  final int missing;
  final int duplicateCopies;

  double get percentage => total == 0 ? 0.0 : collected / total;

  const CategoryStats({
    required this.category,
    required this.total,
    required this.collected,
    required this.missing,
    required this.duplicateCopies,
  });
}

// ---------------------------------------------------------------------------
// Provider: estadísticas por categoría (considera stickers reservados)
// ---------------------------------------------------------------------------
final categoryStatsProvider = FutureProvider<List<CategoryStats>>((ref) async {
  final categories = await ref.watch(categoriesProvider.future);
  final allStickers = await ref.watch(allStickersProvider.future);
  final inventoryAsync = ref.watch(inventoryProvider);
  final reservedCounts = await ref.watch(
    myReservedStickerCountsProvider.future,
  );

  if (!inventoryAsync.hasValue || inventoryAsync.value == null) return [];
  final inventory = inventoryAsync.value!;

  // Agrupar stickers por categoría una sola vez
  final Map<String, List<String>> stickerIdsByCategory = {};
  for (final sticker in allStickers) {
    stickerIdsByCategory
        .putIfAbsent(sticker.categoryId, () => [])
        .add(sticker.id);
  }

  return categories.map((category) {
    final stickerIds = stickerIdsByCategory[category.id] ?? [];
    int collected = 0;
    int duplicateCopies = 0;

    for (final stickerId in stickerIds) {
      final variants = inventory[stickerId] ?? {};
      int totalCopies = 0;
      for (var qty in variants.values) {
        totalCopies += qty;
      }
      if (totalCopies > 0) collected++;
      // Restar los reservados (que están en tránsito de entrega)
      final reserved = reservedCounts[stickerId] ?? 0;
      final availableCopies = totalCopies - reserved;
      if (availableCopies > 1) duplicateCopies += availableCopies - 1;
    }

    return CategoryStats(
      category: category,
      total: stickerIds.length,
      collected: collected,
      missing: stickerIds.length - collected,
      duplicateCopies: duplicateCopies,
    );
  }).toList();
});

// ---------------------------------------------------------------------------
// Provider: total de copias extras (repetidos)
// ---------------------------------------------------------------------------
final duplicateCopiesCountProvider = FutureProvider<int>((ref) async {
  final stats = await ref.watch(categoryStatsProvider.future);
  return stats.fold<int>(0, (sum, s) => sum + s.duplicateCopies);
});

// ---------------------------------------------------------------------------
// Provider: total de faltantes globales
// ---------------------------------------------------------------------------
final missingCountProvider = FutureProvider<int>((ref) async {
  final stats = await ref.watch(categoryStatsProvider.future);
  return stats.fold<int>(0, (sum, s) => sum + s.missing);
});

// ---------------------------------------------------------------------------
// Provider: estadísticas de UNA categoría por su id
// ---------------------------------------------------------------------------
final categoryStatsByIdProvider = FutureProvider.family<CategoryStats?, String>(
  (ref, categoryId) async {
    final stats = await ref.watch(categoryStatsProvider.future);
    try {
      return stats.firstWhere((s) => s.category.id == categoryId);
    } catch (_) {
      return null;
    }
  },
);
