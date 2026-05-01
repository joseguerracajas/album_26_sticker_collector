// Archivo: lib/core/tutorial/variant_tutorial.dart
//
// Tutorial interactivo del VariantSelectorSheet.
// Aparece sobre el bottom sheet usando rootOverlay: true.
// Solo se lanza la primera vez que el sheet es obligatorio (mandatory: true).

import 'package:album_26_sticker_collector/core/tutorial/tutorial_keys.dart';
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class VariantTutorial {
  /// Lanza el tutorial sobre el VariantSelectorSheet.
  /// Usa rootOverlay: true para aparecer encima del modal.
  static void show(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isTablet = MediaQuery.sizeOf(context).width >= 600;

    final targets = <TargetFocus>[
      TargetFocus(
        identify: 'variant_list',
        keyTarget: tutorialVariantListKey,
        shape: ShapeLightFocus.RRect,
        radius: 14,
        paddingFocus: isTablet ? 16.0 : 8.0,
        enableOverlayTab: true,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            child: _CoachContent(
              icon: Icons.public,
              title: l10n.variantTutorialTitle,
              body: l10n.variantTutorialBody,
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
      opacityShadow: 0.75,
      hideSkip: true,
      paddingFocus: isTablet ? 16.0 : 8.0,
      focusAnimationDuration: const Duration(milliseconds: 350),
      unFocusAnimationDuration: const Duration(milliseconds: 350),
      onClickOverlay: (_) => tutorial.next(),
      onClickTarget: (_) => tutorial.next(),
    )..show(context: context, rootOverlay: true);
  }
}

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
