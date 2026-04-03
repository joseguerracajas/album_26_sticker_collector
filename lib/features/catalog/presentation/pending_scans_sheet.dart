import 'package:album_26_sticker_collector/features/inventory/data/inventory_provider.dart';
import 'package:album_26_sticker_collector/features/inventory/data/pending_scans_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PendingScansSheet extends ConsumerWidget {
  const PendingScansSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          // Barrita superior para indicar que se puede deslizar
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade600,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Cromos Escaneados',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          // La Lista Minimalista
          if (pendingScans.isEmpty)
            const Padding(
              padding: EdgeInsets.all(32.0),
              child: Text(
                "Aún no has escaneado nada",
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
                        'Cromo: $code',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // 1. Botón Menos (CORREGIDO: Solo resta o elimina de la lista temporal)
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
                          // 2. Botón Más (Suma a la lista temporal)
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

          // 3. Botón de Acción Principal "LISTO" (CORREGIDO: Aquí va el guardado real)
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
              onPressed: pendingScans.isEmpty
                  ? null
                  : () async {
                      // 1. Damos feedback visual inmediato (vibra)
                      HapticFeedback.mediumImpact();

                      try {
                        // 2. Leemos el Notifier de tu inventario
                        final inventoryNotifier = ref.read(
                          inventoryProvider.notifier,
                        );

                        // 3. Recorremos el mapa de cromos escaneados
                        for (var entry in pendingScans.entries) {
                          final stickerId = entry.key; // Ej: "ECU_10"
                          final delta = entry.value; // Ej: 2

                          // 4. GUARDAMOS EN TU BASE DE DATOS LOCAL/SUPABASE
                          await inventoryNotifier.updateVariantQuantity(
                            stickerId,
                            'normal',
                            delta,
                          );
                        }

                        // 5. Limpiamos la bandeja temporal para el próximo escaneo
                        ref.read(pendingScansProvider.notifier).clear();

                        // 6. Cerramos el BottomSheet
                        Navigator.of(context).pop();
                        if (context.mounted) {
                          Navigator.pop(context);

                          // 7. Mostramos el mensaje de triunfo 🏆
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                '¡${pendingScans.length} cromos guardados con éxito! 🏆',
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
                        }
                      } catch (e) {
                        // Si algo falla, se lo decimos al usuario sin cerrar la bandeja
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('❌ Error al guardar: $e'),
                              backgroundColor: Colors.redAccent,
                            ),
                          );
                        }
                      }
                    },
              child: const Text(
                'LISTO',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
