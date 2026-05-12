import 'package:album_26_sticker_collector/core/tutorial/category_detail_tutorial.dart';
import 'package:album_26_sticker_collector/core/tutorial/tutorial_service.dart';
import 'package:album_26_sticker_collector/features/catalog/data/sync_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/domain/category.model.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/widgets/app_bar_actions.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/widgets/sticker_filter_search.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/widgets/sticker_grid.dart';
import 'package:album_26_sticker_collector/features/monetization/data/ads_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryDetailScreen extends ConsumerStatefulWidget {
  final Category category;

  const CategoryDetailScreen({super.key, required this.category});

  @override
  ConsumerState<CategoryDetailScreen> createState() =>
      _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends ConsumerState<CategoryDetailScreen> {
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
        await Future.delayed(const Duration(milliseconds: 600));
        if (mounted) CategoryDetailTutorial.show(context);
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
    final category = widget.category;
    return PrimaryScrollController(
      controller: _scrollController,
      child: Listener(
        onPointerDown: (event) => _pointerDownX = event.localPosition.dx,
        child: GestureDetector(
          // Detecta swipe desde el borde izquierdo para simular el gesto nativo de iOS.
          // OpenContainer no soporta InteractivePopGestureRecognizer.
          onHorizontalDragEnd: (details) {
            if (_pointerDownX < 30 &&
                details.primaryVelocity != null &&
                details.primaryVelocity! > 100) {
              Navigator.of(context).pop();
            }
          },
          child: Scaffold(
            backgroundColor: const Color(
              0xFF121212,
            ), // Manteniendo el fondo oscuro
            appBar: AppBar(
              title: Text(
                category.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
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

              child: CustomScrollView(
                key: const PageStorageKey('category_detail_scroll'),
                primary: true,
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  // 3. El buscador/filtros va en un SliverToBoxAdapter
                  const SliverToBoxAdapter(child: StickerFilterSearch()),

                  // 4. El Grid ya debe ser un SliverGrid nativo (modificamos StickerGrid)
                  // (Asegúrate de pasarle los parámetros correctos, quitamos el shrinkWrap)
                  SliverToBoxAdapter(
                    child: StickerGrid(
                      category: category,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      showTutorialKey: true,
                    ),
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
