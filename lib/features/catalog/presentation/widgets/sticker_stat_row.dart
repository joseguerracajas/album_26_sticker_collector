import 'package:flutter/material.dart';

/// Fila compacta con tres estadísticas: coleccionadas/total, faltantes y repetidos.
/// Los colores se pasan explícitamente para que cada pantalla use su propia paleta.
class StickerStatRow extends StatelessWidget {
  final int collected;
  final int total;
  final int missing;
  final int duplicateCopies;
  final Color collectedColor;
  final Color missingColor;
  final Color duplicatesColor;

  const StickerStatRow({
    super.key,
    required this.collected,
    required this.total,
    required this.missing,
    required this.duplicateCopies,
    required this.collectedColor,
    required this.missingColor,
    required this.duplicatesColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _Stat(
          icon: Icons.check_circle_outline_rounded,
          value: '$collected/$total',
          color: collectedColor,
        ),
        const SizedBox(width: 14),
        _Stat(
          icon: Icons.radio_button_unchecked_rounded,
          value: '$missing',
          color: missingColor,
        ),
        const SizedBox(width: 14),
        _Stat(
          icon: Icons.copy_all_rounded,
          value: '+$duplicateCopies',
          color: duplicatesColor,
        ),
      ],
    );
  }
}

class _Stat extends StatelessWidget {
  final IconData icon;
  final String value;
  final Color color;

  const _Stat({required this.icon, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 13),
        const SizedBox(width: 3),
        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
