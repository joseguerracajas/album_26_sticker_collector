// Archivo: lib/features/catalog/presentation/widgets/animated_sticker_card.dart

import 'package:flutter/material.dart';
import 'package:album_26_sticker_collector/features/catalog/domain/sticker.model.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedStickerCard extends StatefulWidget {
  final Sticker sticker;
  final int totalCromos;
  final bool tieneEspecial;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const AnimatedStickerCard({
    super.key,
    required this.sticker,
    required this.totalCromos,
    required this.tieneEspecial,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  State<AnimatedStickerCard> createState() => _AnimatedStickerCardState();
}

class _AnimatedStickerCardState extends State<AnimatedStickerCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _tapController;

  @override
  void initState() {
    super.initState();
    // Creamos el controlador, pero NO lo iniciamos.
    _tapController = AnimationController(vsync: this);
  }

  @override
  void didUpdateWidget(covariant AnimatedStickerCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    // ¡LA MAGIA DEL CONTROL!
    // Solo disparamos la animación extrema si la cantidad de cromos cambió (por un tap)
    if (oldWidget.totalCromos != widget.totalCromos) {
      _tapController.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    _tapController.dispose();
    super.dispose();
  }

  // MÉTODO AYUDANTE: Aquí guardamos nuestra animación premium
  // Retorna 'Animate' para poder seguir encadenando cosas si queremos
  Animate _existingStickerAnimation(Animate anim) {
    if (widget.tieneEspecial) {
      // Si es un cromo especial (Gold/Legend), brilla dorado y vibra más
      return anim
          .shimmer(duration: 400.ms, color: Colors.amber, angle: 1.2)
          .shake(hz: 5, rotation: 0.1, duration: 500.ms, curve: Curves.easeOut);
    } else {
      // Si es un cromo normal, usa la animación sutil blanca
      return anim
          .shimmer(
            duration: 200.ms,
            color: Colors.white.withValues(alpha: 0.7),
            angle: 1.2,
          )
          .shake(
            hz: 3,
            rotation: 0.08,
            duration: 400.ms,
            curve: Curves.easeOut,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final tieneCromo = widget.totalCromos > 0;

    // 1. Tu tarjeta normalita (con AnimatedContainer para cambios de color suaves)
    Widget card = GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        widget.onTap();
      },
      onLongPress: () {
        HapticFeedback.heavyImpact();
        widget.onLongPress();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: tieneCromo ? Colors.amber : const Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: tieneCromo ? Colors.amber.shade700 : Colors.grey.shade800,
            width: tieneCromo ? 2 : 1,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.sticker.categoryId,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: tieneCromo ? Colors.black : Colors.grey,
                    ),
                  ),
                  Text(
                    widget.sticker.stickerCode,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: tieneCromo ? Colors.black : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            if (widget.tieneEspecial)
              const Positioned(
                top: 4,
                right: 4,
                child: Icon(Icons.star, color: Colors.white, size: 16),
              ),
            if (widget.totalCromos > 1)
              Positioned(
                bottom: 4,
                left: 0,
                right: 0,
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.copy_all_rounded,
                        color: Colors.black54,
                        size: 13,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        '+${widget.totalCromos - 1}',
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );

    // --- 2. EFECTO DE INTERACCIÓN (Tap) ---
    // Empezamos con la tarjeta y el controlador, y la pasamos por el método
    Animate animacionTap = _existingStickerAnimation(
      card.animate(controller: _tapController, autoPlay: false),
    );

    // --- 3. EFECTO DE INTRODUCCIÓN (Scroll / Render) ---
    // Agregamos un nuevo .animate() vacío para iniciar la intro que se ejecuta sola
    Animate animacionIntro = animacionTap.animate();

    // 4. APLICAMOS TU LÓGICA DEFINITIVA
    if (tieneCromo) {
      // Si ya lo tiene, entra brillando y temblando (reciclando tu método)
      return _existingStickerAnimation(animacionIntro);
    } else {
      // Si NO lo tiene (gris), entra suavecito flotando hacia arriba
      return animacionIntro
          .fadeIn(duration: 400.ms, curve: Curves.easeOut)
          .slideY(begin: 0.1, end: 0, curve: Curves.easeOut);
    }
  }
}
