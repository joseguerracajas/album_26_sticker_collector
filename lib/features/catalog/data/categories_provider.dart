// Archivo: lib/features/catalog/data/categories_provider.dart

import 'package:album_26_sticker_collector/brick/app_repository.dart';
import 'package:album_26_sticker_collector/features/catalog/domain/category.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Este provider trae la lista de países/categorías desde Supabase
final categoriesProvider = FutureProvider<List<Category>>((ref) async {
  final response = await AppRepository().get<Category>();

  // 2. Las ordenas usando Dart puro (basado en tu propiedad orderIndex)
  response.sort((a, b) => a.orderIndex.compareTo(b.orderIndex));

  // Convertimos el JSON de Supabase a tu modelo Category
  return response;
});
