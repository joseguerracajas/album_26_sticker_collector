// Archivo: lib/features/auth/data/auth_provider.dart
import 'dart:convert';
import 'package:album_26_sticker_collector/brick/app_repository.dart';
import 'package:album_26_sticker_collector/features/auth/data/guest_session_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/data/sync_provider.dart';
import 'package:album_26_sticker_collector/features/inventory/data/inventory_provider.dart';
import 'package:album_26_sticker_collector/features/monetization/data/subscription_provider.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart'; // Versión 7.0+
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:album_26_sticker_collector/main.dart'; // Tu instancia de supabase

final authControllerProvider = Provider<AuthController>((ref) {
  return AuthController(ref);
});

enum GuestMergeResult { none, migratedGuestToNewAccount, usedExistingRemote }

class GuestMergeResultNotifier extends Notifier<GuestMergeResult> {
  @override
  GuestMergeResult build() => GuestMergeResult.none;

  void setResult(GuestMergeResult result) {
    state = result;
  }
}

final guestMergeResultProvider =
    NotifierProvider<GuestMergeResultNotifier, GuestMergeResult>(
      GuestMergeResultNotifier.new,
    );

class AuthController {
  AuthController(this._ref);

  final Ref _ref;
  final _repo = AppRepository();

  // --- 1. LOGIN TRADICIONAL (Email/Password) ---
  Future<void> login(String email, String password) async {
    final hadGuestData = await _ref.read(syncServiceProvider).hasGuestData();

    await supabase.auth.signInWithPassword(email: email, password: password);
    await _iniciarSincronizacion(hadGuestData: hadGuestData);
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await supabase.auth.resetPasswordForEmail(email);
  }

  Future<void> verifyRecoveryOtp(String email, String otp) async {
    final res = await supabase.auth.verifyOTP(
      type: OtpType.recovery,
      token: otp,
      email: email,
    );

    // Si la sesión es nula, el código no fue válido
    if (res.session == null) {
      throw 'Código inválido o expirado.';
    }
  }

  Future<void> updatePassword(String newPassword) async {
    await supabase.auth.updateUser(UserAttributes(password: newPassword));
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

    final hadGuestData = await _ref.read(syncServiceProvider).hasGuestData();

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

    await _iniciarSincronizacion(hadGuestData: hadGuestData);
  }

  // --- 3. LOGIN CON APPLE ---
  Future<void> loginWithApple() async {
    final hadGuestData = await _ref.read(syncServiceProvider).hasGuestData();

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

    await _iniciarSincronizacion(hadGuestData: hadGuestData);
  }

  Future<void> _iniciarSincronizacion({required bool hadGuestData}) async {
    try {
      final user = supabase.auth.currentUser;
      if (user != null) {
        _ref
            .read(guestMergeResultProvider.notifier)
            .setResult(GuestMergeResult.none);

        await _ref.read(guestSessionProvider.notifier).disableGuestMode();

        if (hadGuestData) {
          final remoteHasData = await _ref
              .read(syncServiceProvider)
              .remoteHasInventory(user.id);

          if (remoteHasData) {
            await _ref
                .read(syncServiceProvider)
                .discardGuestDataAndUseRemote(user.id);
            _ref
                .read(guestMergeResultProvider.notifier)
                .setResult(GuestMergeResult.usedExistingRemote);
          } else {
            await _ref
                .read(syncServiceProvider)
                .migrateGuestDataToUser(user.id);
            _ref
                .read(guestMergeResultProvider.notifier)
                .setResult(GuestMergeResult.migratedGuestToNewAccount);
          }
        }

        _repo.memoryCacheProvider.reset();
        await _ref
            .read(syncServiceProvider)
            .sincronizacionFisicaEspejo(user.id);

        // Vincular la suscripción de RevenueCat con este usuario
        await _ref.read(subscriptionProvider.notifier).loginUser(user.id);
      }

      _repo.startSyncQueue();
      _ref.invalidate(inventoryProvider); // Obliga a la UI a refrescarse
    } catch (e) {
      // La autenticación ya fue exitosa; no bloqueamos el login por un error de sync.
      debugPrint('❌ Error en sincronización post-login: $e');
    }
  }

  // --- CIERRE DE SESIÓN ---
  Future<void> logout() async {
    try {
      _repo.stopSyncQueue();
      _repo.memoryCacheProvider.reset();
      await _ref.read(guestSessionProvider.notifier).disableGuestMode();
      _ref.read(inventoryProvider.notifier).clear();
      _ref.invalidate(inventoryProvider);

      // Desvincular la suscripción de RevenueCat
      await _ref.read(subscriptionProvider.notifier).logoutUser();
    } catch (e) {
      rethrow;
    } finally {
      try {
        await GoogleSignIn.instance.signOut();
      } catch (_) {}

      await supabase.auth.signOut();
    }
  }
}
