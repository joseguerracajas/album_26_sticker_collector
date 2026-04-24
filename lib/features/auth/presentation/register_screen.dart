import 'package:flutter/material.dart';
import 'package:album_26_sticker_collector/core/utils/connectivity_checker.dart';
import 'package:album_26_sticker_collector/core/utils/supabase_error_mapper.dart';
import 'package:album_26_sticker_collector/features/auth/presentation/auth_screen.dart';
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';
import 'package:album_26_sticker_collector/main.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _confirmEmailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isLoading = false;

  Future<void> _register() async {
    final l10n = AppLocalizations.of(context);
    final email = _emailController.text.trim();
    final confirmEmail = _confirmEmailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    // 1. Validaciones locales
    if (email.isEmpty || password.isEmpty) {
      _showError(l10n.registerFillAllFields);
      return;
    }
    if (email != confirmEmail) {
      _showError(l10n.registerEmailsDontMatch);
      return;
    }
    if (password != confirmPassword) {
      _showError(l10n.registerPasswordsDontMatch);
      return;
    }
    if (password.length < 6) {
      _showError(l10n.registerPasswordMinLength);
      return;
    }

    // 2. Enviar a Supabase
    setState(() => _isLoading = true);

    if (!await hasInternetConnection()) {
      if (mounted) {
        _showError(l10n.authErrorNetworkError);
        setState(() => _isLoading = false);
      }
      return;
    }

    try {
      await supabase.auth.signUp(email: email, password: password);

      // En algunos proyectos Supabase puede abrir sesión automáticamente.
      // Forzamos logout para que el usuario vuelva al login manualmente.
      await supabase.auth.signOut();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.registerAccountCreated),
            backgroundColor: Colors.green,
          ),
        );

        await Future<void>.delayed(const Duration(milliseconds: 1200));

        if (!mounted) return;
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (route) => false,
        );
      }
    } catch (e) {
      _showError(mapSupabaseError(e, l10n));
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.registerTitle)),
      body: SingleChildScrollView(
        // Para que el teclado no tape los campos
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.person_add_alt_1, size: 60, color: Colors.amber),
            const SizedBox(height: 30),

            // Campo: Correo
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: l10n.authEmailLabel,
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),

            // Campo: Confirmar Correo
            TextField(
              controller: _confirmEmailController,
              decoration: InputDecoration(
                labelText: l10n.registerConfirmEmailLabel,
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 24),

            // Campo: Contraseña
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: l10n.authPasswordLabel,
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),

            // Campo: Confirmar Contraseña
            TextField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                labelText: l10n.registerConfirmPasswordLabel,
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 30),

            // Botón de Registro
            if (_isLoading)
              const Center(
                child: CircularProgressIndicator(color: Colors.amber),
              )
            else
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: _register,
                child: Text(
                  l10n.registerSubmitButton,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
