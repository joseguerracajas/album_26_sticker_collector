// Archivo: lib/features/catalog/presentation/category_detail_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../inventory/data/inventory_provider.dart';
import '../data/variants_provider.dart';
import '../domain/category.dart';
import '../domain/sticker.dart';
import '../data/stickers_provider.dart';
import '../utils/sticker_filters.dart';

// --- ESTADOS (RIVERPOD 2.0 MODERN) ---

enum FilterOption { todos, faltantes, repetidas }

class FilterNotifier extends Notifier<FilterOption> {
  @override
  FilterOption build() => FilterOption.todos;
  void changeFilter(FilterOption newFilter) => state = newFilter;
}

final filterProvider = NotifierProvider<FilterNotifier, FilterOption>(
  FilterNotifier.new,
);

class StickerSearchNotifier extends Notifier<String> {
  @override
  String build() => '';
  void updateQuery(String query) => state = query;
}

final stickerSearchProvider = NotifierProvider<StickerSearchNotifier, String>(
  StickerSearchNotifier.new,
);

// -----------------------------------------------

class CategoryDetailScreen extends ConsumerWidget {
  final Category category;

  const CategoryDetailScreen({super.key, required this.category});

  // 1. ALERTA DE BORRADO SEGURO (MANTENIENDO TU DISEÑO)
  Future<void> _confirmarBorrado(
    BuildContext context,
    WidgetRef ref,
    Sticker sticker,
  ) async {
    HapticFeedback.mediumImpact();

    final confirmar = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF1E1E1E),
        title: const Text('¿Quitar cromo?'),
        content: Text(
          '¿Seguro que quieres quitar el cromo ${category.id} ${sticker.stickerCode}?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancelar', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              HapticFeedback.lightImpact();
              Navigator.pop(ctx, true);
            },
            child: const Text('Quitar', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );

