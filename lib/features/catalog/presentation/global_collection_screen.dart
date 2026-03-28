// Archivo: lib/features/catalog/presentation/global_collection_screen.dart

import 'package:album_26_sticker_collector/features/catalog/data/categories_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/data/stickers_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/domain/category.model.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/widgets/sticker_filter_search.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/widgets/sticker_grid.dart';
import 'package:album_26_sticker_collector/features/catalog/utils/sticker_filters.dart';
import 'package:album_26_sticker_collector/features/inventory/data/inventory_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'category_detail_screen.dart'; // Importamos para usar los Notifiers de Filtro y Búsqueda
import 'widgets/category_avatar.dart';

class GlobalCollectionScreen extends ConsumerWidget {
  const GlobalCollectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoriesProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text(
          'Colección Completa',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          StickerFilterSearch(ref: ref),
          Expanded(
            child: categoriesAsync.when(
              loading: () => const Center(
                child: CircularProgressIndicator(color: Colors.amber),
              ),
              error: (e, s) => Center(
                child: Text(
                  'Error: $e',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
              data: (categorias) {
                return ListView.builder(
                  padding: const EdgeInsets.only(bottom: 40),
                  itemCount: categorias.length,
                  itemBuilder: (context, index) {
                    return _CategoryStickerSection(category: categorias[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Widget Interno para cargar cada sección sin colapsar el rendimiento
class _CategoryStickerSection extends ConsumerWidget {
  final Category category;
  const _CategoryStickerSection({required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stickersAsync = ref.watch(stickersByCategoryProvider(category.id));
    final inventoryAsync = ref.watch(inventoryProvider);
    final currentFilter = ref.watch(filterProvider);
    final searchQuery = ref.watch(stickerSearchProvider);

    return stickersAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (e, s) => const SizedBox.shrink(),
      data: (stickers) {
        final filteredStickers = aplicarFiltrosCromos(
          stickers: stickers,
          inventarioGlobal: inventoryAsync.value ?? {},
          filtroActual: currentFilter,
          busqueda: searchQuery,
          category: category,
        );

        // Si la categoría no tiene cromos que coincidan con el filtro, la ocultamos entera
        if (filteredStickers.isEmpty) return const SizedBox.shrink();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 24),
              child: Row(
                children: [
                  CategoryAvatar(
                    iconUrl: category.iconUrl,
                    text: category.name,
                  ),
                  Text(
                    category.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Divider(color: Colors.grey.shade700),
            ),
            StickerGrid(
              category: category,
              ref: ref,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
            ),
          ],
        );
      },
    );
  }
}
