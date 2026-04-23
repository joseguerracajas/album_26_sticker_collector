import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'subscription_provider.dart';

// ─── IDs de anuncio ────────────────────────────────────────────────────────────
// Usa los IDs de TEST durante desarrollo. Cambia por los reales en producción.
class AdIds {
  static String get banner {
    if (Platform.isIOS) {
      // Test ID de banner para iOS
      return 'ca-app-pub-7990642104517736~2432881391';
    } else {
      // Test ID de banner para Android
      return 'ca-app-pub-7990642104517736~2755173388';
    }
  }

  // IDs de PRODUCCIÓN (reemplazar cuando sean aprobados en AdMob)
  // static const String bannerIos = 'ca-app-pub-XXXXXXX/XXXXXXXXX';
  // static const String bannerAndroid = 'ca-app-pub-XXXXXXX/XXXXXXXXX';
}

// ─── Inicialización ────────────────────────────────────────────────────────────
Future<void> initializeAdMob() async {
  try {
    await MobileAds.instance.initialize();
  } catch (e) {
    debugPrint('❌ AdMob init error: $e');
  }
}

// ─── Provider del banner ───────────────────────────────────────────────────────
// Widget con estado propio que gestiona el ciclo de vida del BannerAd.

// ─── Widget reutilizable del banner ───────────────────────────────────────────
class AdBannerWidget extends ConsumerStatefulWidget {
  const AdBannerWidget({super.key});

  @override
  ConsumerState<AdBannerWidget> createState() => _AdBannerWidgetState();
}

class _AdBannerWidgetState extends ConsumerState<AdBannerWidget> {
  BannerAd? _ad;
  bool _adLoaded = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadAd());
  }

  void _loadAd() {
    final isSubscribed =
        ref.read(subscriptionProvider).asData?.value.isSubscribed ?? false;
    if (isSubscribed) return;

    final ad = BannerAd(
      adUnitId: AdIds.banner,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          if (!mounted) return;
          setState(() {
            _ad = ad as BannerAd;
            _adLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          debugPrint('❌ Banner ad failed: $error');
        },
      ),
    );
    ad.load();
  }

  @override
  void dispose() {
    _ad?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isSubscribed = ref.watch(isSubscribedProvider);
    if (isSubscribed || !_adLoaded || _ad == null) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      width: _ad!.size.width.toDouble(),
      height: _ad!.size.height.toDouble(),
      child: AdWidget(ad: _ad!),
    );
  }
}
