// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Álbum 26';

  @override
  String get authWelcomeTitle => 'Bienvenido a Álbum 26';

  @override
  String get authEmailLabel => 'Correo electrónico';

  @override
  String get authPasswordLabel => 'Contraseña';

  @override
  String get authLoginButton => 'INICIAR SESIÓN';

  @override
  String get authContinueWith => 'O continúa con';

  @override
  String get authContinueGoogle => 'Continuar con Google';

  @override
  String get authContinueApple => 'Continuar con Apple';

  @override
  String get authContinueGuest => 'Continuar como invitado';

  @override
  String get authNoAccountRegister => '¿No tienes cuenta? Regístrate';

  @override
  String get authForgotPassword => '¿Olvidaste tu contraseña?';

  @override
  String get authResetPasswordEnterEmail =>
      'Ingresa tu correo para recuperar la contraseña.';

  @override
  String get authResetPasswordEmailSent =>
      'Te enviamos un correo para restablecer tu contraseña.';

  @override
  String get authGuestMigratedSuccess =>
      '¡Tu progreso como invitado se transfirió a tu nueva cuenta con éxito! 🏆';

  @override
  String get authGuestRemotePreserved =>
      '¡Bienvenido de vuelta! Se ha restaurado tu colección de la nube y el progreso local ha sido descartado.';

  @override
  String commonErrorWithMessage(Object message) {
    return 'Error: $message';
  }

  @override
  String get registerTitle => 'Crear Cuenta';

  @override
  String get registerFillAllFields => 'Por favor, completa todos los campos.';

  @override
  String get registerEmailsDontMatch =>
      'Los correos electrónicos no coinciden.';

  @override
  String get registerPasswordsDontMatch => 'Las contraseñas no coinciden.';

  @override
  String get registerPasswordMinLength =>
      'La contraseña debe tener al menos 6 caracteres.';

  @override
  String get registerAccountCreated =>
      '¡Cuenta creada con éxito! ⚽ Ahora inicia sesión.';

  @override
  String get registerConfirmEmailLabel => 'Confirmar correo electrónico';

  @override
  String get registerConfirmPasswordLabel => 'Confirmar contraseña';

  @override
  String get registerSubmitButton => 'REGISTRARME';

  @override
  String get profileTitle => 'Mi Perfil';

  @override
  String get profileOfficialCollector => 'Coleccionista Oficial 🌟';

  @override
  String get profileChangePasswordButton => 'Actualizar contraseña';

  @override
  String get profileChangePasswordTitle => 'Actualizar contraseña';

  @override
  String get profileNewPasswordLabel => 'Nueva contraseña';

  @override
  String get profileConfirmNewPasswordLabel => 'Confirmar nueva contraseña';

  @override
  String get profilePasswordUpdatedSuccess =>
      'Contraseña actualizada correctamente.';

  @override
  String get profileLogoutButton => 'Cerrar Sesión';

  @override
  String get profileUnknownUser => 'Usuario desconocido';

  @override
  String profileLogoutError(Object message) {
    return 'Error al cerrar sesión: $message';
  }

  @override
  String get homeTitle => 'Mi Álbum 26';

  @override
  String get homeProfileTooltip => 'Mi Perfil';

  @override
  String get homeShareAll => 'Compartir Todo';

  @override
  String get homeShareMissingOnly => 'Solo Faltantes';

  @override
  String get homeShareDuplicatesOnly => 'Solo Repetidas';

  @override
  String get homeGlobalProgressTitle => 'Progreso Global';

  @override
  String homeCollectedCount(Object collected, Object total) {
    return '$collected de $total coleccionadas';
  }

  @override
  String get homeViewFullCollection => 'Ver Colección Completa';

  @override
  String get homeTeamsTitle => 'Equipos';

  @override
  String get homeSearchTeamsHint => 'Buscar país o equipo...';

  @override
  String get homeNoResults => 'Sin resultados';

  @override
  String get homeScanButton => 'Escanear Cromo';

  @override
  String homeObtainedCount(Object collected, Object total) {
    return '$collected de $total obtenidos';
  }

  @override
  String get homeProgressError => 'Error';

  @override
  String get globalCollectionTitle => 'Colección Completa';

  @override
  String get filterAll => 'Todos';

  @override
  String get filterMissing => 'Faltantes';

  @override
  String get filterDuplicates => 'Repetidas';

  @override
  String get filterSearchHint => 'Buscar país, código o número...';

  @override
  String get stickerRemoveTitle => '¿Quitar cromo?';

  @override
  String stickerRemoveConfirm(Object stickerLabel) {
    return '¿Seguro que quieres quitar el cromo $stickerLabel de tu álbum?';
  }

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonRemove => 'Quitar';

  @override
  String get commonDone => 'LISTO';

  @override
  String get gridNoResults => 'No se encontraron cromos.';

  @override
  String scannerViewScannedButton(Object count) {
    return 'Revisar $count cromos escaneados';
  }

  @override
  String get scannerOverlayHint => 'Centra la parte trasera del cromo aquí';

  @override
  String get pendingScansTitle => 'Cromos Escaneados';

  @override
  String get pendingScansEmpty => 'Aún no has escaneado ningún cromo';

  @override
  String pendingScansItemLabel(Object code) {
    return 'Cromo: $code';
  }

  @override
  String pendingScansSavedSuccess(Object count) {
    return '¡$count cromos añadidos a tu álbum con éxito! 🏆';
  }

  @override
  String pendingScansSaveError(Object message) {
    return 'Error al guardar: $message';
  }

  @override
  String get shareHeader => '⚽ *INTERCAMBIO ÁLBUM 26* 🏆';

  @override
  String get shareMissingSectionTitle => '❌ *ME FALTAN:*';

  @override
  String get shareDuplicatesSectionTitle => '🔁 *REPETIDAS:*';

  @override
  String get shareNoneMissing => '¡Ninguno! 😎';

  @override
  String get shareNoDuplicates => 'Sin repetidas 😅';

  @override
  String get shareLetsTrade => '¿Cambiamos? 👀🔥';

  @override
  String get shareSeparator => '--------------------------';

  @override
  String get forgotPasswordTitle => 'Recuperar Cuenta';

  @override
  String get forgotPasswordDescription =>
      'Ingresa tu correo electrónico y te enviaremos un código de 6 dígitos para restablecer tu contraseña.';

  @override
  String get forgotPasswordEmailLabel => 'Correo Electrónico';

  @override
  String get forgotPasswordEmptyEmailError =>
      'Por favor, ingresa tu correo electrónico.';

  @override
  String get forgotPasswordCodeSentSuccess =>
      'Código enviado. Revisa tu bandeja de entrada.';

  @override
  String get forgotPasswordSendCodeButton => 'ENVIAR CÓDIGO';

  @override
  String forgotPasswordStep2Description(Object email) {
    return 'Escribe el código que enviamos a $email y tu nueva contraseña.';
  }

  @override
  String get forgotPasswordCodeInputLabel => 'Código de 8 dígitos';

  @override
  String get forgotPasswordInvalidCodeError =>
      'El código debe tener exactamente 6 dígitos.';

  @override
  String get forgotPasswordNewPasswordLabel => 'Nueva Contraseña';

  @override
  String get forgotPasswordShortPasswordError =>
      'La contraseña debe tener al menos 6 caracteres.';

  @override
  String get forgotPasswordSavePasswordButton => 'GUARDAR CONTRASEÑA';

  @override
  String get forgotPasswordPasswordUpdatedSuccess =>
      '¡Contraseña actualizada con éxito! 🏆';

  @override
  String get paywallTitle => 'Disfruta sin publicidad';

  @override
  String get paywallSubtitle =>
      'Todas las funciones están disponibles gratis. Con Pro disfrutas de todo sin interrupciones.';

  @override
  String get paywallBenefitScanner => 'Escáner sin anuncios intermedios';

  @override
  String get paywallBenefitNoAds => 'Sin publicidad';

  @override
  String get paywallBenefitSync => 'Sincronización en la nube incluida';

  @override
  String paywallSubscribeButton(Object price) {
    return 'Suscribirse por $price/mes';
  }

  @override
  String get paywallRestorePurchases => 'Restaurar compras';

  @override
  String get paywallCancelAnytime => 'Cancela cuando quieras. Sin compromisos.';

  @override
  String get paywallLoadError =>
      'No se pudieron cargar los planes. Verifica tu conexión.';

  @override
  String get paywallRetry => 'Reintentar';

  @override
  String get paywallPurchaseError =>
      'Error al procesar la compra. Inténtalo de nuevo.';

  @override
  String get paywallRestoreError =>
      'No se pudieron restaurar las compras. Inténtalo de nuevo.';

  @override
  String get paywallGuestTitle => 'Inicia sesión para suscribirte';

  @override
  String get paywallGuestBody =>
      'Pro está vinculado a tu cuenta. Inicia sesión o crea una cuenta para desbloquear todas las funciones.';

  @override
  String get paywallGuestSignInButton => 'INICIAR SESIÓN';

  @override
  String scannerDemoRemaining(Object count) {
    return '$count escaneos gratis restantes';
  }

  @override
  String get scannerDemoFinishedTitle => 'Has usado tus 5 escaneos gratis';

  @override
  String get scannerDemoFinishedSubtitle =>
      'Suscríbete para escanear cromos ilimitados y disfrutar sin publicidad.';

  @override
  String get scannerDemoUnlockButton => 'Ver planes Pro';

  @override
  String get adDialogTitle => 'Contenido gratuito';

  @override
  String get adDialogBody =>
      'Para continuar, ve un breve anuncio o suscríbete a Pro y olvídate de la publicidad para siempre.';

  @override
  String get adDialogWatchAd => 'Ver anuncio';

  @override
  String get adDialogGetPro => 'Obtener Pro';

  @override
  String get adDialogNotNow => 'Ahora no';
}
