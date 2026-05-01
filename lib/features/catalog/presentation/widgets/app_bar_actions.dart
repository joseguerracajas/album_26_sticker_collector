import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Importa tus dependencias reales aquí
import 'package:album_26_sticker_collector/core/tutorial/tutorial_keys.dart';
import 'package:album_26_sticker_collector/features/inventory/presentation/scanner_screen.dart';
import 'package:album_26_sticker_collector/features/inventory/data/share_provider.dart';
import 'package:album_26_sticker_collector/features/monetization/data/ads_provider.dart';
import 'package:album_26_sticker_collector/features/monetization/data/subscription_provider.dart';
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';

// ─── 1. WIDGET DEL BOTÓN DEL ESCÁNER ──────────────────────────────────────────
class ScannerIconButton extends ConsumerWidget {
  const ScannerIconButton({super.key, this.showTutorialKey = false});

  final bool showTutorialKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);

    return IconButton(
      key: showTutorialKey ? tutorialScannerKey : null,
      icon: const Icon(Icons.document_scanner_outlined, color: Colors.amber),
      tooltip: l10n.homeScanButton,
      onPressed: () async {
        HapticFeedback.heavyImpact();

        final isSubscribed = ref.read(isSubscribedProvider);

        await ref
            .read(adServiceProvider)
            .showRewarded(
              context: context,
              isSubscribed: isSubscribed,
              onRewarded: () async {
                if (context.mounted) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ScannerScreen()),
                  );
                }
              },
            );
      },
    );
  }
}

// ─── 2. WIDGET DEL MENÚ DE COMPARTIR ────────────────────────────────────────
class ShareMenuButton extends ConsumerWidget {
  const ShareMenuButton({super.key, this.showTutorialKey = false});

  final bool showTutorialKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final isLoading = ref.watch(shareProvider);

    if (isLoading) {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: Colors.amber,
            ),
          ),
        ),
      );
    }

    return PopupMenuButton<ShareType>(
      key: showTutorialKey ? tutorialShareKey : null,
      icon: const Icon(Icons.share, color: Colors.amber),
      color: const Color(0xFF1E1E1E),
      onSelected: (ShareType tipo) async {
        final isSubscribed = ref.read(isSubscribedProvider);

        await ref
            .read(adServiceProvider)
            .showRewarded(
              context: context,
              isSubscribed: isSubscribed,
              onRewarded: () async {
                try {
                  await ref
                      .read(shareProvider.notifier)
                      .generarYCompartirLista(context, tipo);
                } catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(l10n.commonErrorWithMessage(e)),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                }
              },
            );
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<ShareType>>[
        PopupMenuItem<ShareType>(
          value: ShareType.todos,
          child: ListTile(
            leading: const Icon(Icons.list_alt, color: Colors.amber),
            title: Text(
              l10n.homeShareAll,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        PopupMenuItem<ShareType>(
          value: ShareType.faltantes,
          child: ListTile(
            leading: const Icon(Icons.close, color: Colors.redAccent),
            title: Text(
              l10n.homeShareMissingOnly,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        PopupMenuItem<ShareType>(
          value: ShareType.repetidos,
          child: ListTile(
            leading: const Icon(Icons.repeat, color: Colors.greenAccent),
            title: Text(
              l10n.homeShareDuplicatesOnly,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
