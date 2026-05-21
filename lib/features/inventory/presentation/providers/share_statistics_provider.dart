import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

final shareStatisticsProvider = NotifierProvider.autoDispose<ShareStatisticsNotifier, AsyncValue<void>>(ShareStatisticsNotifier.new);

class ShareStatisticsNotifier extends AutoDisposeNotifier<AsyncValue<void>> {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<void> shareProgress({
    required double percentage,
    required String appTitle,
    required String shareText,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final imageBytes = await _generateInstagramImage(percentage, appTitle);
      
      final xFile = XFile.fromData(
        imageBytes,
        mimeType: 'image/png',
        name: 'album_progress.png',
      );

      await Share.shareXFiles([xFile], text: shareText);
    });
  }

  Future<Uint8List> _generateInstagramImage(double percentage, String appTitle) async {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    const size = Size(1080, 1920);

    // 1. Draw Background (Dark Theme)
    final bgPaint = Paint()..color = const Color(0xFF121212);
    canvas.drawRect(Offset.zero & size, bgPaint);

    // 2. Draw App Branding (Icon & Title)
    try {
      final ByteData data = await rootBundle.load('assets/icon/app_icon.png');
      final Uint8List bytes = data.buffer.asUint8List();
      final ui.Codec codec = await ui.instantiateImageCodec(bytes, targetWidth: 200);
      final ui.FrameInfo fi = await codec.getNextFrame();
      final ui.Image icon = fi.image;
      canvas.drawImage(icon, const Offset(440, 250), Paint());
    } catch (_) {
      // Fallback if icon is missing
    }

    final titlePainter = TextPainter(
      text: TextSpan(
        text: appTitle,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 56,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    titlePainter.layout();
    titlePainter.paint(canvas, Offset((size.width - titlePainter.width) / 2, 480));

    // 3. Draw _GlobalProgressCard Replica
    final cardRect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2 + 100),
      width: 900,
      height: 600,
    );
    final cardRRect = RRect.fromRectAndRadius(cardRect, const Radius.circular(32));
    canvas.drawRRect(cardRRect, Paint()..color = const Color(0xFF1E1E1E));

    // Card Title
    final cardTitlePainter = TextPainter(
      text: const TextSpan(
        text: 'Global Progress',
        style: TextStyle(
          color: Colors.white70,
          fontSize: 40,
          fontWeight: FontWeight.w500,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    cardTitlePainter.layout();
    cardTitlePainter.paint(canvas, Offset(cardRect.left + 60, cardRect.top + 60));

    // Percentage Text
    final progressPainter = TextPainter(
      text: TextSpan(
        text: '${percentage.toStringAsFixed(1)}%',
        style: const TextStyle(
          color: Colors.amber,
          fontSize: 120,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    progressPainter.layout();
    progressPainter.paint(canvas, Offset(cardRect.left + 60, cardRect.top + 160));

    // Progress Bar Background
    final barRect = Rect.fromLTWH(cardRect.left + 60, cardRect.bottom - 120, 780, 48);
    canvas.drawRRect(
      RRect.fromRectAndRadius(barRect, const Radius.circular(24)),
      Paint()..color = const Color(0xFF121212),
    );

    // Progress Bar Fill (Gold Gradient)
    final fillWidth = 780 * (percentage / 100).clamp(0.0, 1.0);
    if (fillWidth > 0) {
      final fillRect = Rect.fromLTWH(cardRect.left + 60, cardRect.bottom - 120, fillWidth, 48);
      final gradient = const LinearGradient(
        colors: [Colors.amber, Colors.orange],
      ).createShader(fillRect);
      
      canvas.drawRRect(
        RRect.fromRectAndRadius(fillRect, const Radius.circular(24)),
        Paint()..shader = gradient,
      );
    }

    // 4. Finalize Image
    final picture = recorder.endRecording();
    final img = await picture.toImage(size.width.toInt(), size.height.toInt());
    final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }
}
