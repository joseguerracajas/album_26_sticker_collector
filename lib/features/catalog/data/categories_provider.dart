// Archivo: lib/features/catalog/data/categories_provider.dart

import 'package:album_26_sticker_collector/brick/app_repository.dart';
import 'package:album_26_sticker_collector/features/catalog/data/stickers_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/domain/category.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Este provider trae la lista de países/categorías desde Supabase
final categoriesProvider = FutureProvider<List<Category>>((ref) async {
  var response = await AppRepository().get<Category>();

  response.sort((a, b) => a.orderIndex.compareTo(b.orderIndex));

  // allStickersProvider ya aplica el filtro de variante activa y está
  // cacheado por Riverpod (lo observa totalStickersCountProvider en HomeScreen).
  // Extraemos los categoryId de los stickers activos para filtrar categorías
  // vacías sin ninguna petición adicional.
  final activeStickers = await ref.watch(allStickersProvider.future);
  final activeCategoryIds = activeStickers.map((s) => s.categoryId).toSet();

  // Si hay restricción de variante, solo mostrar categorías con stickers activos
  if (activeCategoryIds.isNotEmpty) {
    response = response.where((c) => activeCategoryIds.contains(c.id)).toList();
  }

  return response;
});
