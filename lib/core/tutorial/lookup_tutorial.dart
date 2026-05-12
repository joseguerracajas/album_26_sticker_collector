// Archivo: lib/core/tutorial/lookup_tutorial.dart
//
// Tutorial interactivo de StickerLookupScreen.
// Explica: pestañas (manual vs escáner), campo de código y botón buscar.

import 'package:album_26_sticker_collector/core/tutorial/tutorial_keys.dart';
import 'package:album_26_sticker_collector/core/tutorial/tutorial_service.dart';
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class LookupTutorial {
  /// Lanza el tutorial. Llama desde un addPostFrameCallback.
  static void show(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final size = MediaQuery.sizeOf(context);
    final isTablet = size.width >= 600;
    final focusPadding = isTablet ? 20.0 : 10.0;

    final targets = <TargetFocus>[
      // 1 ─ Barra de pestañas (Manual / Escáner)
      TargetFocus(
        identify: 'lookup_tab_bar',
        keyTarget: tutorialLookupTabBarKey,
        shape: ShapeLightFocus.RRect,
        radius: 8,
        paddingFocus: isTablet ? 24.0 : 12.0,
        enableOverlayTab: true,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: _CoachContent(
              icon: Icons.tab_rounded,
              title: l10n.lookupTutorialStep1Title,
              body: l10n.lookupTutorialStep1Body,
              isTablet: isTablet,
            ),
          ),
        ],
      ),

      // 2 ─ Campo de código
      TargetFocus(
        identify: 'lookup_search_field',
        keyTarget: tutorialLookupSearchFieldKey,
        shape: ShapeLightFocus.RRect,
        radius: 16,
        paddingFocus: focusPadding,
        enableOverlayTab: true,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: _CoachContent(
              icon: Icons.keyboard_rounded,
              title: l10n.lookupTutorialStep2Title,
              body: l10n.lookupTutorialStep2Body,
              isTablet: isTablet,
            ),
          ),
        ],
      ),

      // 3 ─ Botón buscar
      TargetFocus(
        identify: 'lookup_search_button',
        keyTarget: tutorialLookupSearchButtonKey,
        shape: ShapeLightFocus.RRect,
        radius: 16,
        paddingFocus: focusPadding,
        enableOverlayTab: true,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            child: _CoachContent(
              icon: Icons.manage_search_rounded,
              title: l10n.lookupTutorialStep3Title,
              body: l10n.lookupTutorialStep3Body,
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
      onFinish: TutorialService.markLookupTutorialDone,
      onSkip: () {
        TutorialService.markLookupTutorialDone();
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

    return Column(
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
  }
}
