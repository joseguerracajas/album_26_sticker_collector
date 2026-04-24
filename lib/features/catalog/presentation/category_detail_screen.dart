import 'package:album_26_sticker_collector/features/catalog/data/sync_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/domain/category.model.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/widgets/app_bar_actions.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/widgets/sticker_filter_search.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/widgets/sticker_grid.dart';
import 'package:album_26_sticker_collector/features/monetization/data/ads_provider.dart';
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryDetailScreen extends ConsumerWidget {
  final Category category;

  const CategoryDetailScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212), // Manteniendo el fondo oscuro
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
