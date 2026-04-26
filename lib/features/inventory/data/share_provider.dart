import 'package:album_26_sticker_collector/brick/app_repository.dart';
import 'package:album_26_sticker_collector/features/catalog/domain/category.model.dart';
import 'package:album_26_sticker_collector/features/catalog/domain/sticker.model.dart';
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:brick_offline_first/brick_offline_first.dart'; // IMPORTANTE: Asegúrate de tener este import
import 'inventory_provider.dart';

enum ShareType { todos, faltantes, repetidos }

class ShareNotifier extends Notifier<bool> {
  final _repo = AppRepository();
  @override
  bool build() => false;

  Future<void> generarYCompartirLista(
    BuildContext context,
    ShareType tipo,
  ) async {
    final l10n = AppLocalizations.of(context);
    state = true;
    try {
      // 1. FORZAR LECTURA LOCAL: Evita que Brick intente ir a la red tras el anuncio
      final allStickers = await _repo.get<Sticker>();
      final allCategories = await _repo.get<Category>();

      final categoryMap = {for (var c in allCategories) c.id: c};

      allStickers.sort((a, b) {
        final catA = categoryMap[a.categoryId];
        final catB = categoryMap[b.categoryId];
        final catOrderA = catA?.orderIndex ?? 999;
        final catOrderB = catB?.orderIndex ?? 999;

        int catCompare = catOrderA.compareTo(catOrderB);
        if (catCompare != 0) return catCompare;
        return a.orderIndex.compareTo(b.orderIndex);
      });

      final response = allStickers.map((sticker) {
        final category = categoryMap[sticker.categoryId];
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

      String mensaje = '${l10n.shareHeader}\n\n';

      if (tipo == ShareType.todos || tipo == ShareType.faltantes) {
        mensaje += '${l10n.shareMissingSectionTitle}\n';
        mensaje += _formatearSeccion(faltantesAgrupados, l10n.shareNoneMissing);
      }

      if (tipo == ShareType.todos) {
        mensaje += '\n${l10n.shareSeparator}\n\n';
      }

      if (tipo == ShareType.todos || tipo == ShareType.repetidos) {
        mensaje += '${l10n.shareDuplicatesSectionTitle}\n';
        mensaje += _formatearSeccion(
          repetidasAgrupadas,
          l10n.shareNoDuplicates,
        );
      }

      mensaje += '\n${l10n.shareLetsTrade}';

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
