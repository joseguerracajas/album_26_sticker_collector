import 'package:album_26_sticker_collector/brick/app_repository.dart';
import 'package:album_26_sticker_collector/features/catalog/data/album_variant_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/domain/sticker.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Usamos .family para poder pasarle un parámetro (el categoryId) al provider

final allStickersProvider = FutureProvider<List<Sticker>>((ref) async {
  final allStickers = await AppRepository().get<Sticker>();
  final variantIds = await ref.watch(activeVariantStickerIdsProvider.future);
  // Si hay una variante activa con stickers definidos, filtramos por ella
  if (variantIds != null && variantIds.isNotEmpty) {
    return allStickers.where((s) => variantIds.contains(s.id)).toList();
  }
  return allStickers;
});

final stickersByCategoryProvider = FutureProvider.family<List<Sticker>, String>(
  (ref, categoryId) async {
    final allStickers = await AppRepository().get<Sticker>();
    final variantIds = await ref.watch(activeVariantStickerIdsProvider.future);

    // Filtrar por categoría
    var categoryStickers = allStickers
        .where((sticker) => sticker.categoryId == categoryId)
        .toList();

    // Si la variante activa restringe stickers, aplicar ese filtro también
    if (variantIds != null && variantIds.isNotEmpty) {
      categoryStickers = categoryStickers
          .where((s) => variantIds.contains(s.id))
          .toList();
    }

    categoryStickers.sort((a, b) => a.orderIndex.compareTo(b.orderIndex));
    return categoryStickers;
  },
);
