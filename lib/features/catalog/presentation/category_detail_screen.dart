import 'package:album_26_sticker_collector/features/catalog/data/sync_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/domain/category.model.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/widgets/sticker_filter_search.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/widgets/sticker_grid.dart';
import 'package:album_26_sticker_collector/features/inventory/data/share_provider.dart';
import 'package:album_26_sticker_collector/features/inventory/presentation/scanner_screen.dart';
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryDetailScreen extends ConsumerWidget {
  final Category category;

  const CategoryDetailScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFF121212), // Manteniendo el fondo oscuro
      appBar: AppBar(
        title: Text(
          category.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
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
