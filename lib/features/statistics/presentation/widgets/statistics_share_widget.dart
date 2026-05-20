import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';

Future<void> shareStatistics(BuildContext context) async {
  try {
    final globalKey = GlobalKey();
    final boundary = globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    final image = await boundary.toImage(pixelRatio: 3.0);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final pngBytes = byteData!.buffer.asUint8List();

    final tempDir = await getTemporaryDirectory();
    final file = await File('${tempDir.path}/statistics.png').create();
    await file.writeAsBytes(pngBytes);

    await Share.shareFiles([file.path], text: AppLocalizations.of(context)!.shareStatisticsMessage);
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(AppLocalizations.of(context)!.shareError)),
    );
  }
}
