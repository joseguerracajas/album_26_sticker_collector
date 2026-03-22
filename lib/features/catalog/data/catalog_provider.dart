// Archivo: lib/features/catalog/data/catalog_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../main.dart'; // Importamos la variable global 'supabase'
import '../domain/category.dart';

// FutureProvider es ideal para llamadas a bases de datos que ocurren una sola vez al cargar
final categoriesProvider = FutureProvider<List<Category>>((ref) async {
  // Hacemos el SELECT y le pedimos a Supabase que nos lo devuelva ordenado
  final response = await supabase
      .from('categories')
      .select()
      .order('order_index', ascending: true);

  // Convertimos la lista de JSON a una lista de objetos Category
  return response.map((json) => Category.fromMap(json)).toList();
});
