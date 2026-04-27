// Archivo: lib/features/auth/presentation/login_screen.dart

import 'dart:io';
import 'package:album_26_sticker_collector/core/utils/connectivity_checker.dart';
import 'package:album_26_sticker_collector/core/utils/supabase_error_mapper.dart';
import 'package:album_26_sticker_collector/features/auth/data/auth_provider.dart';
import 'package:album_26_sticker_collector/features/auth/data/guest_session_provider.dart';
import 'package:album_26_sticker_collector/features/auth/presentation/forgot_password_screen.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/home_screen.dart';
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'register_screen.dart'; // Importamos la nueva pantalla

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _goToForgotPasswordScreen() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),
    );
  }

  // --- LOGIN TRADICIONAL ---
  Future<void> _login() async {
    final l10n = AppLocalizations.of(context);
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.registerFillAllFields),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }
    if (!RegExp(r'^[\w._%+\-]+@[\w.\-]+\.[a-zA-Z]{2,}$').hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.validationEmailInvalid),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    _ejecutarLogin(
      () => ref.read(authControllerProvider).login(email, password),
    );
  }

  // --- LOGIN GOOGLE ---
  Future<void> _loginGoogle() async {
    _ejecutarLogin(() => ref.read(authControllerProvider).loginWithGoogle());
  }

  // --- LOGIN APPLE ---
  Future<void> _loginApple() async {
    _ejecutarLogin(() => ref.read(authControllerProvider).loginWithApple());
  }

  // --- ENVOLTORIO PARA MANEJO DE ESTADOS Y ERRORES ---
  Future<void> _ejecutarLogin(Future<void> Function() loginMethod) async {
    setState(() => _isLoading = true);
    final l10n = AppLocalizations.of(context);

    if (!await hasInternetConnection()) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.authErrorNetworkError),
            backgroundColor: Colors.red,
          ),
        );
      }
      if (mounted) setState(() => _isLoading = false);
      return;
    }

    try {
      await loginMethod();

      if (mounted) {
        final mergeResult = ref.read(guestMergeResultProvider);
        if (mergeResult == GuestMergeResult.migratedGuestToNewAccount) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.authGuestMigratedSuccess),
              backgroundColor: Colors.green,
            ),
          );
        } else if (mergeResult == GuestMergeResult.usedExistingRemote) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.authGuestRemotePreserved),
              backgroundColor: Colors.orange,
            ),
          );
        }
      }

      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    } catch (e) {
      if (mounted) {
        // Ignoramos el error si el usuario simplemente canceló el popup
        if (!e.toString().contains('cancelado')) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(mapSupabaseError(e, l10n)),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _continuarComoInvitado() async {
    setState(() => _isLoading = true);
    final l10n = AppLocalizations.of(context);

    if (!await hasInternetConnection()) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.authErrorNetworkError),
            backgroundColor: Colors.red,
          ),
        );
      }
      if (mounted) setState(() => _isLoading = false);
      return;
    }

    try {
      await ref.read(guestSessionProvider.notifier).enableGuestMode();

      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(mapSupabaseError(e, l10n)),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: Text(
          l10n.authWelcomeTitle,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32.0,
              vertical: 24.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/icon/icon_transparent.png',
                  height: 120,
                  fit: BoxFit.contain,
                ),
                // const SizedBox(height: 40),

                // --- CAMPOS DE TEXTO ---
                TextField(
                  controller: _emailController,
                  style: const TextStyle(color: Colors.white),
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r'\s')),
                  ],
                  decoration: InputDecoration(
                    labelText: l10n.authEmailLabel,
                    labelStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(Icons.email, color: Colors.amber),
                    filled: true,
                    fillColor: const Color(0xFF1E1E1E),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  style: const TextStyle(color: Colors.white),
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r'\s')),
                  ],
                  decoration: InputDecoration(
                    labelText: l10n.authPasswordLabel,
                    labelStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(Icons.lock, color: Colors.amber),
                    filled: true,
                    fillColor: const Color(0xFF1E1E1E),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 24),

                // --- BOTONES DE LOGIN ---
                if (_isLoading)
                  const Center(
                    child: CircularProgressIndicator(color: Colors.amber),
                  )
                else ...[
                  // Botón Correo
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: _login,
                    child: Text(
                      l10n.authLoginButton,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Separador
                  Row(
                    children: [
                      const Expanded(child: Divider(color: Colors.grey)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          l10n.authContinueWith,
                          style: TextStyle(color: Colors.grey.shade400),
                        ),
                      ),
                      const Expanded(child: Divider(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Botón Google
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black87,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: _loginGoogle,
                    // Usamos un ícono genérico si no tienes un asset de Google
                    icon: const Icon(
                      Icons.g_mobiledata,
                      size: 30,
                      color: Colors.red,
                    ),
                    label: Text(
                      l10n.authContinueGoogle,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Botón Apple (Se recomienda mostrarlo primordialmente en iOS)
                  if (Platform.isIOS || Platform.isMacOS)
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(color: Colors.grey),
                        ),
                      ),
                      onPressed: _loginApple,
                      icon: const Icon(Icons.apple, size: 28),
                      label: Text(
                        l10n.authContinueApple,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),

                  const SizedBox(height: 24),
                  OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.amber),
                      foregroundColor: Colors.amber,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: _continuarComoInvitado,
                    icon: const Icon(Icons.person_outline),
                    label: Text(
                      l10n.authContinueGuest,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: _goToForgotPasswordScreen,
                    child: Text(
                      l10n.authForgotPassword,
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    },
                    child: Text(
                      l10n.authNoAccountRegister,
                      style: TextStyle(color: Colors.amber),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
