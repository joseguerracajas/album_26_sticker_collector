import 'dart:ui' as ui;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:screenshot/screenshot.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';

class StatisticsShareService {
  static final ScreenshotController _screenshotController = ScreenshotController();

  static Future<void> shareStatisticsAsImage(BuildContext context, GlobalKey repaintBoundaryKey) async {
    try {
      final RenderRepaintBoundary boundary =
          repaintBoundaryKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      final ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      final ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      final Uint8List pngBytes = byteData!.buffer.asUint8List();

      // Add app icon and footer text
      final Uint8List finalImage = await _addOverlay(pngBytes, context);

      // Save the image to temporary storage
      final directory = await getTemporaryDirectory();
      final filePath = '${directory.path}/statistics_share.png';
      final file = await File(filePath).writeAsBytes(finalImage);

      // Share the image
      await Share.shareFiles([file.path], text: AppLocalizations.of(context)!.shareMessage);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.shareError)),
      );
    }
  }

  static Future<Uint8List> _addOverlay(Uint8List imageBytes, BuildContext context) async {
    final ui.Codec codec = await ui.instantiateImageCodec(imageBytes);
    final ui.FrameInfo frame = await codec.getNextFrame();
    final ui.Image image = frame.image;

    final pictureRecorder = ui.PictureRecorder();
    final canvas = Canvas(pictureRecorder);
    final paint = Paint();

    // Draw the original image
    canvas.drawImage(image, Offset.zero, paint);

    // Load app icon
    final ByteData data = await rootBundle.load('assets/icon/app_icon.png');
    final Uint8List appIconBytes = data.buffer.asUint8List();
    final ui.Codec iconCodec = await ui.instantiateImageCodec(appIconBytes);
    final ui.FrameInfo iconFrame = await iconCodec.getNextFrame();
    final ui.Image appIcon = iconFrame.image;

    // Draw app icon
    const double iconSize = 150.0;
    final double iconX = image.width - iconSize - 20;
    final double iconY = 20;
    canvas.drawImageRect(
      appIcon,
      Rect.fromLTWH(0, 0, appIcon.width.toDouble(), appIcon.height.toDouble()),
      Rect.fromLTWH(iconX, iconY, iconSize, iconSize),
      paint,
    );

    // Draw footer text
    final textPainter = TextPainter(
      text: TextSpan(
        text: AppLocalizations.of(context)!.shareFooter,
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: image.width.toDouble(),
    );
    final double textX = 20;
    final double textY = image.height - textPainter.height - 20;
    textPainter.paint(canvas, Offset(textX, textY));

    final ui.Image finalImage = await pictureRecorder.endRecording().toImage(image.width, image.height);
    final ByteData? finalByteData = await finalImage.toByteData(format: ui.ImageByteFormat.png);
    return finalByteData!.buffer.asUint8List();
  }
}