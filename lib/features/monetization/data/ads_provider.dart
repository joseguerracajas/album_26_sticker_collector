import 'dart:io';
import 'package:album_26_sticker_collector/features/monetization/presentation/paywall_screen.dart';
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'subscription_provider.dart';

// ─── IDs de anuncio ────────────────────────────────────────────────────────────
// IDs de TEST de Google. Reemplazar por los reales antes de publicar.
class AdIds {
  static String get banner => Platform.isIOS
      ? 'ca-app-pub-3940256099942544/2934735716'
      : 'ca-app-pub-3940256099942544/6300978111';

  static String get interstitial => Platform.isIOS
      ? 'ca-app-pub-3940256099942544/4411468910'
      : 'ca-app-pub-3940256099942544/1033173712';

  static String get rewarded => Platform.isIOS
      ? 'ca-app-pub-3940256099942544/1712485313'
      : 'ca-app-pub-3940256099942544/5224354917';
  // static String get banner => Platform.isIOS
  //     ? 'ca-app-pub-7990642104517736/8103702986'
  //     : 'ca-app-pub-7990642104517736/6674237099';

  // static String get interstitial => Platform.isIOS
  //     ? 'ca-app-pub-7990642104517736/3796580284'
  //     : 'ca-app-pub-7990642104517736/6422743627';

  // static String get rewarded => Platform.isIOS
  //     ? 'ca-app-pub-7990642104517736/8084663326'
  //     : 'ca-app-pub-7990642104517736/9931789976';

  // ── IDs de PRODUCCIÓN (descomentar y reemplazar en producción) ──
  // static const String bannerIos      = 'ca-app-pub-XXXXXXX/XXXXXXXXX';
  // static const String bannerAndroid  = 'ca-app-pub-XXXXXXX/XXXXXXXXX';
  // static const String interIos       = 'ca-app-pub-XXXXXXX/XXXXXXXXX';
  // static const String interAndroid   = 'ca-app-pub-XXXXXXX/XXXXXXXXX';
  // static const String rewardedIos    = 'ca-app-pub-XXXXXXX/XXXXXXXXX';
  // static const String rewardedAndroid= 'ca-app-pub-XXXXXXX/XXXXXXXXX';
}

// ─── Inicialización ────────────────────────────────────────────────────────────
Future<void> initializeAdMob() async {
  try {
    await MobileAds.instance.initialize();
  } catch (e) {
    debugPrint('❌ AdMob init error: $e');
  }
}

// ─── Diálogo previo al anuncio ────────────────────────────────────────────────
// Devuelve true  → el usuario quiere ver el anuncio.
// Devuelve false  → eligió "Obtener Pro" (navega al paywall).
// Devuelve null   → eligió "Ahora no".
Future<bool?> showPreAdDialog(BuildContext context) async {
  final chosen = await showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (ctx) {
      final l10n = AppLocalizations.of(ctx);
      return Dialog(
        backgroundColor: const Color(0xFF1E1E1E),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.amber.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.play_circle_outline_rounded,
                  color: Colors.amber,
                  size: 30,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                l10n.adDialogTitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                l10n.adDialogBody,
                style: const TextStyle(
                  color: Colors.white60,
                  fontSize: 14,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              // Botón principal: Ver anuncio
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.play_arrow_rounded, size: 20),
                  label: Text(
                    l10n.adDialogWatchAd,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  onPressed: () => Navigator.of(ctx).pop(true),
                ),
              ),
              const SizedBox(height: 10),
              // Botón secundario: Obtener Pro
              SizedBox(
                width: double.infinity,
                height: 44,
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.amber,
                    side: const BorderSide(color: Colors.amber, width: 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.workspace_premium, size: 18),
                  label: Text(l10n.adDialogGetPro),
                  onPressed: () => Navigator.of(ctx).pop(false),
                ),
              ),
              const SizedBox(height: 4),
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(null),
                child: Text(
                  l10n.adDialogNotNow,
                  style: const TextStyle(color: Colors.white30, fontSize: 13),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );

  if (chosen == false && context.mounted) {
    // Usuario eligió "Obtener Pro" → navegar al paywall
    await Navigator.of(context).push<bool>(
      MaterialPageRoute(
        builder: (_) => const PaywallScreen(),
        fullscreenDialog: true,
      ),
    );
    return false;
  }

  if (chosen == null) return null; // "Ahora no"

  return true; // "Ver anuncio"
}
// ─── Servicio de Interstitial y Rewarded ──────────────────────────────────────
// Un único servicio que gestiona la carga y presentación de interstitials
// y rewarded, respetando la suscripción del usuario.

