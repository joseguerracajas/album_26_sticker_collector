import 'package:album_26_sticker_collector/core/tutorial/global_collection_tutorial.dart';
import 'package:album_26_sticker_collector/core/tutorial/tutorial_service.dart';
import 'package:album_26_sticker_collector/features/catalog/data/categories_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/data/stickers_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/data/sync_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/domain/category.model.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/widgets/app_bar_actions.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/widgets/sticker_filter_search.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/widgets/sticker_grid.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/widgets/sticker_stat_row.dart';
import 'package:album_26_sticker_collector/features/catalog/utils/sticker_filters.dart';
import 'package:album_26_sticker_collector/features/inventory/data/inventory_provider.dart';
import 'package:album_26_sticker_collector/features/inventory/data/stats_provider.dart';
import 'package:album_26_sticker_collector/features/monetization/data/ads_provider.dart';
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'widgets/category_avatar.dart';

// ---------------------------------------------------------------------------
// Estado: set de IDs de categorías que el usuario ha colapsado
// ---------------------------------------------------------------------------
class _CollapsedCategoriesNotifier extends Notifier<Set<String>> {
  @override
  Set<String> build() => {};

  void toggle(String id) {
    final next = Set<String>.from(state);
    if (next.contains(id)) {
      next.remove(id);
    } else {
      next.add(id);
    }
    state = next;
  }

  bool isCollapsed(String id) => state.contains(id);
}

final _collapsedCategoriesProvider =
    NotifierProvider<_CollapsedCategoriesNotifier, Set<String>>(
      _CollapsedCategoriesNotifier.new,
    );

class GlobalCollectionScreen extends ConsumerStatefulWidget {
  const GlobalCollectionScreen({super.key});

  @override
  ConsumerState<GlobalCollectionScreen> createState() =>
      _GlobalCollectionScreenState();
}

class _GlobalCollectionScreenState
    extends ConsumerState<GlobalCollectionScreen> {
  double _pointerDownX = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      final done = await TutorialService.isStickerGridTutorialDone();
      if (!done && mounted) {
        // Esperar a que los cromos carguen y se renderice la primera card
        await Future.delayed(const Duration(milliseconds: 700));
        if (mounted) GlobalCollectionTutorial.show(context);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final categoriesAsync = ref.watch(categoriesProvider);

    return PrimaryScrollController(
      controller: _scrollController,
      child: Listener(
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
                key: const PageStorageKey('global_scroll'),
                primary: true,
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
                          delegate: SliverChildBuilderDelegate((
                            context,
                            index,
                          ) {
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
      ),
    );
  }
}

// Widget Interno
class _CategoryStickerSection extends ConsumerWidget {
  final Category category;
  final bool isFirst;
  const _CategoryStickerSection({required this.category, this.isFirst = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCollapsed = ref
        .watch(_collapsedCategoriesProvider)
        .contains(category.id);
    final stickersAsync = ref.watch(stickersByCategoryProvider(category.id));
    final inventoryAsync = ref.watch(inventoryProvider);
    final currentFilter = ref.watch(filterProvider);
    final searchQuery = ref.watch(stickerSearchProvider);
    final statsAsync = ref.watch(categoryStatsByIdProvider(category.id));

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

        final stats = statsAsync.asData?.value;

        return Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            key: PageStorageKey(category.id),
            initiallyExpanded: !isCollapsed,
            onExpansionChanged: (_) => ref
                .read(_collapsedCategoriesProvider.notifier)
                .toggle(category.id),
            tilePadding: const EdgeInsets.fromLTRB(20, 12, 16, 0),
            childrenPadding: EdgeInsets.zero,
            collapsedBackgroundColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            iconColor: Colors.white38,
            collapsedIconColor: Colors.white38,
            title: Row(
              children: [
                CategoryAvatar(iconUrl: category.iconUrl, text: category.name),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category.name,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      if (stats != null) ...[
                        const SizedBox(height: 5),
                        StickerStatRow(
                          collected: stats.collected,
                          total: stats.total,
                          missing: stats.missing,
                          duplicateCopies: stats.duplicateCopies,
                          collectedColor: Colors.amber,
                          missingColor: Colors.white54,
                          duplicatesColor: Colors.white38,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
            children: [
              StickerGrid(
                category: category,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                showTutorialKey: isFirst,
              ),
            ],
          ),
        );
      },
    );
  }
}
