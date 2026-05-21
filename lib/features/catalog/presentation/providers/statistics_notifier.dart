// Archivo: lib/features/catalog/presentation/providers/statistics_notifier.dart

import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:album_26_sticker_collector/features/inventory/data/stats_provider.dart';
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';

part 'statistics_notifier.g.dart';

@riverpod
class StatisticsNotifier extends _$StatisticsNotifier {
  @override
  FutureOr<void> build() {
    // No es necesario inicializar nada aquí para la funcionalidad de compartir
    return;
  }

  Future<void> shareStatistics(BuildContext context, GlobalKey shareImageKey) async {
    final l10n = AppLocalizations.of(context);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      try {
        final RenderRepaintBoundary boundary = shareImageKey.currentContext!
            .findRenderObject()! as RenderRepaintBoundary;
        final ui.Image image = await boundary.toImage(pixelRatio: 3.0);
        final ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
        final Uint8List pngBytes = byteData!.buffer.asUint8List();

        final directory = await getTemporaryDirectory();
        final imagePath = '${directory.path}/statistics.png';
        final file = File(imagePath);
        await file.writeAsBytes(pngBytes);

        // Obtener estadísticas para el mensaje localizado
        final totalAsync = ref.read(totalStickersCountProvider);
        final uniqueCollected = ref.read(uniqueCollectedProvider);
        final total = totalAsync.value ?? 0;
        final progress = total == 0 ? 0.0 : uniqueCollected / total;
        final percentage = progress * 100;

        await Share.shareXFiles(
          [XFile(file.path)],
          text: l10n.shareStatisticsMessage(
            percentage: percentage.toStringAsFixed(0),
            appLink: 'https://example.com/album26',
            appTitle: l10n.appTitle
          ),
        );
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.commonErrorWithMessage(e.toString())),
              backgroundColor: Colors.red,
            ),
          );
        }
        rethrow; // Re-throw to be caught by AsyncValue.guard
      }
    });
  }
}
