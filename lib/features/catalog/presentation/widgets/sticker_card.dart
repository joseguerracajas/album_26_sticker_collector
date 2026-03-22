// Archivo: lib/features/catalog/presentation/widgets/sticker_card.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../inventory/data/inventory_provider.dart';
import '../../data/variants_provider.dart';
import '../../domain/sticker.dart';

class StickerCard extends ConsumerWidget {
  final Sticker sticker;

  const StickerCard({super.key, required this.sticker});

  Future<void> _confirmarBorrado(BuildContext context, WidgetRef ref) async {
    HapticFeedback.mediumImpact();
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF1E1E1E),
        title: const Text('¿Quitar cromo?'),
        content: Text(
          '¿Seguro que quieres quitar el cromo ${sticker.categoryId} ${sticker.stickerCode}?',
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
            SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
          );
        }
      }
    }
  }

  void _mostrarOpcionesAvanzadas(BuildContext context, WidgetRef ref) {
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
                    '${sticker.categoryId} ${sticker.stickerCode}',
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
    final inventoryAsync = ref.watch(inventoryProvider);
    final miInventario = inventoryAsync.value?[sticker.id] ?? {};
    final normales = miInventario['normal'] ?? 0;

    int totalCromos = 0;
    miInventario.values.forEach((cantidad) => totalCromos += cantidad);

    final tieneEspecial = miInventario.keys.any(
      (variante) => variante != 'normal' && miInventario[variante]! > 0,
    );

    return GestureDetector(
      onTap: () {
        if (totalCromos == 0) {
          HapticFeedback.lightImpact();
          ref.read(inventoryProvider.notifier).toggleNormalSticker(sticker.id);
        } else if (totalCromos == 1 && normales == 1) {
          _confirmarBorrado(context, ref);
        } else {
          _mostrarOpcionesAvanzadas(context, ref);
        }
      },
      onLongPress: () {
        HapticFeedback.heavyImpact();
        _mostrarOpcionesAvanzadas(context, ref);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: totalCromos > 0 ? Colors.amber : const Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(8),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    sticker.categoryId,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: totalCromos > 0 ? Colors.black : Colors.grey,
                    ),
                  ),
                  Text(
                    sticker.stickerCode,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: totalCromos > 0 ? Colors.black : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            if (tieneEspecial)
              const Positioned(
                top: 4,
                right: 4,
                child: Icon(Icons.star, color: Colors.white, size: 16),
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
                      color: Colors.white.withOpacity(0.3),
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
  }
}
