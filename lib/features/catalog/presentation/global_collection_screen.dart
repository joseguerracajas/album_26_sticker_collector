import 'package:album_26_sticker_collector/core/tutorial/global_collection_tutorial.dart';
import 'package:album_26_sticker_collector/core/tutorial/tutorial_service.dart';
import 'package:album_26_sticker_collector/features/catalog/data/categories_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/data/stickers_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/data/sync_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/domain/category.model.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/widgets/app_bar_actions.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/widgets/sticker_filter_search.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/widgets/sticker_grid.dart';
import 'package:album_26_sticker_collector/features/catalog/utils/sticker_filters.dart';
import 'package:album_26_sticker_collector/features/inventory/data/inventory_provider.dart';
import 'package:album_26_sticker_collector/features/monetization/data/ads_provider.dart';
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'widgets/category_avatar.dart';

class GlobalCollectionScreen extends ConsumerStatefulWidget {
  const GlobalCollectionScreen({super.key});

  @override
  ConsumerState<GlobalCollectionScreen> createState() =>
      _GlobalCollectionScreenState();
}

class _GlobalCollectionScreenState
    extends ConsumerState<GlobalCollectionScreen> {
  double _pointerDownX = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      final done = await TutorialService.isGlobalTutorialDone();
      if (!done && mounted) {
        GlobalCollectionTutorial.show(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final categoriesAsync = ref.watch(categoriesProvider);

    return Listener(
      onPointerDown: (event) => _pointerDownX = event.localPosition.dx,
      child: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (_pointerDownX < 30 &&
              details.primaryVelocity != null &&
              details.primaryVelocity! > 100) {
            Navigator.of(context).pop();
          }
        },
        child: Scaffold(
          backgroundColor: const Color(0xFF121212),
          appBar: AppBar(
            title: Text(
              l10n.globalCollectionTitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: const [ScannerIconButton(), ShareMenuButton()],
          ),
          bottomNavigationBar: const AdBannerWidget(),
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
                            isFirst: index == 0,
                          );
                        }, childCount: categorias.length),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Widget Interno (Se queda exactamente igual, como un widget normal)
class _CategoryStickerSection extends ConsumerWidget {
  final Category category;
  final bool isFirst;
  const _CategoryStickerSection({required this.category, this.isFirst = false});

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
              showTutorialKey: isFirst,
            ),
          ],
        );
      },
    );
  }
}
