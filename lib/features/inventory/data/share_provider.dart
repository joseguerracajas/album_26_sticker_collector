// Archivo: lib/features/inventory/data/share_provider.dart

import 'package:album_26_sticker_collector/brick/app_repository.dart';
import 'package:album_26_sticker_collector/features/catalog/domain/category.model.dart';
import 'package:album_26_sticker_collector/features/catalog/domain/sticker.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'inventory_provider.dart';

// 1. Creamos las 3 opciones posibles
enum ShareType { todos, faltantes, repetidos }

class ShareNotifier extends Notifier<bool> {
  final _repo = AppRepository();
  @override
  bool build() => false;

  // 2. Recibimos la opción elegida
  Future<void> generarYCompartirLista(ShareType tipo) async {
    state = true;
    try {
      // 1. Pedimos a nuestro Gerente ambas listas (¡Saldrán de la RAM o SQLite al instante!)
      final allStickers = await _repo.get<Sticker>();
      final allCategories = await _repo.get<Category>();

      // 2. Creamos un "Diccionario" de categorías para buscar a la velocidad de la luz
      // Esto hace que buscar una categoría por su ID sea instantáneo (O(1))
      final categoryMap = {for (var c in allCategories) c.id: c};

      // 3. Ordenamos los stickers exactamente como lo hacías en Supabase
      allStickers.sort((a, b) {
        // Primero ordenamos por category_id
        int catCompare = (a.categoryId).compareTo(b.categoryId);

        // Si son de la misma categoría, desempatamos por el order_index
        if (catCompare != 0) return catCompare;
        return a.orderIndex.compareTo(b.orderIndex);
      });

      // 4. "Ensamblamos" el resultado final uniendo el Sticker con su Categoría
      final response = allStickers.map((sticker) {
        // Buscamos la categoría de este sticker en nuestro diccionario
        final category = categoryMap[sticker.categoryId];

        // Retornamos la estructura que tu pantalla está esperando leer
        return {
          'id': sticker.id,
          'sticker_code': sticker.stickerCode,
          'category_id': sticker.categoryId,
          'categories': {'name': category?.name, 'emoji': category?.emoji},
        };
      }).toList();

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
        for (var v in inv.values) {
          total += v;
        }

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

      await SharePlus.instance.share(ShareParams(text: mensaje));
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
