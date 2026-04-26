// Archivo: lib/features/auth/presentation/profile_screen.dart

import 'package:album_26_sticker_collector/core/utils/supabase_error_mapper.dart';
import 'package:album_26_sticker_collector/features/auth/data/auth_provider.dart';
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // IMPORTANTE: Agregar Riverpod
import 'package:album_26_sticker_collector/main.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  double _pointerDownX = 0;

  Future<void> _actualizarClave(BuildContext context) async {
    final WidgetRef ref = this.ref;
    final l10n = AppLocalizations.of(context);
    final nuevaClaveController = TextEditingController();
    final confirmarClaveController = TextEditingController();

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: const Color(0xFF1E1E1E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: Colors.amber.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.lock_reset,
                    color: Colors.amber,
                    size: 28,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.profileChangePasswordTitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: nuevaClaveController,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: l10n.profileNewPasswordLabel,
                    labelStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Colors.amber,
                    ),
                    filled: true,
                    fillColor: const Color(0xFF2A2A2A),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: confirmarClaveController,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: l10n.profileConfirmNewPasswordLabel,
                    labelStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Colors.amber,
                    ),
                    filled: true,
                    fillColor: const Color(0xFF2A2A2A),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () => Navigator.of(context).pop(true),
                    child: Text(
                      l10n.profileChangePasswordButton,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(
                    l10n.commonCancel,
                    style: const TextStyle(color: Colors.white30, fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    if (confirmed != true) {
      return;
    }

    if (!context.mounted) return;

    final nuevaClave = nuevaClaveController.text.trim();
    final confirmarClave = confirmarClaveController.text.trim();

    if (nuevaClave.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.registerPasswordMinLength),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    if (nuevaClave != confirmarClave) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.registerPasswordsDontMatch),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    try {
      await ref.read(authControllerProvider).updatePassword(nuevaClave);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.profilePasswordUpdatedSuccess),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(mapSupabaseError(e, l10n)),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  // 2. Añadimos WidgetRef a la función para poder leer el Provider
  Future<void> _cerrarSesion(BuildContext context) async {
    final WidgetRef ref = this.ref;
    final l10n = AppLocalizations.of(context);

    try {
      await ref.read(authControllerProvider).logout();

      // Regresamos a HomeScreen eliminando todo el historial de navegación
      if (context.mounted) {
        Navigator.of(context).popUntil((route) => route.isFirst);
      }

      // Mostramos el mensaje usando la clave global (HomeScreen ya está montada)
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          content: Text(l10n.profileLogoutSuccess),
          backgroundColor: Colors.blueGrey,
        ),
      );
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(mapSupabaseError(e, l10n)),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    // Obtenemos el usuario actual de Supabase para mostrar su correo
    final user = supabase.auth.currentUser;
    final nombreUsuario =
        (user?.userMetadata?['full_name'] ??
                user?.userMetadata?['name'] ??
                user?.email?.split('@').first ??
                l10n.profileUnknownUser)
            .toString();

    return Listener(
      onPointerDown: (event) => _pointerDownX = event.localPosition.dx,
      child: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (_pointerDownX < 30 &&
              details.primaryVelocity != null &&
              details.primaryVelocity! > 100) {
            Navigator.of(context).pop();
          }
        },
        child: Scaffold(
          backgroundColor: const Color(0xFF121212),
          appBar: AppBar(
            title: Text(
              l10n.profileTitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.amber),
          ),
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                // Avatar genérico
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.amber,
                  child: Icon(Icons.person, size: 50, color: Colors.black),
                ),
                const SizedBox(height: 20),

                // Correo del usuario
                Text(
                  nombreUsuario,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.profileOfficialCollector,
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),

                const Spacer(), // Empuja el botón hacia abajo
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey.shade800,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 55),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  icon: const Icon(Icons.lock_reset),
                  label: Text(
                    l10n.profileChangePasswordButton,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  onPressed: () => _actualizarClave(context),
                ),
                const SizedBox(height: 12),
                // Botón de Cerrar Sesión
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade900,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 55),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  icon: const Icon(Icons.logout),
                  label: Text(
                    l10n.profileLogoutButton,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  onPressed: () => _cerrarSesion(context),
                ),
                const SizedBox(height: 40), // Espacio inferior seguro
              ],
            ),
          ),
        ),
      ),
    );
  }
}
