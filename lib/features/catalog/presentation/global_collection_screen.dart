import 'package:album_26_sticker_collector/features/catalog/data/categories_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/data/stickers_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/data/sync_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/domain/category.model.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/widgets/sticker_filter_search.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/widgets/sticker_grid.dart';
import 'package:album_26_sticker_collector/features/catalog/utils/sticker_filters.dart';
import 'package:album_26_sticker_collector/features/inventory/data/inventory_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
        elevation: 0,
      ),
      body: RefreshIndicator(
        color: Colors.amber,
        backgroundColor: const Color(0xFF1E1E1E),
        onRefresh: ref.read(syncServiceProvider).refreshAll,

        // 🔥 1. CAMBIAMOS A CustomScrollView
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            // 🔥 2. El Buscador y Filtros van en un adaptador Sliver
            const SliverToBoxAdapter(child: StickerFilterSearch()),

            // 🔥 3. Las categorías se renderizan como Slivers (Lazy Loading)
            categoriesAsync.when(
              loading: () => const SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(32.0),
                    child: CircularProgressIndicator(color: Colors.amber),
                  ),
                ),
              ),
              error: (e, s) => SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    'Error: $e',
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              ),
              data: (categorias) {
                // SliverList asegura que Flutter SOLO construya los países visibles
                return SliverPadding(
                  padding: const EdgeInsets.only(bottom: 40),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return _CategoryStickerSection(
                        category: categorias[index],
                      );
                    }, childCount: categorias.length),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Widget Interno (Se queda exactamente igual, como un widget normal)
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

        if (filteredStickers.isEmpty) return const SizedBox.shrink();

        // Este Column es una "Caja" normal
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      category.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Divider(color: Colors.grey.shade700),
            ),

            // 🔥 SOLUCIÓN: El StickerGrid entra directo como una Caja normal
            // No usamos SliverToBoxAdapter aquí porque el Column no lo acepta.
            StickerGrid(
              category: category,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ],
        );
      },
    );
  }
}
