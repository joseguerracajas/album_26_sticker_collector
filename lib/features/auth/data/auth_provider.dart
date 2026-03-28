// Archivo: lib/features/auth/presentation/auth_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:brick_offline_first/brick_offline_first.dart';
import 'package:album_26_sticker_collector/brick/app_repository.dart';
import 'package:album_26_sticker_collector/features/inventory/domain/inventory.model.dart';
import 'package:album_26_sticker_collector/main.dart'; // Tu instancia de supabase

final authControllerProvider = Provider<AuthController>((ref) {
  return AuthController();
});

class AuthController {
  final _repo = AppRepository();

  // --- INICIO DE SESIÓN ---
  Future<void> login(String email, String password) async {
    // 1. Iniciamos sesión en Supabase
    await supabase.auth.signInWithPassword(email: email, password: password);

    // 2. Traemos el inventario fresco de la nube a SQLite
    // Usamos alwaysHydrate para forzar a que baje lo último de Supabase
    try {
      await _repo.get<Inventory>(policy: OfflineFirstGetPolicy.alwaysHydrate);
    } catch (e) {
      print('Aviso: No se pudo hidratar el inventario inicial: $e');
    }

    // 3. ¡ENCENDEMOS LA COLA!
    // Ahora que hay un usuario logueado válido, Brick ya puede encolar
    // y subir datos sin que Supabase lo rechace.
    _repo.startSyncQueue();
  }

  // --- CIERRE DE SESIÓN ---
  Future<void> logout() async {
    try {
      // 1. Apagamos la cola
      _repo.stopSyncQueue();

      // 2. Limpieza silenciosa de SQLite
      final inventarioLocal = await _repo.sqliteProvider.get<Inventory>();
      for (final item in inventarioLocal) {
        await _repo.sqliteProvider.delete<Inventory>(item);
      }
    } catch (e) {
      print('Error limpiando caché local: $e');
    } finally {
      // 3. Cerramos sesión en Supabase
      await supabase.auth.signOut();
    }
  }
}
