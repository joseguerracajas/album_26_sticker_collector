// Archivo: lib/features/catalog/presentation/widgets/category_avatar.dart

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CategoryAvatar extends StatelessWidget {
  final String? iconUrl;
  final String text;
  final double radius; // Permite cambiar el tamaño desde donde lo llames

  const CategoryAvatar({
    super.key,
    required this.iconUrl,
    required this.text,
    this.radius = 24.0, // 24 por defecto, justo como lo tenías
  });

  @override
  Widget build(BuildContext context) {
    final double diameter = radius * 2;

    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.grey.shade900,
      child: ClipOval(
        child: iconUrl != null && iconUrl!.isNotEmpty
            ? CachedNetworkImage(
                imageUrl: iconUrl!,
                width: diameter,
                height: diameter,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.amber,
                  ),
                ),
                errorWidget: (context, url, error) => _buildFallback(),
              )
            : _buildFallback(),
      ),
    );
  }

  // Tu misma lógica de respaldo, pero con tamaño de letra dinámico
  Widget _buildFallback() {
    return Center(
      child: Text(
        text.length >= 2
            ? text.substring(0, 2).toUpperCase()
            : text.toUpperCase(),
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: radius * 0.6, // La letra se adapta si cambias el radius
        ),
      ),
    );
  }
}
