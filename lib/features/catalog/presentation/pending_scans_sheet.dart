import 'package:album_26_sticker_collector/features/inventory/data/inventory_provider.dart';
import 'package:album_26_sticker_collector/features/inventory/data/pending_scans_provider.dart';
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PendingScansSheet extends ConsumerStatefulWidget {
  const PendingScansSheet({super.key});

  @override
  ConsumerState<PendingScansSheet> createState() => _PendingScansSheetState();
}

class _PendingScansSheetState extends ConsumerState<PendingScansSheet> {
  bool _isSaving = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final pendingScans = ref.watch(pendingScansProvider);

    return Container(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 32),
      decoration: const BoxDecoration(
        color: Color(0xFF1E1E1E),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Barrita superior deslizante
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
            l10n.pendingScansTitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          // La Lista Minimalista
          if (pendingScans.isEmpty)
            Padding(
              padding: EdgeInsets.all(32.0),
              child: Text(
                l10n.pendingScansEmpty,
                style: TextStyle(color: Colors.grey),
              ),
            )
          else
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: pendingScans.length,
                itemBuilder: (context, index) {
                  final code = pendingScans.keys.elementAt(index);
                  final quantity = pendingScans[code]!;

                  return Card(
                    color: Colors.black45,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      title: Text(
                        l10n.pendingScansItemLabel(code),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Botón Menos (Elimina o resta de la memoria temporal)
                          IconButton(
                            icon: Icon(
                              quantity == 1
                                  ? Icons.delete_outline
                                  : Icons.remove_circle_outline,
                              color: quantity == 1
                                  ? Colors.redAccent
                                  : Colors.amber,
                            ),
                            onPressed: () => ref
                                .read(pendingScansProvider.notifier)
                                .decrement(code),
                          ),
                          // Contador
                          SizedBox(
                            width: 24,
                            child: Text(
                              '$quantity',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          // Botón Más (Suma a la memoria temporal)
                          IconButton(
                            icon: const Icon(
                              Icons.add_circle_outline,
                              color: Colors.amber,
                            ),
                            onPressed: () => ref
                                .read(pendingScansProvider.notifier)
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

          // Botón de Acción Principal "LISTO" (Guardado en BD)
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: pendingScans.isEmpty || _isSaving
                  ? null
                  : () async {
                      setState(() => _isSaving = true);
                      HapticFeedback.mediumImpact();

                      // Capturamos el contexto de navegación antes del proceso asíncrono
                      final navigator = Navigator.of(context);
                      final messenger = ScaffoldMessenger.of(context);

                      try {
                        final inventoryNotifier = ref.read(
                          inventoryProvider.notifier,
                        );

                        // Recorremos el mapa y guardamos en Supabase/SQLite
                        for (var entry in pendingScans.entries) {
                          final stickerId = entry.key;
                          final delta = entry.value;

                          await inventoryNotifier.updateVariantQuantity(
                            stickerId,
                            'normal',
                            delta,
                          );
                        }

                        // Limpiamos la bandeja temporal
                        ref.read(pendingScansProvider.notifier).clear();

                        // Cerramos el Bottom Sheet sin matar la cámara
                        navigator.pop();

                        // Mostramos el éxito
                        messenger.showSnackBar(
                          SnackBar(
                            content: Text(
                              l10n.pendingScansSavedSuccess(
                                pendingScans.length,
                              ),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            backgroundColor: Colors.amber,
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
                              l10n.pendingScansSaveError(e.toString()),
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
                      style: TextStyle(
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
