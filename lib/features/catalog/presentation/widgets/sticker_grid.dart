import 'package:album_26_sticker_collector/features/catalog/data/stickers_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/data/variants_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/domain/category.model.dart';
import 'package:album_26_sticker_collector/features/catalog/domain/sticker.model.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/widgets/animated_sticker_card.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/widgets/app_bar_actions.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/widgets/sticker_filter_search.dart';
import 'package:album_26_sticker_collector/features/catalog/utils/sticker_filters.dart';
import 'package:album_26_sticker_collector/features/inventory/data/inventory_provider.dart';
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StickerGrid extends ConsumerWidget {
  final Category category;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  const StickerGrid({
    super.key,
    required this.category,
    this.shrinkWrap = false,
    this.physics,
  });

  Future<void> _confirmarBorrado(
    BuildContext context,
    WidgetRef ref,
    Sticker sticker,
  ) async {
    final l10n = AppLocalizations.of(context);
    final stickerLabel = '${category.id} ${sticker.stickerCode}';

    final confirmar = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF1E1E1E),
        title: Text(l10n.stickerRemoveTitle),
        content: Text(l10n.stickerRemoveConfirm(stickerLabel)),
        actions: const [ScannerIconButton(), ShareMenuButton()],
      ),
    );

    if (confirmar == true) {
      await ref
          .read(inventoryProvider.notifier)
          .toggleNormalSticker(sticker.id);
    }
  }

  // 2. BOTTOM SHEET OPCIONES AVANZADAS
  void _mostrarOpcionesAvanzadas(
    BuildContext context,
    WidgetRef ref,
    Sticker sticker,
  ) {
    final l10n = AppLocalizations.of(context);
    final inventoryAsync = ref.read(inventoryProvider);
    final inventarioOriginal = inventoryAsync.value?[sticker.id] ?? {};
    final inventarioTemporal = Map<String, int>.from(inventarioOriginal);

    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1E1E1E),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(ctx).padding.bottom + 20,
                top: 24,
                left: 24,
                right: 24,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${category.id} ${sticker.stickerCode}',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Consumer(
                    builder: (context, watchRef, child) {
                      return watchRef
                          .watch(variantsProvider)
                          .when(
                            loading: () => const CircularProgressIndicator(
                              color: Colors.amber,
                            ),
                            error: (e, s) => Text(
                              l10n.commonErrorWithMessage(e),
                              style: const TextStyle(color: Colors.red),
                            ),
                            data: (variantesBDD) {
                              final variantesParaMostrar =
                                  sticker.hasSpecialVariants
                                  ? variantesBDD // Si el cromo es especial, mostramos TODA la lista
                                  : variantesBDD.where((v) {
                                      return !(v.isSpecial ?? false);
                                    }).toList();
                              return Column(
                                children: variantesParaMostrar.map((variante) {
                                  final cantidadActual =
                                      inventarioTemporal[variante.id] ?? 0;
                                  Color iconColor = Color(
                                    int.parse(
                                      variante.hexColor.replaceFirst(
                                        '#',
                                        '0xFF',
                                      ),
                                    ),
                                  );

                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: iconColor,
                                              size: 20,
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              variante.name,
                                              style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              icon: const Icon(
                                                Icons.remove_circle_outline,
                                                size: 32,
                                              ),
                                              color: cantidadActual > 0
                                                  ? Colors.red.shade300
                                                  : Colors.grey.shade800,
                                              onPressed: cantidadActual > 0
                                                  ? () => setModalState(
                                                      () =>
                                                          inventarioTemporal[variante
                                                                  .id] =
                                                              cantidadActual -
                                                              1,
                                                    )
                                                  : null,
                                            ),
                                            SizedBox(
                                              width: 40,
                                              child: Text(
                                                '$cantidadActual',
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              icon: const Icon(
                                                Icons.add_circle,
                                                size: 32,
                                              ),
                                              color: Colors.amber,
                                              onPressed: () => setModalState(
                                                () =>
                                                    inventarioTemporal[variante
                                                            .id] =
                                                        cantidadActual + 1,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              );
                            },
                          );
                    },
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () => Navigator.pop(ctx),
                    child: Text(
                      l10n.commonDone,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    ).then((_) {
      inventarioTemporal.forEach((variantId, nuevaCantidad) {
        final cantidadVieja = inventarioOriginal[variantId] ?? 0;
        if (nuevaCantidad != cantidadVieja) {
          ref
              .read(inventoryProvider.notifier)
              .updateVariantQuantity(
                sticker.id,
                variantId,
                nuevaCantidad - cantidadVieja,
              );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final stickersAsync = ref.watch(stickersByCategoryProvider(category.id));
    final inventoryAsync = ref.watch(inventoryProvider);
    final currentFilter = ref.watch(filterProvider);
    final searchQuery = ref.watch(stickerSearchProvider);

    final stickers =
        stickersAsync.maybeWhen(data: (stickers) => stickers, orElse: () => [])
            as List<Sticker>;
    final filteredStickers = aplicarFiltrosCromos(
      stickers: stickers,
      inventarioGlobal: inventoryAsync.value ?? {},
      filtroActual: currentFilter,
      busqueda: searchQuery,
      category: category,
    );

    final gridWidget = AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: filteredStickers.isEmpty
          ? Center(
              key: const ValueKey('empty'),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Text(
                  l10n.gridNoResults,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            )
          : GridView.builder(
              key: ValueKey(
                '${category.id}_${currentFilter}_${filteredStickers.length}',
              ), // Clave dinámica para forzar la animación
              shrinkWrap: shrinkWrap,
              physics: physics,
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.70,
              ),
              itemCount: filteredStickers.length,
              itemBuilder: (context, index) {
                final sticker = filteredStickers[index];
                final miInv = inventoryAsync.value?[sticker.id] ?? {};
                final total = miInv.values.fold(0, (sum, val) => sum + val);
                final tieneEsp = miInv.keys.any(
                  (v) => v != 'normal' && miInv[v]! > 0,
                );

                return AnimatedStickerCard(
                  key: ValueKey(sticker.id),
                  sticker: sticker,
                  totalCromos: total,
                  tieneEspecial: tieneEsp,
                  onTap: () {
                    if (total == 0) {
                      ref
                          .read(inventoryProvider.notifier)
                          .toggleNormalSticker(sticker.id);
                    } else if (total == 1 && (miInv['normal'] ?? 0) == 1) {
                      _confirmarBorrado(context, ref, sticker);
                    } else {
                      _mostrarOpcionesAvanzadas(context, ref, sticker);
                    }
                  },
                  onLongPress: () =>
                      _mostrarOpcionesAvanzadas(context, ref, sticker),
                );
              },
            ),
    );

    // Si shrinkWrap es true, significa que alguien más (como el CustomScrollView)
    // está controlando el tamaño. Si es false, usamos Expanded para llenar la pantalla.
    return shrinkWrap ? gridWidget : Expanded(child: gridWidget);
  }
}
