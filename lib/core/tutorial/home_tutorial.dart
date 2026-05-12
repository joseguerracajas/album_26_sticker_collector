// Archivo: lib/core/tutorial/home_tutorial.dart
//
// Construye y lanza el tutorial interactivo de la HomeScreen.

import 'package:album_26_sticker_collector/core/tutorial/tutorial_keys.dart';
import 'package:album_26_sticker_collector/core/tutorial/tutorial_service.dart';
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class HomeTutorial {
  /// Lanza el tutorial. Llama desde un addPostFrameCallback.
  static void show(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final size = MediaQuery.sizeOf(context);

    // En iPad (ancho ≥ 600) usamos más padding y alineación diferente para el AppBar.
    final isTablet = size.width >= 600;
    final focusPadding = isTablet ? 20.0 : 10.0;
    // Los botones del AppBar están arriba: en tablet el texto queda mejor abajo;
    // en phone también queda bien abajo. Pero si el botón está muy cerca del borde
    // superior, usamos bottom en ambos casos.
    final appBarContentAlign = ContentAlign.bottom;

    final targets = <TargetFocus>[
      // 1 ─ Tarjeta de progreso global
      TargetFocus(
        identify: 'progress_card',
        keyTarget: tutorialProgressCardKey,
        shape: ShapeLightFocus.RRect,
        radius: 24,
        paddingFocus: focusPadding,
        enableOverlayTab: true,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: _CoachContent(
              icon: Icons.bar_chart_rounded,
              title: l10n.tutorialStep1Title,
              body: l10n.tutorialStep1Body,
              isTablet: isTablet,
            ),
          ),
        ],
      ),

      // 2 ─ Buscador de equipos
      TargetFocus(
        identify: 'search_bar',
        keyTarget: tutorialSearchBarKey,
        shape: ShapeLightFocus.RRect,
        radius: 15,
        paddingFocus: focusPadding,
        enableOverlayTab: true,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: _CoachContent(
              icon: Icons.search,
              title: l10n.tutorialStep2Title,
              body: l10n.tutorialStep2Body,
              isTablet: isTablet,
            ),
          ),
        ],
      ),

      // 3 ─ Menú lateral (hamburguesa)
      TargetFocus(
        identify: 'drawer_button',
        keyTarget: tutorialDrawerKey,
        shape: ShapeLightFocus.RRect,
        radius: 8,
        // En tablet los botones del AppBar son más grandes visualmente;
        // aumentamos el padding para que el resaltado se vea bien.
        paddingFocus: isTablet ? 28.0 : 14.0,
        enableOverlayTab: true,
        contents: [
          TargetContent(
            align: appBarContentAlign,
            child: _CoachContent(
              icon: Icons.menu,
              title: l10n.tutorialStep3Title,
              body: l10n.tutorialStep3Body,
              isTablet: isTablet,
            ),
          ),
        ],
      ),

      // 4 ─ Botón compartir
      TargetFocus(
        identify: 'share_button',
        keyTarget: tutorialShareKey,
        shape: ShapeLightFocus.RRect,
        radius: 8,
        paddingFocus: isTablet ? 28.0 : 14.0,
        enableOverlayTab: true,
        contents: [
          TargetContent(
            align: appBarContentAlign,
            child: _CoachContent(
              icon: Icons.share,
              title: l10n.tutorialStep5Title,
              body: l10n.tutorialStep5Body,
              isTablet: isTablet,
            ),
          ),
        ],
      ),

      // 5 ─ Primera categoría – invita a explorarla
      TargetFocus(
        identify: 'category_tile',
        keyTarget: tutorialCategoryTileKey,
        shape: ShapeLightFocus.RRect,
        radius: 16,
        paddingFocus: focusPadding,
        enableOverlayTab: true,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            child: _CoachContent(
              icon: Icons.flag_rounded,
              title: l10n.tutorialStep6Title,
              body: l10n.tutorialStep6Body,
              isTablet: isTablet,
            ),
          ),
        ],
      ),

      // 6 ─ Nav: Álbum
      TargetFocus(
        identify: 'nav_album',
        keyTarget: tutorialNavAlbumKey,
        shape: ShapeLightFocus.RRect,
        radius: 8,
        paddingFocus: isTablet ? 20.0 : 10.0,
        enableOverlayTab: true,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            child: _CoachContent(
              icon: Icons.style_rounded,
              title: l10n.tutorialNavAlbumTitle,
              body: l10n.tutorialNavAlbumBody,
              isTablet: isTablet,
            ),
          ),
        ],
      ),

      // 7 ─ Nav: Escáner
      TargetFocus(
        identify: 'nav_scanner',
        keyTarget: tutorialNavScannerKey,
        shape: ShapeLightFocus.RRect,
        radius: 8,
        paddingFocus: isTablet ? 20.0 : 10.0,
        enableOverlayTab: true,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            child: _CoachContent(
              icon: Icons.document_scanner_outlined,
              title: l10n.tutorialNavScannerTitle,
              body: l10n.tutorialNavScannerBody,
              isTablet: isTablet,
            ),
          ),
        ],
      ),

      // 8 ─ Nav: Intercambio
      TargetFocus(
        identify: 'nav_exchange',
        keyTarget: tutorialNavExchangeKey,
        shape: ShapeLightFocus.RRect,
        radius: 8,
        paddingFocus: isTablet ? 20.0 : 10.0,
        enableOverlayTab: true,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            child: _CoachContent(
              icon: Icons.swap_horiz_rounded,
              title: l10n.tutorialNavExchangeTitle,
              body: l10n.tutorialNavExchangeBody,
              isTablet: isTablet,
            ),
          ),
        ],
      ),

      // 9 ─ Nav: Buscar
      TargetFocus(
        identify: 'nav_lookup',
        keyTarget: tutorialNavLookupKey,
        shape: ShapeLightFocus.RRect,
        radius: 8,
        paddingFocus: isTablet ? 20.0 : 10.0,
        enableOverlayTab: true,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            child: _CoachContent(
              icon: Icons.manage_search_rounded,
              title: l10n.tutorialNavLookupTitle,
              body: l10n.tutorialNavLookupBody,
              isTablet: isTablet,
            ),
          ),
        ],
      ),

      // 10 ─ Nav: Estadísticas
      TargetFocus(
        identify: 'nav_stats',
        keyTarget: tutorialNavStatsKey,
        shape: ShapeLightFocus.RRect,
        radius: 8,
        paddingFocus: isTablet ? 20.0 : 10.0,
        enableOverlayTab: true,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            child: _CoachContent(
              icon: Icons.bar_chart_rounded,
              title: l10n.tutorialNavStatsTitle,
              body: l10n.tutorialNavStatsBody,
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
      onFinish: TutorialService.markHomeTutorialDone,
      onSkip: () {
        TutorialService.markHomeTutorialDone();
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

    // En tablet limitamos el ancho para que el texto no se estire
    // por toda la pantalla ancha del iPad.
    if (isTablet) {
      return ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480),
        child: content,
      );
    }
    return content;
  }
}
