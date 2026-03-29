// Archivo: lib/features/auth/data/auth_provider.dart
import 'dart:convert';
import 'package:album_26_sticker_collector/brick/app_repository.dart';
import 'package:album_26_sticker_collector/features/inventory/data/inventory_provider.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:brick_offline_first/brick_offline_first.dart';
import 'package:google_sign_in/google_sign_in.dart'; // Versión 7.0+
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:album_26_sticker_collector/features/inventory/domain/inventory.model.dart';
import 'package:album_26_sticker_collector/main.dart'; // Tu instancia de supabase

final authControllerProvider = Provider<AuthController>((ref) {
  return AuthController(ref);
});

class AuthController {
  AuthController(this._ref);

  final Ref _ref;
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
        '853934279575-k6kk31vfp4b2d27d4qabvi2u9kn5lahl.apps.googleusercontent.com';

    final scopes = ['email', 'profile'];
    final googleSignIn = GoogleSignIn.instance;

    await googleSignIn.initialize(
      serverClientId: webClientId,
      clientId: iosClientId,
    );

    // Usamos authenticate() como dice la doc
    final googleUser = await googleSignIn.authenticate();

    // La nueva forma de pedir autorización según los docs de Supabase
    final authorization =
        await googleUser.authorizationClient.authorizationForScopes(scopes) ??
        await googleUser.authorizationClient.authorizeScopes(scopes);

    final googleAuth = googleUser.authentication;
    final idToken = googleAuth.idToken;

    if (idToken == null) {
      throw 'No se pudo obtener el ID Token de Google.';
    }

    // Le mandamos ambos tokens a Supabase tal como piden
    await supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: authorization.accessToken,
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

  Future<void> _iniciarSincronizacion() async {
    _repo.memoryCacheProvider.reset();
    _repo.startSyncQueue();
    _ref.invalidate(inventoryProvider);
  }

  // --- CIERRE DE SESIÓN ---
  Future<void> logout() async {
    try {
      _repo.stopSyncQueue();
      _repo.memoryCacheProvider.reset();
      _ref.read(inventoryProvider.notifier).clear();
      _ref.invalidate(inventoryProvider);
      print('Cerrando sesión y limpiando caché local...');
    } catch (e) {
      print('Error limpiando caché local: $e');
    } finally {
      try {
        await GoogleSignIn.instance.signOut();
      } catch (_) {}

      await supabase.auth.signOut();
    }
  }
}
