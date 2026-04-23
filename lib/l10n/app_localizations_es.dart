// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Album 26';

  @override
  String get authWelcomeTitle => 'Bienvenido a Album 26';

  @override
  String get authEmailLabel => 'Correo electronico';

  @override
  String get authPasswordLabel => 'Contrasena';

  @override
  String get authLoginButton => 'INICIAR SESION';

  @override
  String get authContinueWith => 'O continuar con';

  @override
  String get authContinueGoogle => 'Continuar con Google';

  @override
  String get authContinueApple => 'Continuar con Apple';

  @override
  String get authContinueGuest => 'Continuar como invitado';

  @override
  String get authNoAccountRegister => 'No tienes cuenta? Registrate';

  @override
  String get authGuestMigratedSuccess =>
      'Tu progreso invitado se copio a tu nueva cuenta.';

  @override
  String get authGuestRemotePreserved =>
      'La cuenta ya existia: se conservaron los datos de la nube y se descarto el progreso invitado local.';

  @override
  String commonErrorWithMessage(Object message) {
    return 'Error: $message';
  }

  @override
  String get registerTitle => 'Crear Cuenta';

  @override
  String get registerFillAllFields => 'Por favor, llena todos los campos.';

  @override
  String get registerEmailsDontMatch =>
      'Los correos electronicos no coinciden.';

  @override
  String get registerPasswordsDontMatch => 'Las contrasenas no coinciden.';

  @override
  String get registerPasswordMinLength =>
      'La contrasena debe tener al menos 6 caracteres.';

  @override
  String get registerAccountCreated =>
      'Cuenta creada con exito. Ahora inicia sesion.';

  @override
  String get registerConfirmEmailLabel => 'Confirmar correo electronico';

  @override
  String get registerConfirmPasswordLabel => 'Confirmar contrasena';

  @override
  String get registerSubmitButton => 'REGISTRARME';

  @override
  String get profileTitle => 'Mi Perfil';

  @override
  String get profileOfficialCollector => 'Coleccionista Oficial';

  @override
  String get profileLogoutButton => 'Cerrar Sesion';

  @override
  String get profileUnknownUser => 'Usuario desconocido';

  @override
  String profileLogoutError(Object message) {
    return 'Error al cerrar sesion: $message';
  }

  @override
  String get homeTitle => 'Mi Album 26';

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
  String get homeViewFullCollection => 'Ver Coleccion Completa';

  @override
  String get homeTeamsTitle => 'Equipos';

  @override
  String get homeSearchTeamsHint => 'Buscar pais o equipo...';

  @override
  String get homeNoResults => 'Sin resultados';

  @override
  String get homeScanButton => 'Escanear';

  @override
  String homeObtainedCount(Object collected, Object total) {
    return '$collected de $total obtenidos';
  }

  @override
  String get homeProgressError => 'Error';

  @override
  String get globalCollectionTitle => 'Coleccion Completa';

  @override
  String get filterAll => 'Todos';

  @override
  String get filterMissing => 'Faltantes';

  @override
  String get filterDuplicates => 'Repetidas';

  @override
  String get filterSearchHint => 'Buscar pais, codigo o numero...';

  @override
  String get stickerRemoveTitle => 'Quitar cromo?';

  @override
  String stickerRemoveConfirm(Object stickerLabel) {
    return 'Seguro que quieres quitar el cromo $stickerLabel?';
  }

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonRemove => 'Quitar';

  @override
  String get commonDone => 'LISTO';

  @override
  String get gridNoResults => 'Sin resultados.';

  @override
  String scannerViewScannedButton(Object count) {
    return 'Ver $count cromos escaneados';
  }

  @override
  String get scannerOverlayHint => 'Centra la parte trasera del cromo aqui';

  @override
  String get pendingScansTitle => 'Cromos Escaneados';

  @override
  String get pendingScansEmpty => 'Aun no has escaneado nada';

  @override
  String pendingScansItemLabel(Object code) {
    return 'Cromo: $code';
  }

  @override
  String pendingScansSavedSuccess(Object count) {
    return '$count cromos guardados con exito!';
  }

  @override
  String pendingScansSaveError(Object message) {
    return 'Error al guardar: $message';
  }

  @override
  String get shareHeader => '⚽ *INTERCAMBIO ALBUM 26* 🏆';

  @override
  String get shareMissingSectionTitle => '❌ *ME FALTAN:*';

  @override
  String get shareDuplicatesSectionTitle => '🔁 *REPETIDAS:*';

  @override
  String get shareNoneMissing => 'Ninguno! 😎';

  @override
  String get shareNoDuplicates => 'Sin repetidas 😅';

  @override
  String get shareLetsTrade => 'Cambiamos? 👀🔥';

  @override
  String get shareSeparator => '--------------------------';
}