    if (confirmar == true) {
      try {
        await ref
            .read(inventoryProvider.notifier)
            .toggleNormalSticker(sticker.id);
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error de conexión: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  // 2. BOTTOM SHEET (MANTENIENDO TU LÓGICA DE BATCH UPDATES)
  void _mostrarOpcionesAvanzadas(
    BuildContext context,
    WidgetRef ref,
    Sticker sticker,
  ) {
    HapticFeedback.selectionClick();

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
                              'Error: $e',
                              style: const TextStyle(color: Colors.red),
                            ),
                            data: (variantesBDD) {
                              return Column(
                                children: variantesBDD.map((variante) {
                                  final variantId = variante['id'] as String;
                                  final variantName =
                                      variante['name'] as String;
                                  final cantidadActual =
                                      inventarioTemporal[variantId] ?? 0;

                                  Color iconColor = Colors.white;
                                  if (variantId == 'legend')
                                    iconColor = Colors.amber;
                                  if (variantId == 'gold')
                                    iconColor = const Color(0xFFFFD700);

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
                                              variantName,
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
                                                  ? () {
                                                      HapticFeedback.lightImpact();
                                                      setModalState(
                                                        () =>
                                                            inventarioTemporal[variantId] =
                                                                cantidadActual -
                                                                1,
                                                      );
                                                    }
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
                                              onPressed: () {
                                                HapticFeedback.lightImpact();
                                                setModalState(
                                                  () =>
                                                      inventarioTemporal[variantId] =
                                                          cantidadActual + 1,
                                                );
                                              },
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
                    child: const Text(
                      'LISTO',
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
          final diferencia = nuevaCantidad - cantidadVieja;
          ref
              .read(inventoryProvider.notifier)
              .updateVariantQuantity(sticker.id, variantId, diferencia);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stickersAsync = ref.watch(stickersByCategoryProvider(category.id));
    final inventoryAsync = ref.watch(inventoryProvider);
    final currentFilter = ref.watch(filterProvider);
    final searchQuery = ref.watch(stickerSearchProvider);

    return Scaffold(
      appBar: AppBar(title: Text(category.name)),
      body: stickersAsync.when(
        loading: () =>
            const Center(child: CircularProgressIndicator(color: Colors.amber)),
        error: (error, stack) => Center(child: Text('Error: $error')),
        data: (stickers) {
          if (stickers.isEmpty)
            return const Center(child: Text('No hay cromos.'));

          // LÓGICA DE FILTRADO COMBINADA
          final filteredStickers = aplicarFiltrosCromos(
            stickers: stickers,
            inventarioGlobal: inventoryAsync.value ?? {},
            filtroActual: currentFilter,
            busqueda: searchQuery,
            category: category,
          );

          return Column(
            children: [
              // LOS BOTONES DEL FILTRO (TU SEGMENTED BUTTON)
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
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
                    onSelectionChanged: (set) => ref
                        .read(filterProvider.notifier)
                        .changeFilter(set.first),
                  ),
                ),
              ),

              // EL BUSCADOR (NUEVO ELEMENTO INTEGRADO)
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
                    // --- NUEVO HINT TEXT ---
                    hintText: 'Buscar país, código o número...',
                    hintStyle: TextStyle(color: Colors.grey.shade600),
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 20,
                      color: Colors.amber,
                    ),
                    filled: true,
                    fillColor: const Color(0xFF1E1E1E),
                    // Le damos un poco de respiro al padding para que no se rompa el LongPress
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
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

              // LA CUADRÍCULA (RESPETANDO TU DISEÑO EXACTO)
              Expanded(
                child: filteredStickers.isEmpty
                    ? const Center(
                        child: Text(
                          'Sin resultados.',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      )
                    : GridView.builder(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 0.70, // TU RATIO ORIGINAL
                            ),
                        itemCount: filteredStickers.length,
                        itemBuilder: (context, index) {
                          final sticker = filteredStickers[index];
                          final miInventario =
                              inventoryAsync.value?[sticker.id] ?? {};
                          final normales = miInventario['normal'] ?? 0;

                          int totalCromos = 0;
                          miInventario.values.forEach(
                            (cantidad) => totalCromos += cantidad,
                          );

                          final tieneEspecial = miInventario.keys.any(
                            (variante) =>
                                variante != 'normal' &&
                                miInventario[variante]! > 0,
                          );

                          return GestureDetector(
                            onTap: () {
                              if (totalCromos == 0) {
                                HapticFeedback.lightImpact();
                                ref
                                    .read(inventoryProvider.notifier)
                                    .toggleNormalSticker(sticker.id);
                              } else if (totalCromos == 1 && normales == 1) {
                                _confirmarBorrado(context, ref, sticker);
                              } else {
                                _mostrarOpcionesAvanzadas(
                                  context,
                                  ref,
                                  sticker,
                                );
                              }
                            },
                            onLongPress: () {
                              HapticFeedback.heavyImpact();
                              _mostrarOpcionesAvanzadas(context, ref, sticker);
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              decoration: BoxDecoration(
                                color: totalCromos > 0
                                    ? Colors.amber
                                    : const Color(0xFF2A2A2A),
                                borderRadius: BorderRadius.circular(
                                  8,
                                ), // TU RADIO ORIGINAL
                                border: Border.all(
                                  color: totalCromos > 0
                                      ? Colors.amber.shade700
                                      : Colors.grey.shade800,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          sticker.categoryId,
                                          style: TextStyle(
                                            fontSize:
                                                22, // Tamaño original destacado
                                            fontWeight: FontWeight.bold,
                                            color: totalCromos > 0
                                                ? Colors.black
                                                : Colors.grey,
                                          ),
                                        ),
                                        Text(
                                          sticker.stickerCode,
                                          style: TextStyle(
                                            fontSize:
                                                22, // Tamaño original destacado
                                            fontWeight: FontWeight.bold,
                                            color: totalCromos > 0
                                                ? Colors.black
                                                : Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (tieneEspecial)
                                    const Positioned(
                                      top: 4,
                                      right: 4,
                                      child: Icon(
                                        Icons.star,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                    ),
                                  if (totalCromos > 0)
                                    Positioned(
                                      bottom: 6,
                                      left: 0,
                                      right: 0,
                                      child: Center(
                                        child: Container(
                                          padding: const EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(
                                              0.3,
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Text(
                                            '$totalCromos',
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
