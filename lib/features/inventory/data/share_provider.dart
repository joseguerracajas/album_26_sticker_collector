// Archivo: lib/features/inventory/data/share_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import '../../../main.dart';
import 'inventory_provider.dart';

// 1. Creamos las 3 opciones posibles
enum ShareType { todos, faltantes, repetidos }

class ShareNotifier extends Notifier<bool> {
  @override
  bool build() => false;

  // 2. Recibimos la opción elegida
  Future<void> generarYCompartirLista(ShareType tipo) async {
    state = true;
    try {
      final response = await supabase
          .from('stickers')
          .select('''
            id, 
            sticker_code, 
            category_id,
            categories (name, emoji)
          ''')
          .order('category_id', ascending: true)
          .order('order_index', ascending: true);
      ;

      final miInventario = await ref.read(inventoryProvider.future);

      Map<String, Map<String, dynamic>> faltantesAgrupados = {};
      Map<String, Map<String, dynamic>> repetidasAgrupadas = {};

      for (var row in response) {
        final stickerId = row['id'] as String;
        final catData = row['categories'] as Map<String, dynamic>;
        final String nombreCat = catData['name'] ?? row['category_id'];
        final String emojiCat = catData['emoji'] ?? '🏳️';
        final String code = row['sticker_code'] as String;
        final String categoryId = row['category_id'] as String;

        final String stickerLabel = "$categoryId $code";

        final inv = miInventario[stickerId] ?? {};
        int total = 0;
        inv.values.forEach((v) => total += v);

        if (total == 0) {
          _agrupar(faltantesAgrupados, nombreCat, emojiCat, stickerLabel);
        } else if (total > 1) {
          _agrupar(
            repetidasAgrupadas,
            nombreCat,
            emojiCat,
            '$stickerLabel (x${total - 1})',
          );
        }
      }

      String mensaje = "⚽ *INTERCAMBIO ÁLBUM 26* 🏆\n\n";

      // 3. Mostramos secciones según lo que el usuario eligió
      if (tipo == ShareType.todos || tipo == ShareType.faltantes) {
        mensaje += "❌ *ME FALTAN:*\n";
        mensaje += _formatearSeccion(faltantesAgrupados, "¡Ninguno! 😎");
      }

      if (tipo == ShareType.todos) {
        mensaje += "\n--------------------------\n\n";
      }

      if (tipo == ShareType.todos || tipo == ShareType.repetidos) {
        mensaje += "🔁 *REPETIDAS:*\n";
        mensaje += _formatearSeccion(repetidasAgrupadas, "Sin repetidas 😅");
      }

      mensaje += "\n¿Cambiamos? 👀🔥";

      await Share.share(mensaje);
    } catch (e) {
      rethrow;
    } finally {
      state = false;
    }
  }

  void _agrupar(
    Map<String, Map<String, dynamic>> mapa,
    String nombre,
    String emoji,
    String codigo,
  ) {
    if (!mapa.containsKey(nombre)) {
      mapa[nombre] = {'emoji': emoji, 'codigos': <String>[]};
    }
    (mapa[nombre]!['codigos'] as List<String>).add(codigo);
  }

  String _formatearSeccion(
    Map<String, Map<String, dynamic>> mapa,
    String mensajeVacio,
  ) {
    if (mapa.isEmpty) return "$mensajeVacio\n";

    String texto = "";
    mapa.forEach((nombre, data) {
      texto += "${data['emoji']} *${nombre.toUpperCase()}*\n";
      final List<String> listaCodigos = data['codigos'] as List<String>;
      for (var cod in listaCodigos) {
        texto += "$cod\n";
      }
      texto += "\n";
    });
    return texto;
  }
}

final shareProvider = NotifierProvider<ShareNotifier, bool>(ShareNotifier.new);
