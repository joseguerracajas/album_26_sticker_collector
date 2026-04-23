// Archivo: lib/features/auth/presentation/profile_screen.dart

import 'package:album_26_sticker_collector/features/auth/data/auth_provider.dart';
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // IMPORTANTE: Agregar Riverpod
import 'package:album_26_sticker_collector/main.dart';
import 'auth_screen.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  Future<void> _actualizarClave(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context);
    final nuevaClaveController = TextEditingController();
    final confirmarClaveController = TextEditingController();

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(l10n.profileChangePasswordTitle),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nuevaClaveController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: l10n.profileNewPasswordLabel,
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: confirmarClaveController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: l10n.profileConfirmNewPasswordLabel,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(l10n.commonCancel),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(l10n.profileChangePasswordButton),
            ),
          ],
        );
      },
    );

    if (confirmed != true) {
      return;
    }

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
            content: Text(l10n.commonErrorWithMessage(e.toString())),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  // 2. Añadimos WidgetRef a la función para poder leer el Provider
  void _cerrarSesion(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context);

    try {
      await ref.read(authControllerProvider).logout();

      // 4. Redirigimos al Login borrando el historial de navegación
      if (context.mounted) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const Scaffold(body: LoginScreen()),
          ),
          (Route<dynamic> route) => false, // Evita que el usuario vuelva atrás
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.profileLogoutError(e.toString())),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  // 5. Añadimos WidgetRef al método build
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);

    // Obtenemos el usuario actual de Supabase para mostrar su correo
    final user = supabase.auth.currentUser;
    final nombreUsuario =
        (user?.userMetadata?['full_name'] ??
                user?.userMetadata?['name'] ??
                user?.email?.split('@').first ??
                l10n.profileUnknownUser)
            .toString();

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: Text(
          l10n.profileTitle,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
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
              onPressed: () => _actualizarClave(context, ref),
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
              // 6. Le pasamos el context y el ref a nuestra función
              onPressed: () => _cerrarSesion(context, ref),
            ),
            const SizedBox(height: 40), // Espacio inferior seguro
          ],
        ),
      ),
    );
  }
}
