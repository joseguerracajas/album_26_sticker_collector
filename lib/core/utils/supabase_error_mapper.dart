import 'package:album_26_sticker_collector/l10n/app_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Convierte una excepción de Supabase (o cualquier otra) en un mensaje
/// legible y localizado para mostrar en la UI.
String mapSupabaseError(Object e, AppLocalizations l10n) {
  if (e is AuthException) {
    return _mapAuthException(e, l10n);
  }

  // Errores de red/socket que no son AuthException
  final msg = e.toString().toLowerCase();
  if (msg.contains('socketexception') ||
      msg.contains('network') ||
      msg.contains('connection refused') ||
      msg.contains('failed host lookup')) {
    return l10n.authErrorNetworkError;
  }

  return l10n.authErrorUnknown;
}

String _mapAuthException(AuthException e, AppLocalizations l10n) {
  // Primero intentamos por errorCode (más estable que el mensaje de texto)
  final code = e.code?.toLowerCase() ?? '';
  final msg = e.message.toLowerCase();

  if (code == 'invalid_credentials' ||
      msg.contains('invalid login credentials') ||
      msg.contains('invalid_credentials')) {
    return l10n.authErrorInvalidCredentials;
  }

  if (code == 'email_not_confirmed' || msg.contains('email not confirmed')) {
    return l10n.authErrorEmailNotConfirmed;
  }

  if (code == 'user_already_exists' ||
      msg.contains('user already registered') ||
      msg.contains('already been registered')) {
    return l10n.authErrorUserAlreadyRegistered;
  }

  if (code == 'weak_password' ||
      msg.contains('password should be at least') ||
      msg.contains('weak password')) {
    return l10n.authErrorWeakPassword;
  }

  if (code == 'invalid_email' ||
      msg.contains('unable to validate email') ||
      msg.contains('invalid format')) {
    return l10n.authErrorInvalidEmail;
  }

  if (code == 'otp_expired' ||
      code == 'token_expired' ||
      msg.contains('token has expired') ||
      msg.contains('invalid otp') ||
      msg.contains('otp expired')) {
    return l10n.authErrorTokenExpired;
  }

  if (code == 'over_email_send_rate_limit' ||
      code == 'over_request_rate_limit' ||
      msg.contains('rate limit') ||
      msg.contains('too many requests')) {
    return l10n.authErrorRateLimit;
  }

  if (code == 'session_not_found' ||
      msg.contains('session') && msg.contains('expired')) {
    return l10n.authErrorSessionExpired;
  }

  if (msg.contains('network') ||
      msg.contains('connection') ||
      msg.contains('socket')) {
    return l10n.authErrorNetworkError;
  }

  return l10n.authErrorUnknown;
}
