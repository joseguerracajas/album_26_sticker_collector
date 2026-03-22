// Archivo: lib/features/auth/presentation/profile_screen.dart

import 'package:flutter/material.dart';
import '../../../main.dart';
import 'auth_screen.dart'; // Tu instancia de supabase
// IMPORTANTE: Asegúrate de importar aquí tu pantalla de Login
// import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _cerrarSesion(BuildContext context) async {
    try {
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
