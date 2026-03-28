// Archivo: lib/features/auth/data/auth_provider.dart
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:brick_offline_first/brick_offline_first.dart';
import 'package:google_sign_in/google_sign_in.dart'; // Versión 7.0+
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:album_26_sticker_collector/brick/app_repository.dart';
import 'package:album_26_sticker_collector/features/inventory/domain/inventory.model.dart';
import 'package:album_26_sticker_collector/main.dart'; // Tu instancia de supabase

final authControllerProvider = Provider<AuthController>((ref) {
  return AuthController();
});

class AuthController {
  final _repo = AppRepository();

  // --- 1. LOGIN TRADICIONAL (Email/Password) ---
  Future<void> login(String email, String password) async {
    await supabase.auth.signInWithPassword(email: email, password: password);
    await _iniciarSincronizacion();
  }

  // --- 2. LOGIN CON GOOGLE (Adaptado a google_sign_in v7.0+) ---
  Future<void> loginWithGoogle() async {
    const webClientId =
        '853934279575-ea1cqkn04cdvrn9nbk8qi6eufejp9pgu.apps.googleusercontent.com';
    const iosClientId =
        'com.googleusercontent.apps.853934279575-k6kk31vfp4b2d27d4qabvi2u9kn5lahl';

    // 1. Usamos la instancia global según la nueva doc
    final googleSignIn = GoogleSignIn.instance;

    // 2. Inicializamos pasándole los Client IDs
    await googleSignIn.initialize(
      serverClientId: webClientId,
      clientId: iosClientId,
    );

    // 3. Llamamos a authenticate() en lugar de signIn()
    final GoogleSignInAccount googleUser = await googleSignIn.authenticate();

    // if (googleUser == null) {
    //   throw 'Inicio de sesión con Google cancelado.';
    // }

    final googleAuth = googleUser.authentication;
    // final googleauthorizationClient = googleUser.authorizationClient;
    // final accessToken = googleauthorizationClient.accessToken;
    final idToken = googleAuth.idToken;

    if (idToken == null) {
      throw 'No se pudieron obtener los tokens de Google.';
    }

    await supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      // accessToken: accessToken,
    );

    await _iniciarSincronizacion();
  }

  // --- 3. LOGIN CON APPLE ---
  Future<void> loginWithApple() async {
    final rawNonce = supabase.auth.generateRawNonce();
    final hashedNonce = sha256.convert(utf8.encode(rawNonce)).toString();

    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: hashedNonce,
    );

    final idToken = credential.identityToken;
    if (idToken == null) {
      throw 'No se pudo obtener el token de Apple.';
    }

    await supabase.auth.signInWithIdToken(
      provider: OAuthProvider.apple,
      idToken: idToken,
      nonce: rawNonce,
    );

    await _iniciarSincronizacion();
  }

  // --- MÉTODO PRIVADO: INICIAR MOTOR BRICK ---
  Future<void> _iniciarSincronizacion() async {
    try {
      await _repo.get<Inventory>(policy: OfflineFirstGetPolicy.alwaysHydrate);
    } catch (e) {
      print('Aviso: No se pudo hidratar el inventario inicial: $e');
    }
    _repo.startSyncQueue();
  }

  // --- CIERRE DE SESIÓN ---
  Future<void> logout() async {
    try {
      _repo.stopSyncQueue();

      final inventarioLocal = await _repo.sqliteProvider.get<Inventory>();
      for (final item in inventarioLocal) {
        await _repo.sqliteProvider.delete<Inventory>(item);
      }
    } catch (e) {
      print('Error limpiando caché local: $e');
    } finally {
      // Usamos la instancia global para cerrar la sesión de Google
      try {
        await GoogleSignIn.instance.signOut();
      } catch (_) {}

      await supabase.auth.signOut();
    }
  }
}