class AdService {
  InterstitialAd? _interstitialAd;
  RewardedAd? _rewardedAd;

  bool _interstitialReady = false;
  bool _rewardedReady = false;

  // Contador de cromos escaneados para el intersticial cada 8
  int _scansCountSinceLastAd = 0;
  static const int _interstitialEveryN = 8;

  void preloadInterstitial() {
    InterstitialAd.load(
      adUnitId: AdIds.interstitial,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          _interstitialReady = true;
          debugPrint('✅ Interstitial cargado');
        },
        onAdFailedToLoad: (error) {
          _interstitialReady = false;
          debugPrint('❌ Interstitial falló: $error');
        },
      ),
    );
  }

  void preloadRewarded() {
    RewardedAd.load(
      adUnitId: AdIds.rewarded,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          _rewardedAd = ad;
          _rewardedReady = true;
          debugPrint('✅ Rewarded cargado');
        },
        onAdFailedToLoad: (error) {
          _rewardedReady = false;
          debugPrint('❌ Rewarded falló: $error');
        },
      ),
    );
  }

  /// Llamar cuando se escanea 1 cromo. Muestra el intersticial cada 8.
  /// Devuelve true si el usuario eligió "Ahora no" (el llamador debe hacer pop).
  Future<bool> onStickerScanned({
    required bool isSubscribed,
    required BuildContext context,
  }) async {
    if (isSubscribed) return false;

    _scansCountSinceLastAd++;
    if (_scansCountSinceLastAd < _interstitialEveryN) return false;

    _scansCountSinceLastAd = 0;

    if (!context.mounted) return false;
    final choice = await showPreAdDialog(context);

    if (choice == null) return true; // "Ahora no" → el scanner debe hacer pop
    if (choice == false) return false; // "Obtener Pro" → ya navegó al paywall

    if (!context.mounted) return false;
    await showInterstitial(context: context, isSubscribed: isSubscribed);
    return false;
  }

  Future<void> showInterstitial({
    required BuildContext context,
    required bool isSubscribed,
  }) async {
    if (isSubscribed || !_interstitialReady || _interstitialAd == null) return;

    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        _interstitialAd = null;
        _interstitialReady = false;
        preloadInterstitial(); // precarga el siguiente
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        ad.dispose();
        _interstitialAd = null;
        _interstitialReady = false;
        preloadInterstitial();
      },
    );

    await _interstitialAd!.show();
  }

  /// Muestra el rewarded y ejecuta [onRewarded] si el usuario completa el anuncio.
  /// Si está suscrito, ejecuta [onRewarded] directamente sin mostrar ad.
  Future<void> showRewarded({
    required BuildContext context,
    required bool isSubscribed,
    required VoidCallback onRewarded,
  }) async {
    if (isSubscribed) {
      onRewarded();
      return;
    }

    if (!context.mounted) return;
    final watchAd = await showPreAdDialog(context);
    if (watchAd != true) return; // null = "Ahora no", false = "Obtener Pro"

    if (!_rewardedReady || _rewardedAd == null) {
      // Si no hay ad listo, ejecutamos igual (no penalizamos al usuario)
      onRewarded();
      preloadRewarded();
      return;
    }

    _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        _rewardedAd = null;
        _rewardedReady = false;
        preloadRewarded();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        ad.dispose();
        _rewardedAd = null;
        _rewardedReady = false;
        onRewarded(); // ejecutamos igual si falla
        preloadRewarded();
      },
    );

    await _rewardedAd!.show(onUserEarnedReward: (ad, reward) => onRewarded());
  }

  void dispose() {
    _interstitialAd?.dispose();
    _rewardedAd?.dispose();
  }
}

// ─── Provider global del AdService ───────────────────────────────────────────
final adServiceProvider = Provider<AdService>((ref) {
  final service = AdService();
  // Solo precargamos si el usuario no está suscrito
  final isSubscribed =
      ref.watch(subscriptionProvider).asData?.value.isSubscribed ?? false;

  if (!isSubscribed) {
    service.preloadInterstitial();
    service.preloadRewarded();
  }

  ref.onDispose(service.dispose);
  return service;
});

// ─── Widget reutilizable del Banner ──────────────────────────────────────────
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
