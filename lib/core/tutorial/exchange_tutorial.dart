// Archivo: lib/core/tutorial/exchange_tutorial.dart
//
// Tutorial interactivo de la PhysicalExchangeScreen.
// Explica: el marco de escaneo y la barra inferior con contadores y resultados.
// Se lanza la primera vez que el usuario activa la pestaña de intercambio.

import 'package:album_26_sticker_collector/core/tutorial/tutorial_keys.dart';
import 'package:album_26_sticker_collector/core/tutorial/tutorial_service.dart';
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class ExchangeTutorial {
  /// Lanza el tutorial. Llama desde el listener de [exchangeTabActiveProvider].
  static void show(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final size = MediaQuery.sizeOf(context);
    final isTablet = size.width >= 600;
    final focusPadding = isTablet ? 20.0 : 10.0;

    final targets = <TargetFocus>[
      // 1 ─ Marco de escaneo (viewfinder del intercambio)
      TargetFocus(
        identify: 'exchange_frame',
        keyTarget: tutorialExchangeFrameKey,
        shape: ShapeLightFocus.RRect,
        radius: 12,
        paddingFocus: isTablet ? 24.0 : 12.0,
        enableOverlayTab: true,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: _CoachContent(
              icon: Icons.swap_horiz_rounded,
              title: l10n.exchangeTutorialStep1Title,
              body: l10n.exchangeTutorialStep1Body,
              isTablet: isTablet,
            ),
          ),
        ],
      ),

      // 2 ─ Barra inferior: contadores + botón Ver resultados
      TargetFocus(
        identify: 'exchange_bottom_bar',
        keyTarget: tutorialExchangeBottomBarKey,
        shape: ShapeLightFocus.RRect,
        radius: 12,
        paddingFocus: focusPadding,
        enableOverlayTab: true,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            child: _CoachContent(
              icon: Icons.list_alt_rounded,
              title: l10n.exchangeTutorialStep2Title,
              body: l10n.exchangeTutorialStep2Body,
              isTablet: isTablet,
            ),
          ),
        ],
      ),
    ];

    late final TutorialCoachMark tutorial;
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
      onClickOverlay: (_) => tutorial.next(),
      onFinish: TutorialService.markExchangeTutorialDone,
      onSkip: () {
        TutorialService.markExchangeTutorialDone();
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
