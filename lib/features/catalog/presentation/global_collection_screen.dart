import 'package:album_26_sticker_collector/features/catalog/data/categories_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/data/stickers_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/data/sync_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/domain/category.model.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/widgets/sticker_filter_search.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/widgets/sticker_grid.dart';
import 'package:album_26_sticker_collector/features/catalog/utils/sticker_filters.dart';
import 'package:album_26_sticker_collector/features/inventory/data/inventory_provider.dart';
import 'package:album_26_sticker_collector/features/inventory/data/share_provider.dart';
import 'package:album_26_sticker_collector/features/inventory/presentation/scanner_screen.dart';
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'widgets/category_avatar.dart';

class GlobalCollectionScreen extends ConsumerWidget {
  const GlobalCollectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final categoriesAsync = ref.watch(categoriesProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: Text(
          l10n.globalCollectionTitle,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.document_scanner_outlined,
              color: Colors.amber,
            ),
            tooltip: l10n.homeScanButton,
            onPressed: () {
              HapticFeedback.heavyImpact();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ScannerScreen()),
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final isLoading = ref.watch(shareProvider);

              if (isLoading) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Center(
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                );
              }

              return PopupMenuButton<ShareType>(
                icon: const Icon(Icons.share, color: Colors.amber),
                color: const Color(0xFF1E1E1E),
                onSelected: (ShareType tipo) async {
                  try {
                    await ref
                        .read(shareProvider.notifier)
                        .generarYCompartirLista(context, tipo);
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(l10n.commonErrorWithMessage(e)),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
                },
                itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<ShareType>>[
                      PopupMenuItem<ShareType>(
                        value: ShareType.todos,
                        child: ListTile(
                          leading: Icon(Icons.list_alt, color: Colors.amber),
                          title: Text(
                            l10n.homeShareAll,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      PopupMenuItem<ShareType>(
                        value: ShareType.faltantes,
                        child: ListTile(
                          leading: Icon(Icons.close, color: Colors.redAccent),
                          title: Text(
                            l10n.homeShareMissingOnly,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      PopupMenuItem<ShareType>(
                        value: ShareType.repetidos,
                        child: ListTile(
                          leading: Icon(
                            Icons.repeat,
                            color: Colors.greenAccent,
                          ),
                          title: Text(
                            l10n.homeShareDuplicatesOnly,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
              );
            },
          ),
        ],
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
                    l10n.commonErrorWithMessage(e),
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
