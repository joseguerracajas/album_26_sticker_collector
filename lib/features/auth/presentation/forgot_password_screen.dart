import 'package:album_26_sticker_collector/features/auth/data/auth_provider.dart';
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  final _otpController = TextEditingController();
  final _newPasswordController = TextEditingController();

  bool _isLoading = false;
  bool _codeSent = false;

  AppLocalizations get l10n => AppLocalizations.of(context)!;

  Future<void> _enviarCodigo() async {
    final email = _emailController.text.trim();
    if (email.isEmpty) {
      _showError(l10n.forgotPasswordEmptyEmailError);
      return;
    }

    setState(() => _isLoading = true);
    HapticFeedback.mediumImpact();

    try {
      // 1. Llamamos a tu Provider
      await ref.read(authControllerProvider).sendPasswordResetEmail(email);

      setState(() => _codeSent = true);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.forgotPasswordCodeSentSuccess),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      _showError(e.toString());
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _cambiarContrasena() async {
    final email = _emailController.text.trim();
    final otp = _otpController.text.trim();
    final newPassword = _newPasswordController.text.trim();

    if (otp.length != 8) {
      _showError(l10n.forgotPasswordInvalidCodeError);
      return;
    }
    if (newPassword.length < 8) {
      _showError(l10n.forgotPasswordShortPasswordError);
      return;
    }

    setState(() => _isLoading = true);
    HapticFeedback.heavyImpact();

    try {
      // 1. Verificamos el código usando el Provider
      await ref.read(authControllerProvider).verifyRecoveryOtp(email, otp);

      // 2. Si pasó, actualizamos la clave usando el Provider
      await ref.read(authControllerProvider).updatePassword(newPassword);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.forgotPasswordPasswordUpdatedSuccess),
            backgroundColor: Colors.amber,
          ),
        );
        // Volvemos a la pantalla de Login
        Navigator.pop(context);
      }
    } catch (e) {
      _showError(e.toString());
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
  void dispose() {
    _emailController.dispose();
    _otpController.dispose();
    _newPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(l10n.forgotPasswordTitle)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.lock_reset, size: 60, color: Colors.amber),
            const SizedBox(height: 30),

            AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              child: !_codeSent ? _buildPaso1() : _buildPaso2(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaso1() {
    return Column(
      key: const ValueKey('paso1'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          l10n.forgotPasswordDescription,
          style: TextStyle(color: Colors.grey.shade400, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        TextField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: l10n.forgotPasswordEmailLabel,
            border: const OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 32),
        if (_isLoading)
          const Center(child: CircularProgressIndicator(color: Colors.amber))
        else
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed: _enviarCodigo,
            child: Text(
              l10n.forgotPasswordSendCodeButton,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
      ],
    );
  }

  Widget _buildPaso2() {
    return Column(
      key: const ValueKey('paso2'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          l10n.forgotPasswordStep2Description(_emailController.text),
          style: TextStyle(color: Colors.grey.shade400, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        TextField(
          controller: _otpController,
          style: const TextStyle(fontSize: 24, letterSpacing: 8),
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          maxLength: 8,
          decoration: InputDecoration(
            labelText: l10n.forgotPasswordCodeInputLabel,
            labelStyle: const TextStyle(letterSpacing: 0, fontSize: 16),
            border: const OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _newPasswordController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: l10n.forgotPasswordNewPasswordLabel,
            border: const OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 32),
        if (_isLoading)
          const Center(child: CircularProgressIndicator(color: Colors.amber))
        else
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed: _cambiarContrasena,
            child: Text(
              l10n.forgotPasswordSavePasswordButton,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
      ],
    );
  }
}
