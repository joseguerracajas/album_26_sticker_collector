// Archivo: lib/features/catalog/presentation/global_collection_screen.dart

import 'package:album_26_sticker_collector/features/catalog/data/categories_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/data/stickers_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/domain/category.model.dart';
import 'package:album_26_sticker_collector/features/catalog/utils/sticker_filters.dart';
import 'package:album_26_sticker_collector/features/inventory/data/inventory_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'category_detail_screen.dart'; // Importamos para usar los Notifiers de Filtro y Búsqueda
import 'widgets/category_avatar.dart';
import 'widgets/sticker_card.dart';

class GlobalCollectionScreen extends ConsumerWidget {
  const GlobalCollectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoriesProvider);
    final currentFilter = ref.watch(filterProvider);
    final searchQuery = ref.watch(stickerSearchProvider);

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
          // FILTROS (Reutilizados)
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
            child: SizedBox(
              width: double.infinity,
              child: SegmentedButton<FilterOption>(
                style: SegmentedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  selectedBackgroundColor: Colors.amber.withOpacity(0.2),
                  selectedForegroundColor: Colors.amber,
                ),
                segments: const [
                  ButtonSegment(
                    value: FilterOption.todos,
                    label: Text('Todos'),
                  ),
                  ButtonSegment(
                    value: FilterOption.faltantes,
                    label: Text('Faltantes'),
                  ),
                  ButtonSegment(
                    value: FilterOption.repetidas,
                    label: Text('Repetidas'),
                  ),
                ],
                selected: {currentFilter},
                onSelectionChanged: (set) =>
                    ref.read(filterProvider.notifier).changeFilter(set.first),
              ),
            ),
          ),

          // BUSCADOR
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: TextField(
              onChanged: (val) =>
                  ref.read(stickerSearchProvider.notifier).updateQuery(val),
              style: const TextStyle(fontSize: 14, color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Buscar número...',
                hintStyle: TextStyle(color: Colors.grey.shade600),
                prefixIcon: const Icon(
                  Icons.search,
                  size: 20,
                  color: Colors.amber,
                ),
                filled: true,
                fillColor: const Color(0xFF1E1E1E),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 16,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(
                          Icons.close,
                          size: 18,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          ref
                              .read(stickerSearchProvider.notifier)
                              .updateQuery('');
                          FocusScope.of(context).unfocus();
                        },
                      )
                    : null,
              ),
            ),
          ),

          // LISTA GLOBAL
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
            GridView.builder(
              shrinkWrap: true, // Vital para usar GridView dentro de ListView
              physics:
                  const NeverScrollableScrollPhysics(), // Evita scroll doble
              padding: const EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.70,
              ),
              itemCount: filteredStickers.length,
              itemBuilder: (context, index) =>
                  StickerCard(sticker: filteredStickers[index]),
            ),
          ],
        );
      },
    );
  }
}
