import 'dart:io';

import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

const _kAppStoreId = '6745819003';
const _kPlayStoreId = 'com.album26.sticker_collector';

const _kCountKey = 'rating_scan_count';
const _kRatedKey = 'rating_already_prompted';
const _kPromptThreshold = 10; // Mostrar después de 10 escaneos

class RatingService {
  RatingService._();

  static final _inAppReview = InAppReview.instance;

  /// Abre la tienda correspondiente para calificar la app.
  static Future<void> openStoreListing() async {
    if (await _inAppReview.isAvailable()) {
      await _inAppReview.openStoreListing(appStoreId: _kAppStoreId);
    } else {
      final url = Platform.isIOS
          ? Uri.parse(
              'https://apps.apple.com/app/id$_kAppStoreId?action=write-review',
            )
          : Uri.parse(
              'https://play.google.com/store/apps/details?id=$_kPlayStoreId',
            );
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      }
    }
  }

  /// Incrementa el contador de escaneos y, si llega al umbral (y no se ha
  /// pedido antes), muestra el diálogo nativo de valoración.
  static Future<void> trackScanAndMaybePrompt() async {
    final prefs = await SharedPreferences.getInstance();

    final alreadyPrompted = prefs.getBool(_kRatedKey) ?? false;
    if (alreadyPrompted) return;

    final count = (prefs.getInt(_kCountKey) ?? 0) + 1;
    await prefs.setInt(_kCountKey, count);

    if (count >= _kPromptThreshold) {
      await _tryRequestReview(prefs);
    }
  }

  static Future<void> _tryRequestReview(SharedPreferences prefs) async {
    final available = await _inAppReview.isAvailable();
    if (!available) return;
    await _inAppReview.requestReview();
    await prefs.setBool(_kRatedKey, true);
  }
}
