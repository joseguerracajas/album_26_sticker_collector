import 'package:album_26_sticker_collector/features/auth/presentation/auth_screen.dart'
    show LoginScreen;
import 'package:album_26_sticker_collector/features/monetization/data/subscription_provider.dart';
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';
import 'package:album_26_sticker_collector/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class PaywallScreen extends ConsumerStatefulWidget {
  const PaywallScreen({super.key});

  @override
  ConsumerState<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends ConsumerState<PaywallScreen> {
  Offerings? _offerings;
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

  Future<void> _purchase(Package package) async {
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
    final isLoggedIn = supabase.auth.currentSession != null;

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

            // ── Contenido principal ─────────────────────────────────────
            if (!isLoggedIn) ...[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.lock_outline_rounded,
                        color: Colors.amber,
                        size: 72,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        l10n.paywallGuestTitle,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        l10n.paywallGuestBody,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white60,
                          fontSize: 15,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop(false);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const LoginScreen(),
                              ),
                            );
                          },
                          child: Text(
                            l10n.paywallGuestSignInButton,
                            style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ] else ...[
              // ── Hero ──────────────────────────────────────────────────────
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      // Icon
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.amber.shade300,
                              Colors.amber.shade700,
                            ],
                          ),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.amber.withValues(alpha: 0.4),
                              blurRadius: 24,
                              spreadRadius: 4,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.document_scanner_rounded,
                          color: Colors.black,
                          size: 52,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Título
                      Text(
                        l10n.paywallTitle,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -0.5,
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
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
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
          // 🔥 AÑADIDO: Esto te mostrará el motivo real del error en pantalla
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

    final package = _offerings?.current?.monthly;

    if (package == null) {
      // Sin offerings configurados (sandbox/test sin producto)
      return _PurchaseButton(
        label: l10n.paywallSubscribeButton(r'$2.99'),
        isPurchasing: false,
        onPressed: () => Navigator.of(context).pop(false),
      );
    }

    final price = package.storeProduct.priceString;

    return _PurchaseButton(
      label: l10n.paywallSubscribeButton(price),
      isPurchasing: _isPurchasing,
      onPressed: () => _purchase(package),
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
