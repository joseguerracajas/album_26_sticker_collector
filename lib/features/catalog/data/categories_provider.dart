// Archivo: lib/features/catalog/data/categories_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/category.dart';
import '../../../main.dart'; // Tu instancia de supabase

// Este provider trae la lista de países/categorías desde Supabase
final categoriesProvider = FutureProvider<List<Category>>((ref) async {
  final response = await supabase
      .from('categories') // Asumo que tu tabla se llama así
      .select()
      .order(
        'order_index',
        ascending: true,
      ); // Ordenamos alfabéticamente o por ID

  // Convertimos el JSON de Supabase a tu modelo Category
  return response.map((json) => Category.fromMap(json)).toList();
});
