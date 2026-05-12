import 'package:album_26_sticker_collector/features/catalog/data/catalog_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/data/stickers_provider.dart';
import 'package:album_26_sticker_collector/features/inventory/data/inventory_provider.dart';
import 'package:album_26_sticker_collector/features/inventory/data/pending_remove_provider.dart';
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RemoveDuplicatesSheet extends ConsumerStatefulWidget {
  const RemoveDuplicatesSheet({super.key});

  @override
  ConsumerState<RemoveDuplicatesSheet> createState() =>
      _RemoveDuplicatesSheetState();
}

class _RemoveDuplicatesSheetState extends ConsumerState<RemoveDuplicatesSheet> {
  bool _isSaving = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final pendingRemove = ref.watch(pendingRemoveProvider);

    final stickersAsync = ref.watch(allStickersProvider);
    final categoriesAsync = ref.watch(categoriesProvider);
    final inventory = ref.watch(inventoryProvider).asData?.value ?? {};

    final Map<String, String> labelMap = {};
    stickersAsync.whenData((stickers) {
      categoriesAsync.whenData((cats) {
        final emojiMap = {for (final c in cats) c.id: c.emoji};
        for (final s in stickers) {
          final emoji = emojiMap[s.categoryId] ?? '';
          labelMap[s.id] = '$emoji ${s.categoryId} ${s.stickerCode}';
        }
      });
    });

    return Container(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 32),
      decoration: const BoxDecoration(
        color: Color(0xFF1E1E1E),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade600,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.removeDuplicatesTitle,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          if (pendingRemove.isEmpty)
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text(
                l10n.removeDuplicatesEmpty,
                style: const TextStyle(color: Colors.grey),
              ),
            )
          else
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: pendingRemove.length,
                itemBuilder: (context, index) {
                  final code = pendingRemove.keys.elementAt(index);
                  final quantityToRemove = pendingRemove[code]!;
                  final inventoryQty = (inventory[code] ?? {}).values.fold(
                    0,
                    (s, q) => s + q,
                  );
                  // Repetidos disponibles = total en inventario - 1 (el pegado)
                  final maxRemovable = (inventoryQty - 1).clamp(
                    0,
                    inventoryQty,
                  );

                  return Card(
                    color: Colors.black45,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      title: Text(
                        labelMap[code] ?? code,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: _RemoveStatusBadge(
                        quantityToRemove: quantityToRemove,
                        inventoryQty: inventoryQty,
                        maxRemovable: maxRemovable,
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(
                              quantityToRemove == 1
                                  ? Icons.delete_outline
                                  : Icons.remove_circle_outline,
                              color: quantityToRemove == 1
                                  ? Colors.redAccent
                                  : Colors.orangeAccent,
                            ),
                            onPressed: () => ref
                                .read(pendingRemoveProvider.notifier)
                                .decrement(code),
                          ),
                          SizedBox(
                            width: 24,
                            child: Text(
                              '$quantityToRemove',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.add_circle_outline,
                              color: quantityToRemove >= maxRemovable
                                  ? Colors.grey
                                  : Colors.orangeAccent,
                            ),
                            onPressed: quantityToRemove >= maxRemovable
                                ? null
                                : () => ref
                                      .read(pendingRemoveProvider.notifier)
                                      .increment(code),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: pendingRemove.isEmpty || _isSaving
                  ? null
                  : () async {
                      setState(() => _isSaving = true);
                      HapticFeedback.mediumImpact();

                      final navigator = Navigator.of(context);
                      final messenger = ScaffoldMessenger.of(context);

                      // Snapshot del mapa antes del proceso asíncrono
                      final snapshot = Map<String, int>.from(pendingRemove);

                      try {
                        final inventoryNotifier = ref.read(
                          inventoryProvider.notifier,
                        );
                        final currentInventory =
                            ref.read(inventoryProvider).asData?.value ?? {};

                        for (final entry in snapshot.entries) {
                          final stickerId = entry.key;
                          final delta = entry.value;
                          final inventoryQty =
                              (currentInventory[stickerId] ?? {}).values.fold(
                                0,
                                (s, q) => s + q,
                              );
                          final maxRemovable = (inventoryQty - 1).clamp(
                            0,
                            inventoryQty,
                          );
                          // Quitar como máximo los repetidos disponibles
                          final safeQty = delta.clamp(0, maxRemovable);
                          if (safeQty > 0) {
                            await inventoryNotifier.updateVariantQuantity(
                              stickerId,
                              'normal',
                              -safeQty,
                            );
                          }
                        }

                        ref.read(pendingRemoveProvider.notifier).clear();
                        navigator.pop();

                        messenger.showSnackBar(
                          SnackBar(
                            content: Text(
                              l10n.removeDuplicatesSavedSuccess(
                                snapshot.length,
                              ),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            backgroundColor: Colors.orangeAccent,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        );
                      } catch (e) {
                        if (mounted) setState(() => _isSaving = false);
                        messenger.showSnackBar(
                          SnackBar(
                            content: Text(
                              l10n.removeDuplicatesSaveError(e.toString()),
                            ),
                            backgroundColor: Colors.redAccent,
                          ),
                        );
                      }
                    },
              child: _isSaving
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        color: Colors.black,
                      ),
                    )
                  : Text(
                      l10n.commonDone,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RemoveStatusBadge extends StatelessWidget {
  const _RemoveStatusBadge({
    required this.quantityToRemove,
    required this.inventoryQty,
    required this.maxRemovable,
  });

  final int quantityToRemove;
  final int inventoryQty;
  final int maxRemovable;

  @override
  Widget build(BuildContext context) {
    final remaining = inventoryQty - quantityToRemove;
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Text(
        'En inventario: $inventoryQty  →  Quedará: $remaining',
        style: TextStyle(
          color: remaining <= 1 ? Colors.orangeAccent : Colors.grey.shade400,
          fontSize: 12,
        ),
      ),
    );
  }
}
