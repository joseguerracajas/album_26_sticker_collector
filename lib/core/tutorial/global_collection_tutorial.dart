// Archivo: lib/core/tutorial/global_collection_tutorial.dart
//
// Tutorial interactivo de GlobalCollectionScreen y CategoryDetailScreen.
// Explica: filtros, búsqueda, tap simple y long press en las cards de cromo.

import 'package:album_26_sticker_collector/core/tutorial/tutorial_keys.dart';
import 'package:album_26_sticker_collector/core/tutorial/tutorial_service.dart';
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class GlobalCollectionTutorial {
  /// Lanza el tutorial. Llama desde un addPostFrameCallback.
  static void show(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final size = MediaQuery.sizeOf(context);
    final isTablet = size.width >= 600;
    final focusPadding = isTablet ? 20.0 : 10.0;

    final targets = <TargetFocus>[
      // 1 ─ Barra de filtros (Todos / Faltantes / Repetidas)
      TargetFocus(
        identify: 'filter_bar',
        keyTarget: tutorialFilterBarKey,
        shape: ShapeLightFocus.RRect,
        radius: 12,
        paddingFocus: focusPadding,
        enableOverlayTab: true,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: _CoachContent(
              icon: Icons.filter_list_rounded,
              title: l10n.globalTutorialStep1Title,
              body: l10n.globalTutorialStep1Body,
              isTablet: isTablet,
            ),
          ),
        ],
      ),

      // 2 ─ Buscador de cromos
      TargetFocus(
        identify: 'sticker_search',
        keyTarget: tutorialStickerSearchKey,
        shape: ShapeLightFocus.RRect,
        radius: 12,
        paddingFocus: focusPadding,
        enableOverlayTab: true,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: _CoachContent(
              icon: Icons.search,
              title: l10n.globalTutorialStep2Title,
              body: l10n.globalTutorialStep2Body,
              isTablet: isTablet,
            ),
          ),
        ],
      ),

      // 3 ─ Tap simple en una card (marcar / desmarcar)
      TargetFocus(
        identify: 'sticker_card_tap',
        keyTarget: tutorialStickerCardKey,
        shape: ShapeLightFocus.RRect,
        radius: 8,
        paddingFocus: isTablet ? 18.0 : 8.0,
        enableOverlayTab: true,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: _CoachContent(
              icon: Icons.touch_app_rounded,
              title: l10n.globalTutorialStep3Title,
              body: l10n.globalTutorialStep3Body,
              isTablet: isTablet,
            ),
          ),
        ],
      ),

      // 4 ─ Long press en una card (opciones avanzadas / más copias)
      TargetFocus(
        identify: 'sticker_card_longpress',
        keyTarget: tutorialStickerCardKey,
        shape: ShapeLightFocus.RRect,
        radius: 8,
        paddingFocus: isTablet ? 18.0 : 8.0,
        enableOverlayTab: true,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: _CoachContent(
              icon: Icons.pan_tool_rounded,
              title: l10n.globalTutorialStep4Title,
              body: l10n.globalTutorialStep4Body,
              isTablet: isTablet,
            ),
          ),
        ],
      ),
    ];

    late final TutorialCoachMark tutorial;
    // Protege el step de long press: el primer tap que llega es el propagado
    // del step anterior (mismo widget target). Lo bloqueamos 400ms.
    bool longPressReady = false;
    tutorial = TutorialCoachMark(
      targets: targets,
      colorShadow: Colors.black,
      opacityShadow: 0.85,
      textSkip: l10n.tutorialSkip,
      textStyleSkip: const TextStyle(
        color: Colors.amber,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      paddingFocus: focusPadding,
      focusAnimationDuration: const Duration(milliseconds: 350),
      unFocusAnimationDuration: const Duration(milliseconds: 350),
      onClickOverlay: (target) {
        if (target.identify == 'sticker_card_longpress') {
          if (longPressReady) {
            tutorial.next();
          } else {
            // Primer tap = propagado del step anterior. Habilitar tras 400ms.
            Future.delayed(const Duration(milliseconds: 400), () {
              longPressReady = true;
            });
          }
          return;
        }
        tutorial.next();
      },
      onFinish: TutorialService.markStickerGridTutorialDone,
      onSkip: () {
        TutorialService.markStickerGridTutorialDone();
        return true;
      },
    )..show(context: context);
  }
}

// ─── Widget de contenido del coachmark ────────────────────────────────────────

class _CoachContent extends StatelessWidget {
  final IconData icon;
  final String title;
  final String body;
  final bool isTablet;

  const _CoachContent({
    required this.icon,
    required this.title,
    required this.body,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    final titleSize = isTablet ? 20.0 : 18.0;
    final bodySize = isTablet ? 15.0 : 14.0;
    final iconSize = isTablet ? 32.0 : 28.0;

    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.amber, size: iconSize),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: titleSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          body,
          style: TextStyle(
            color: Colors.white70,
            fontSize: bodySize,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          AppLocalizations.of(context).tutorialTapToContinue,
          style: const TextStyle(
            color: Colors.amber,
            fontSize: 12,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );

    if (isTablet) {
      return ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480),
        child: content,
      );
    }
    return content;
  }
}
