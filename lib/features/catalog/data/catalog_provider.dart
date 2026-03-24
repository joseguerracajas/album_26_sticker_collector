// Archivo: lib/features/catalog/data/catalog_provider.dart

import 'package:album_26_sticker_collector/brick/app_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/category.dart';

// FutureProvider es ideal para llamadas a bases de datos que ocurren una sola vez al cargar
final categoriesProvider = FutureProvider<List<Category>>((ref) async {
  // Hacemos el SELECT y le pedimos a Supabase que nos lo devuelva ordenado
  final response = await AppRepository().get<Category>();
  response.sort((a, b) => a.orderIndex.compareTo(b.orderIndex));
  // Convertimos la lista de JSON a una lista de objetos Category
  return response;
});
