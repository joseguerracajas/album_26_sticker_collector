// Archivo: lib/features/auth/presentation/profile_screen.dart

import 'package:album_26_sticker_collector/brick/app_repository.dart';
import 'package:album_26_sticker_collector/features/inventory/domain/inventory.model.dart';
import 'package:flutter/material.dart';
import 'package:album_26_sticker_collector/main.dart';
import 'auth_screen.dart'; // Tu instancia de supabase
// IMPORTANTE: Asegúrate de importar aquí tu pantalla de Login
// import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _cerrarSesion(BuildContext context) async {
    try {
      final repo = AppRepository();

      // 1. FRENAR LA COLA: Le decimos a Brick que deje de intentar enviar cosas
      repo.offlineRequestQueue.stop();

      try {
        // 2. BORRAR INVENTARIO LOCAL SILENCIOSAMENTE
        // Usamos 'sqliteProvider.get' y 'sqliteProvider.delete' para que Brick
        // NO intente subir estos borrados a Supabase.
        final inventarioLocal = await repo.sqliteProvider.get<Inventory>();

        for (final item in inventarioLocal) {
          await repo.sqliteProvider.delete<Inventory>(item);
        }

        // (Haz lo mismo si tienes otras tablas privadas)

        // 3. VACIAR LA "MOCHILA" (Opcional pero ideal)
        // Esto borra los intentos atascados (#68, etc.) para que cuando inicie
        // sesión otro usuario, no se envíen los cromos del usuario anterior.
        // Dependiendo de tu versión de Brick, puedes hacer esto:
        // await repo.offlineRequestQueue.requestManager.clear();
      } catch (e) {
        print('Error limpiando datos locales: $e');
      }
      // 1. Cerramos sesión en Supabase
      await supabase.auth.signOut();

      // 2. Redirigimos al Login borrando el historial de navegación
      if (context.mounted) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const Scaffold(body: LoginScreen()),
          ),
          (Route<dynamic> route) =>
              false, // Esto evita que el usuario pueda volver atrás con el botón de Android
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al cerrar sesión: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Obtenemos el usuario actual de Supabase
    final user = supabase.auth.currentUser;

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text(
          'Mi Perfil',
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
              user?.email ?? 'Usuario desconocido',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Coleccionista Oficial',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),

            const Spacer(), // Empuja el botón hacia abajo
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
              label: const Text(
                'Cerrar Sesión',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              onPressed: () => _cerrarSesion(context),
            ),
            const SizedBox(height: 40), // Espacio inferior seguro
          ],
        ),
      ),
    );
  }
}
