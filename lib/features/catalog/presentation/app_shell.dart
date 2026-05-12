// Archivo: lib/features/catalog/presentation/app_shell.dart

import 'package:album_26_sticker_collector/features/catalog/presentation/home_screen.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/statistics_screen.dart';
import 'package:album_26_sticker_collector/features/inventory/presentation/physical_exchange_screen.dart';
import 'package:album_26_sticker_collector/features/inventory/presentation/scanner_screen.dart';
import 'package:album_26_sticker_collector/features/inventory/presentation/sticker_lookup_screen.dart';
import 'package:album_26_sticker_collector/features/monetization/data/ads_provider.dart';
import 'package:album_26_sticker_collector/features/monetization/data/subscription_provider.dart';
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Índices del BottomNavigationBar = índices del IndexedStack:
// 0 → Album (HomeScreen)
// 1 → Escáner (ScannerScreen)
// 2 → Intercambio (PhysicalExchangeScreen)
// 3 → Buscar (StickerLookupScreen)
// 4 → Estadísticas (StatisticsScreen)

class AppShell extends ConsumerStatefulWidget {
  const AppShell({super.key});

  @override
  ConsumerState<AppShell> createState() => _AppShellState();
}

class _AppShellState extends ConsumerState<AppShell> {
  int _currentIndex = 0;

  void _onNavTap(int index) {
    if (_currentIndex == index) return;

    if (index == 1) {
      // El escáner es funcionalidad Pro: mostrar gate antes de entrar
      _handleScannerTap();
      return;
    }

    _switchTab(index);
  }

  /// Cambia de tab actualizando los providers de cámara.
  void _switchTab(int index) {
    // Tab 1: Escáner
    if (_currentIndex == 1 || index == 1) {
      ref.read(scannerTabActiveProvider.notifier).setActive(index == 1);
    }
    // Tab 2: Intercambio
    if (_currentIndex == 2 || index == 2) {
      ref.read(exchangeTabActiveProvider.notifier).setActive(index == 2);
    }
    // Tab 3: Buscar (tiene cámara interna)
    if (_currentIndex == 3 || index == 3) {
      ref.read(lookupTabActiveProvider.notifier).setActive(index == 3);
    }

    setState(() => _currentIndex = index);
  }

  /// Gate Pro para el tab Escáner: delega en showRewarded que maneja diálogo y anuncio.
  Future<void> _handleScannerTap() async {
    final isSubscribed =
        ref.read(subscriptionProvider).asData?.value.isSubscribed ?? false;

    if (isSubscribed) {
      _switchTab(1);
      return;
    }

    if (!mounted) return;

    // showRewarded muestra el diálogo (ver anuncio / pro / ahora no)
    // y reproduce el ad. Si el usuario elige "Ahora no", no hace nada
    // → nos quedamos en el tab actual (no navegamos al scanner).
    bool wentToScanner = false;
    await ref
        .read(adServiceProvider)
        .showRewarded(
          context: context,
          isSubscribed: false,
          onRewarded: () async {
            // onRewarded se llama cuando el ad termina o es suscriptor
            // En este punto ya podemos ir al scanner
            wentToScanner = true;
          },
        );

    // Si el usuario eligió "Ahora no", wentToScanner sigue false
    // y no navegamos. Si eligió ver anuncio o pro, navegamos.
    if (wentToScanner && mounted) {
      _switchTab(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          HomeScreen(),
          ScannerScreen(),
          PhysicalExchangeScreen(),
          StickerLookupScreen(),
          StatisticsScreen(),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const AdBannerWidget(),
          Divider(height: 1, color: Colors.amber),
          BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: _onNavTap,
            backgroundColor: const Color(0xFF1E1E1E),
            selectedItemColor: Colors.amber,
            unselectedItemColor: Colors.white38,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 11,
            unselectedFontSize: 11,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.style_rounded),
                label: l10n.navAlbum,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.document_scanner_outlined),
                label: l10n.navScanner,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.swap_horiz_rounded),
                label: l10n.drawerPhysicalExchange,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.manage_search_rounded),
                label: l10n.drawerLookup,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.bar_chart_rounded),
                label: l10n.drawerStats,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
