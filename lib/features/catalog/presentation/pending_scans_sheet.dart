import 'package:album_26_sticker_collector/features/inventory/data/pending_scans_provider.dart';
import 'package:flutter/material.dart';
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
                          // Botón Menos (o eliminar si es 1)
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
                          // Botón Más
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

          // Botón de Acción Principal
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
                  : () {
                      // AQUÍ VA LA LÓGICA PARA GUARDAR EN TU DB REAL
                      print("Guardando en BD: $pendingScans");
                      ref.read(pendingScansProvider.notifier).clear();
                      Navigator.pop(context); // Cierra el bottom sheet
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
