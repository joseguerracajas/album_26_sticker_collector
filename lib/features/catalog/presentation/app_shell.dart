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
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Índices del BottomNavigationBar:
// 0 → Album (HomeScreen)
// 1 → Escáner  (push modal, no tab persistente)
// 2 → Intercambio (PhysicalExchangeScreen)
// 3 → Buscar (StickerLookupScreen)
// 4 → Estadísticas (StatisticsScreen)

// Mapa de índice nav → índice en el IndexedStack (el escáner no tiene slot)
const _stackIndex = {0: 0, 2: 1, 3: 2, 4: 3};

class AppShell extends ConsumerStatefulWidget {
  const AppShell({super.key});

  @override
  ConsumerState<AppShell> createState() => _AppShellState();
}

class _AppShellState extends ConsumerState<AppShell> {
  int _currentNavIndex = 0;
  int _currentStackIndex = 0;

  Future<void> _onNavTap(int index) async {
    if (index == 1) {
      // Escáner: lanzar como pantalla push con lógica de anuncio
      HapticFeedback.heavyImpact();
      final isSubscribed = ref.read(isSubscribedProvider);
      await ref
          .read(adServiceProvider)
          .showRewarded(
            context: context,
            isSubscribed: isSubscribed,
            onRewarded: () async {
              if (context.mounted) {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ScannerScreen()),
                );
              }
            },
          );
      return;
    }
    if (_currentNavIndex == index) return;
    setState(() {
      _currentNavIndex = index;
      _currentStackIndex = _stackIndex[index]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      body: IndexedStack(
        index: _currentStackIndex,
        children: const [
          HomeScreen(),
          PhysicalExchangeScreen(),
          StickerLookupScreen(),
          StatisticsScreen(),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const AdBannerWidget(),
          BottomNavigationBar(
            currentIndex: _currentNavIndex,
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
