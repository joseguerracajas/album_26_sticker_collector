import 'dart:io';

import 'package:album_26_sticker_collector/core/constants/app_urls.dart';
import 'package:album_26_sticker_collector/features/auth/presentation/auth_screen.dart'
    show LoginScreen;
import 'package:album_26_sticker_collector/features/monetization/data/subscription_provider.dart';
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';
import 'package:album_26_sticker_collector/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class PaywallScreen extends ConsumerStatefulWidget {
  const PaywallScreen({super.key});

  @override
  ConsumerState<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends ConsumerState<PaywallScreen> {
  Offerings? _offerings;
  Package? _selectedPackage;
  bool _isLoadingOfferings = true;
  bool _isPurchasing = false;
  String? _errorMessage;
  String? _purchaseErrorMessage;

  @override
  void initState() {
    super.initState();
    _loadOfferings();
  }

  Future<void> _loadOfferings() async {
    try {
      final offerings = await Purchases.getOfferings();
      if (mounted) {
        setState(() {
          _offerings = offerings;
          final packages = offerings.current?.availablePackages ?? [];
          _selectedPackage = packages.isNotEmpty ? packages.first : null;
          _isLoadingOfferings = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = e.toString();
          _isLoadingOfferings = false;
        });
      }
    }
  }

  Future<void> _purchase(Package? package) async {
    if (package == null) return;
    setState(() {
      _isPurchasing = true;
      _purchaseErrorMessage = null;
    });
    try {
      final success = await ref
          .read(subscriptionProvider.notifier)
          .purchase(package);
      if (mounted) {
        setState(() => _isPurchasing = false);
        if (success) Navigator.of(context).pop(true);
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isPurchasing = false;
          _purchaseErrorMessage = AppLocalizations.of(
            context,
          ).paywallPurchaseError;
        });
      }
    }
  }

  Future<void> _restore() async {
    setState(() {
      _isPurchasing = true;
      _purchaseErrorMessage = null;
    });
    try {
      await ref.read(subscriptionProvider.notifier).restorePurchases();
      if (mounted) {
        setState(() => _isPurchasing = false);
        final isSubscribed = ref.read(isSubscribedProvider);
        if (isSubscribed) Navigator.of(context).pop(true);
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isPurchasing = false;
          _purchaseErrorMessage = AppLocalizations.of(
            context,
          ).paywallRestoreError;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, right: 8),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white54),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
              ),
            ),

            // ── Hero ──────────────────────────────────────────────────────
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    // Icon
                    Image.asset(
                      'assets/icon/icon_transparent.png',
                      width: 160,
                      height: 110,
                    ),
                    const SizedBox(height: 24),

                    // Etiqueta "Pro"
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'PRO',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Título
                    const Text(
                      'Album 2026\nSticker Collector',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -0.5,
                        height: 1.15,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      l10n.paywallTitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.amber,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Subtítulo
                    Text(
                      l10n.paywallSubtitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 16,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 32),

                    // ── Lista de beneficios ──────────────────────────────
                    _BenefitRow(
                      icon: Icons.qr_code_scanner,
                      color: Colors.amber,
                      text: l10n.paywallBenefitScanner,
                    ),
                    const SizedBox(height: 16),
                    _BenefitRow(
                      icon: Icons.block,
                      color: Colors.greenAccent,
                      text: l10n.paywallBenefitNoAds,
                    ),
                    const SizedBox(height: 16),
                    _BenefitRow(
                      icon: Icons.cloud_sync,
                      color: Colors.lightBlueAccent,
                      text: l10n.paywallBenefitSync,
                    ),
                    const SizedBox(height: 40),

                    // ── Selector de paquetes ────────────────────────────
                    _buildPackageSelector(l10n),
                    const SizedBox(height: 16),

                    // ── Botón de compra / loading ────────────────────────
                    _buildPurchaseButton(l10n),
                    const SizedBox(height: 8),

                    // Error de compra
                    if (_purchaseErrorMessage != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          _purchaseErrorMessage!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.redAccent,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    const SizedBox(height: 8),

                    // Restaurar compras
                    TextButton(
                      onPressed: _isPurchasing ? null : _restore,
                      child: Text(
                        l10n.paywallRestorePurchases,
                        style: const TextStyle(
                          color: Colors.white38,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      l10n.paywallCancelAnytime,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white24,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // ── Links legales requeridos por Apple 3.1.2(c) ──────
                    _LegalLinksRow(l10n: l10n),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPackageSelector(AppLocalizations l10n) {
    if (_isLoadingOfferings || _errorMessage != null) {
      return const SizedBox.shrink();
    }

    final packages = _offerings?.current?.availablePackages ?? [];
    if (packages.isEmpty) return const SizedBox.shrink();

    return Column(
      children: packages.map((pkg) {
        final isSelected = _selectedPackage?.identifier == pkg.identifier;
        final price = pkg.storeProduct.priceString;
        final title = _packageTitle(pkg, l10n);
        return GestureDetector(
          onTap: () => setState(() => _selectedPackage = pkg),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: isSelected
                  ? Colors.amber.withValues(alpha: 0.15)
                  : Colors.white.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: isSelected ? Colors.amber : Colors.white24,
                width: isSelected ? 2 : 1,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  isSelected
                      ? Icons.radio_button_checked
                      : Icons.radio_button_unchecked,
                  color: isSelected ? Colors.amber : Colors.white38,
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: isSelected ? Colors.amber : Colors.white,
                      fontWeight: isSelected
                          ? FontWeight.w700
                          : FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ),
                Text(
                  price,
                  style: TextStyle(
                    color: isSelected ? Colors.amber : Colors.white70,
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  String _packageTitle(Package pkg, AppLocalizations l10n) {
    switch (pkg.packageType) {
      case PackageType.monthly:
        return l10n.paywallPackageMonthly;
      case PackageType.annual:
        return l10n.paywallPackageAnnual;
      case PackageType.weekly:
        return l10n.paywallPackageWeekly;
      case PackageType.lifetime:
        return l10n.paywallPackageLifetime;
      case PackageType.twoMonth:
        return l10n.paywallPackageTwoMonth;
      case PackageType.threeMonth:
        return l10n.paywallPackageThreeMonth;
      case PackageType.sixMonth:
        return l10n.paywallPackageSixMonth;
      default:
        return pkg.storeProduct.title.isNotEmpty
            ? pkg.storeProduct.title
            : pkg.identifier;
    }
  }

  Widget _buildPurchaseButton(AppLocalizations l10n) {
    if (_isLoadingOfferings) {
      return const CircularProgressIndicator(color: Colors.amber);
    }

    if (_errorMessage != null) {
      return Column(
        children: [
          Text(
            l10n.paywallLoadError,
            style: const TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              _errorMessage!,
              style: const TextStyle(color: Colors.white54, fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: _loadOfferings,
            child: Text(
              l10n.paywallRetry,
              style: const TextStyle(color: Colors.amber),
            ),
          ),
        ],
      );
    }

    final packages = _offerings?.current?.availablePackages ?? [];

    if (packages.isEmpty) {
      // Sin offerings configurados (sandbox/test sin producto)
      return _PurchaseButton(
        label: l10n.paywallSubscribeButton(r'$2.99'),
        isPurchasing: false,
        onPressed: () => Navigator.of(context).pop(false),
      );
    }

    final price = _selectedPackage?.storeProduct.priceString ?? '';

    return _PurchaseButton(
      label: l10n.paywallSubscribeButton(price),
      isPurchasing: _isPurchasing,
      onPressed: () => _purchase(_selectedPackage),
    );
  }
}

// ─── Beneficio Row ────────────────────────────────────────────────────────────
class _BenefitRow extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const _BenefitRow({
    required this.icon,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.15),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ],
    );
  }
}

// ─── Botón de compra ──────────────────────────────────────────────────────────
class _PurchaseButton extends StatelessWidget {
  final String label;
  final bool isPurchasing;
  final VoidCallback? onPressed;

  const _PurchaseButton({
    required this.label,
    required this.isPurchasing,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 8,
          shadowColor: Colors.amber.withValues(alpha: 0.4),
        ),
        onPressed: isPurchasing ? null : onPressed,
        child: isPurchasing
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: Colors.black,
                  strokeWidth: 2,
                ),
              )
            : Text(
                label,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}

// ─── Links legales (Terms of Use + Privacy Policy) ───────────────────────────
class _LegalLinksRow extends StatelessWidget {
  final AppLocalizations l10n;

  const _LegalLinksRow({required this.l10n});

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        if (Platform.isIOS)
          GestureDetector(
            onTap: () => _launch(AppUrls.termsOfUse),
            child: Text(
              l10n.paywallTermsOfUse,
              style: const TextStyle(
                color: Colors.white38,
                fontSize: 11,
                decoration: TextDecoration.underline,
                decorationColor: Colors.white38,
              ),
            ),
          ),
        const Text(
          '  ·  ',
          style: TextStyle(color: Colors.white24, fontSize: 11),
        ),
        GestureDetector(
          onTap: () => _launch(AppUrls.privacyPolicy),
          child: Text(
            l10n.paywallPrivacyPolicy,
            style: const TextStyle(
              color: Colors.white38,
              fontSize: 11,
              decoration: TextDecoration.underline,
              decorationColor: Colors.white38,
            ),
          ),
        ),
      ],
    );
  }
}
