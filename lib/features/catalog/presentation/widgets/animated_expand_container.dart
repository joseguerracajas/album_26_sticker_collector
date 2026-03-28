// Archivo: lib/core/presentation/widgets/animated_expand_container.dart

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class AnimatedExpandContainer extends StatelessWidget {
  /// Lo que se ve ANTES de tocar (Ej: La tarjeta del equipo o el botón)
  final Widget Function(BuildContext context, VoidCallback openContainer)
  closedBuilder;

  /// La pantalla a la que VAMOS (Ej: CategoryDetailScreen)
  final Widget Function(BuildContext context, VoidCallback closeContainer)
  openBuilder;

  // Personalización opcional con valores por defecto de tu app
  final Color closedColor;
  final Color openColor;
  final double closedElevation;
  final double borderRadius;
  final Duration duration;

  const AnimatedExpandContainer({
    super.key,
    required this.closedBuilder,
    required this.openBuilder,
    this.closedColor = const Color(0xFF1E1E1E), // Tu gris oscuro
    this.openColor = const Color(0xFF121212), // Tu fondo de pantalla
    this.closedElevation = 1.0,
    this.borderRadius = 16.0,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionType: ContainerTransitionType.fadeThrough,
      transitionDuration: duration,
      openColor: openColor,
      closedColor: closedColor,
      closedElevation: closedElevation,
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      // --- WORKAROUND PARA IOS ---
      // Como perdemos el swipe, nos aseguramos de que el comportamiento
      // del botón "Atrás" físico en Android siga funcionando perfecto.
      useRootNavigator: true,

      openBuilder: openBuilder,
      closedBuilder: closedBuilder,
    );
  }
}
