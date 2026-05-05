import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fa.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_he.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fa'),
    Locale('fr'),
    Locale('he'),
    Locale('hi'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('nl'),
    Locale('pl'),
    Locale('pt'),
    Locale('ru'),
    Locale('tr'),
    Locale('zh'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In es, this message translates to:
  /// **'Álbum 26'**
  String get appTitle;

  /// No description provided for @authWelcomeTitle.
  ///
  /// In es, this message translates to:
  /// **'Bienvenido a Álbum 26'**
  String get authWelcomeTitle;

  /// No description provided for @authEmailLabel.
  ///
  /// In es, this message translates to:
  /// **'Correo electrónico'**
  String get authEmailLabel;

  /// No description provided for @authPasswordLabel.
  ///
  /// In es, this message translates to:
  /// **'Contraseña'**
  String get authPasswordLabel;

  /// No description provided for @authLoginButton.
  ///
  /// In es, this message translates to:
  /// **'INICIAR SESIÓN'**
  String get authLoginButton;

  /// No description provided for @authContinueWith.
  ///
  /// In es, this message translates to:
  /// **'O continúa con'**
  String get authContinueWith;

  /// No description provided for @authContinueGoogle.
  ///
  /// In es, this message translates to:
  /// **'Continuar con Google'**
  String get authContinueGoogle;

  /// No description provided for @authContinueApple.
  ///
  /// In es, this message translates to:
  /// **'Continuar con Apple'**
  String get authContinueApple;

  /// No description provided for @authContinueGuest.
  ///
  /// In es, this message translates to:
  /// **'Continuar como invitado'**
  String get authContinueGuest;

  /// No description provided for @authNoAccountRegister.
  ///
  /// In es, this message translates to:
  /// **'¿No tienes cuenta? Regístrate'**
  String get authNoAccountRegister;

  /// No description provided for @authForgotPassword.
  ///
  /// In es, this message translates to:
  /// **'¿Olvidaste tu contraseña?'**
  String get authForgotPassword;

  /// No description provided for @authResetPasswordEnterEmail.
  ///
  /// In es, this message translates to:
  /// **'Ingresa tu correo para recuperar la contraseña.'**
  String get authResetPasswordEnterEmail;

  /// No description provided for @authResetPasswordEmailSent.
  ///
  /// In es, this message translates to:
  /// **'Te enviamos un correo para restablecer tu contraseña.'**
  String get authResetPasswordEmailSent;

  /// No description provided for @authGuestMigratedSuccess.
  ///
  /// In es, this message translates to:
  /// **'¡Tu progreso como invitado se transfirió a tu nueva cuenta con éxito! 🏆'**
  String get authGuestMigratedSuccess;

  /// No description provided for @authGuestRemotePreserved.
  ///
  /// In es, this message translates to:
  /// **'¡Bienvenido de vuelta! Se ha restaurado tu colección de la nube y el progreso local ha sido descartado.'**
  String get authGuestRemotePreserved;

  /// No description provided for @commonErrorWithMessage.
  ///
  /// In es, this message translates to:
  /// **'Error: {message}'**
  String commonErrorWithMessage(Object message);

  /// No description provided for @authErrorInvalidCredentials.
  ///
  /// In es, this message translates to:
  /// **'Correo o contraseña incorrectos. Verifica tus datos e intenta de nuevo.'**
  String get authErrorInvalidCredentials;

  /// No description provided for @authErrorEmailNotConfirmed.
  ///
  /// In es, this message translates to:
  /// **'Tu correo aún no ha sido confirmado. Revisa tu bandeja de entrada.'**
  String get authErrorEmailNotConfirmed;

  /// No description provided for @authErrorUserAlreadyRegistered.
  ///
  /// In es, this message translates to:
  /// **'Ya existe una cuenta con ese correo electrónico.'**
  String get authErrorUserAlreadyRegistered;

  /// No description provided for @authErrorWeakPassword.
  ///
  /// In es, this message translates to:
  /// **'La contraseña es demasiado débil. Usa al menos 6 caracteres.'**
  String get authErrorWeakPassword;

  /// No description provided for @authErrorInvalidEmail.
  ///
  /// In es, this message translates to:
  /// **'El formato del correo electrónico no es válido.'**
  String get authErrorInvalidEmail;

  /// No description provided for @authErrorTokenExpired.
  ///
  /// In es, this message translates to:
  /// **'El código ha expirado o no es válido. Solicita uno nuevo.'**
  String get authErrorTokenExpired;

  /// No description provided for @authErrorRateLimit.
  ///
  /// In es, this message translates to:
  /// **'Demasiados intentos. Espera un momento antes de volver a intentarlo.'**
  String get authErrorRateLimit;

  /// No description provided for @authErrorNetworkError.
  ///
  /// In es, this message translates to:
  /// **'Sin conexión. Verifica tu red e intenta de nuevo.'**
  String get authErrorNetworkError;

  /// No description provided for @authErrorSessionExpired.
  ///
  /// In es, this message translates to:
  /// **'Tu sesión ha expirado. Inicia sesión nuevamente.'**
  String get authErrorSessionExpired;

  /// No description provided for @authErrorUnknown.
  ///
  /// In es, this message translates to:
  /// **'Ocurrió un error inesperado. Intenta de nuevo.'**
  String get authErrorUnknown;

  /// No description provided for @registerTitle.
  ///
  /// In es, this message translates to:
  /// **'Crear Cuenta'**
  String get registerTitle;

  /// No description provided for @registerFillAllFields.
  ///
  /// In es, this message translates to:
  /// **'Por favor, completa todos los campos.'**
  String get registerFillAllFields;

  /// No description provided for @registerEmailsDontMatch.
  ///
  /// In es, this message translates to:
  /// **'Los correos electrónicos no coinciden.'**
  String get registerEmailsDontMatch;

  /// No description provided for @registerPasswordsDontMatch.
  ///
  /// In es, this message translates to:
  /// **'Las contraseñas no coinciden.'**
  String get registerPasswordsDontMatch;

  /// No description provided for @registerPasswordMinLength.
  ///
  /// In es, this message translates to:
  /// **'La contraseña debe tener al menos 6 caracteres.'**
  String get registerPasswordMinLength;

  /// No description provided for @registerAccountCreated.
  ///
  /// In es, this message translates to:
  /// **'¡Cuenta creada con éxito! ⚽ Ahora inicia sesión.'**
  String get registerAccountCreated;

  /// No description provided for @registerConfirmEmailLabel.
  ///
  /// In es, this message translates to:
  /// **'Confirmar correo electrónico'**
  String get registerConfirmEmailLabel;

  /// No description provided for @registerConfirmPasswordLabel.
  ///
  /// In es, this message translates to:
  /// **'Confirmar contraseña'**
  String get registerConfirmPasswordLabel;

  /// No description provided for @registerSubmitButton.
  ///
  /// In es, this message translates to:
  /// **'REGISTRARME'**
  String get registerSubmitButton;

  /// No description provided for @profileTitle.
  ///
  /// In es, this message translates to:
  /// **'Mi Perfil'**
  String get profileTitle;

  /// No description provided for @profileOfficialCollector.
  ///
  /// In es, this message translates to:
  /// **'Coleccionista Oficial 🌟'**
  String get profileOfficialCollector;

  /// No description provided for @profileChangePasswordButton.
  ///
  /// In es, this message translates to:
  /// **'Actualizar contraseña'**
  String get profileChangePasswordButton;

  /// No description provided for @profileChangePasswordTitle.
  ///
  /// In es, this message translates to:
  /// **'Actualizar contraseña'**
  String get profileChangePasswordTitle;

  /// No description provided for @profileNewPasswordLabel.
  ///
  /// In es, this message translates to:
  /// **'Nueva contraseña'**
  String get profileNewPasswordLabel;

  /// No description provided for @profileConfirmNewPasswordLabel.
  ///
  /// In es, this message translates to:
  /// **'Confirmar nueva contraseña'**
  String get profileConfirmNewPasswordLabel;

  /// No description provided for @profilePasswordUpdatedSuccess.
  ///
  /// In es, this message translates to:
  /// **'Contraseña actualizada correctamente.'**
  String get profilePasswordUpdatedSuccess;

  /// No description provided for @profileLogoutButton.
  ///
  /// In es, this message translates to:
  /// **'Cerrar Sesión'**
  String get profileLogoutButton;

  /// No description provided for @profileLogoutSuccess.
  ///
  /// In es, this message translates to:
  /// **'Sesión cerrada correctamente.'**
  String get profileLogoutSuccess;

  /// No description provided for @profileUnknownUser.
  ///
  /// In es, this message translates to:
  /// **'Usuario desconocido'**
  String get profileUnknownUser;

  /// No description provided for @profileLogoutError.
  ///
  /// In es, this message translates to:
  /// **'Error al cerrar sesión: {message}'**
  String profileLogoutError(Object message);

  /// No description provided for @homeTitle.
  ///
  /// In es, this message translates to:
  /// **'Mi Álbum 26'**
  String get homeTitle;

  /// No description provided for @homeProfileTooltip.
  ///
  /// In es, this message translates to:
  /// **'Mi Perfil'**
  String get homeProfileTooltip;

  /// No description provided for @drawerSignIn.
  ///
  /// In es, this message translates to:
  /// **'Iniciar Sesión'**
  String get drawerSignIn;

  /// No description provided for @homeShareAll.
  ///
  /// In es, this message translates to:
  /// **'Compartir Todo'**
  String get homeShareAll;

  /// No description provided for @homeShareMissingOnly.
  ///
  /// In es, this message translates to:
  /// **'Solo Faltantes'**
  String get homeShareMissingOnly;

  /// No description provided for @homeShareDuplicatesOnly.
  ///
  /// In es, this message translates to:
  /// **'Solo Repetidas'**
  String get homeShareDuplicatesOnly;

  /// No description provided for @homeGlobalProgressTitle.
  ///
  /// In es, this message translates to:
  /// **'Progreso Global'**
  String get homeGlobalProgressTitle;

  /// No description provided for @homeCollectedCount.
  ///
  /// In es, this message translates to:
  /// **'{collected} de {total} coleccionadas'**
  String homeCollectedCount(Object collected, Object total);

  /// No description provided for @homeViewFullCollection.
  ///
  /// In es, this message translates to:
  /// **'Ver Colección Completa'**
  String get homeViewFullCollection;

  /// No description provided for @homeTeamsTitle.
  ///
  /// In es, this message translates to:
  /// **'Equipos'**
  String get homeTeamsTitle;

  /// No description provided for @homeSearchTeamsHint.
  ///
  /// In es, this message translates to:
  /// **'Buscar país o equipo...'**
  String get homeSearchTeamsHint;

  /// No description provided for @homeNoResults.
  ///
  /// In es, this message translates to:
  /// **'Sin resultados'**
  String get homeNoResults;

  /// No description provided for @homeScanButton.
  ///
  /// In es, this message translates to:
  /// **'Escanear Cromo'**
  String get homeScanButton;

  /// No description provided for @homeObtainedCount.
  ///
  /// In es, this message translates to:
  /// **'{collected} de {total} obtenidos'**
  String homeObtainedCount(Object collected, Object total);

  /// No description provided for @homeProgressError.
  ///
  /// In es, this message translates to:
  /// **'Error'**
  String get homeProgressError;

  /// No description provided for @globalCollectionTitle.
  ///
  /// In es, this message translates to:
  /// **'Colección Completa'**
  String get globalCollectionTitle;

  /// No description provided for @filterAll.
  ///
  /// In es, this message translates to:
  /// **'Todos'**
  String get filterAll;

  /// No description provided for @filterMissing.
  ///
  /// In es, this message translates to:
  /// **'Faltantes'**
  String get filterMissing;

  /// No description provided for @filterDuplicates.
  ///
  /// In es, this message translates to:
  /// **'Repetidas'**
  String get filterDuplicates;

  /// No description provided for @filterSearchHint.
  ///
  /// In es, this message translates to:
  /// **'Buscar país, código o número...'**
  String get filterSearchHint;

  /// No description provided for @stickerRemoveTitle.
  ///
  /// In es, this message translates to:
  /// **'¿Quitar cromo?'**
  String get stickerRemoveTitle;

  /// No description provided for @stickerRemoveConfirm.
  ///
  /// In es, this message translates to:
  /// **'¿Seguro que quieres quitar el cromo {stickerLabel} de tu álbum?'**
  String stickerRemoveConfirm(Object stickerLabel);

  /// No description provided for @commonCancel.
  ///
  /// In es, this message translates to:
  /// **'Cancelar'**
  String get commonCancel;

  /// No description provided for @commonRemove.
  ///
  /// In es, this message translates to:
  /// **'Quitar'**
  String get commonRemove;

  /// No description provided for @commonDone.
  ///
  /// In es, this message translates to:
  /// **'LISTO'**
  String get commonDone;

  /// No description provided for @gridNoResults.
  ///
  /// In es, this message translates to:
  /// **'No se encontraron cromos.'**
  String get gridNoResults;

  /// No description provided for @scannerViewScannedButton.
  ///
  /// In es, this message translates to:
  /// **'Revisar {count} cromos escaneados'**
  String scannerViewScannedButton(Object count);

  /// No description provided for @scannerOverlayHint.
  ///
  /// In es, this message translates to:
  /// **'Centra la parte trasera del cromo aquí'**
  String get scannerOverlayHint;

  /// No description provided for @pendingScansTitle.
  ///
  /// In es, this message translates to:
  /// **'Cromos Escaneados'**
  String get pendingScansTitle;

  /// No description provided for @pendingScansEmpty.
  ///
  /// In es, this message translates to:
  /// **'Aún no has escaneado ningún cromo'**
  String get pendingScansEmpty;

  /// No description provided for @pendingScansItemLabel.
  ///
  /// In es, this message translates to:
  /// **'Cromo: {code}'**
  String pendingScansItemLabel(Object code);

  /// No description provided for @pendingScansSavedSuccess.
  ///
  /// In es, this message translates to:
  /// **'¡{count} cromos añadidos a tu álbum con éxito! 🏆'**
  String pendingScansSavedSuccess(Object count);

  /// No description provided for @pendingScansSaveError.
  ///
  /// In es, this message translates to:
  /// **'Error al guardar: {message}'**
  String pendingScansSaveError(Object message);

  /// No description provided for @shareHeader.
  ///
  /// In es, this message translates to:
  /// **'⚽ *INTERCAMBIO ÁLBUM 26* 🏆'**
  String get shareHeader;

  /// No description provided for @shareMissingSectionTitle.
  ///
  /// In es, this message translates to:
  /// **'❌ *ME FALTAN:*'**
  String get shareMissingSectionTitle;

  /// No description provided for @shareDuplicatesSectionTitle.
  ///
  /// In es, this message translates to:
  /// **'🔁 *REPETIDAS:*'**
  String get shareDuplicatesSectionTitle;

  /// No description provided for @shareNoneMissing.
  ///
  /// In es, this message translates to:
  /// **'¡Ninguno! 😎'**
  String get shareNoneMissing;

  /// No description provided for @shareNoDuplicates.
  ///
  /// In es, this message translates to:
  /// **'Sin repetidas 😅'**
  String get shareNoDuplicates;

  /// No description provided for @shareLetsTrade.
  ///
  /// In es, this message translates to:
  /// **'¿Cambiamos? 👀🔥'**
  String get shareLetsTrade;

  /// No description provided for @shareSeparator.
  ///
  /// In es, this message translates to:
  /// **'--------------------------'**
  String get shareSeparator;

  /// No description provided for @forgotPasswordTitle.
  ///
  /// In es, this message translates to:
  /// **'Recuperar Cuenta'**
  String get forgotPasswordTitle;

  /// No description provided for @forgotPasswordDescription.
  ///
  /// In es, this message translates to:
  /// **'Ingresa tu correo electrónico y te enviaremos un código de 6 dígitos para restablecer tu contraseña.'**
  String get forgotPasswordDescription;

  /// No description provided for @forgotPasswordEmailLabel.
  ///
  /// In es, this message translates to:
  /// **'Correo Electrónico'**
  String get forgotPasswordEmailLabel;

  /// No description provided for @forgotPasswordEmptyEmailError.
  ///
  /// In es, this message translates to:
  /// **'Por favor, ingresa tu correo electrónico.'**
  String get forgotPasswordEmptyEmailError;

  /// No description provided for @forgotPasswordCodeSentSuccess.
  ///
  /// In es, this message translates to:
  /// **'Código enviado. Revisa tu bandeja de entrada.'**
  String get forgotPasswordCodeSentSuccess;

  /// No description provided for @forgotPasswordSendCodeButton.
  ///
  /// In es, this message translates to:
  /// **'ENVIAR CÓDIGO'**
  String get forgotPasswordSendCodeButton;

  /// No description provided for @forgotPasswordStep2Description.
  ///
  /// In es, this message translates to:
  /// **'Escribe el código que enviamos a {email} y tu nueva contraseña.'**
  String forgotPasswordStep2Description(Object email);

  /// No description provided for @forgotPasswordCodeInputLabel.
  ///
  /// In es, this message translates to:
  /// **'Código de 8 dígitos'**
  String get forgotPasswordCodeInputLabel;

  /// No description provided for @forgotPasswordInvalidCodeError.
  ///
  /// In es, this message translates to:
  /// **'El código debe tener exactamente 6 dígitos.'**
  String get forgotPasswordInvalidCodeError;

  /// No description provided for @forgotPasswordNewPasswordLabel.
  ///
  /// In es, this message translates to:
  /// **'Nueva Contraseña'**
  String get forgotPasswordNewPasswordLabel;

  /// No description provided for @forgotPasswordShortPasswordError.
  ///
  /// In es, this message translates to:
  /// **'La contraseña debe tener al menos 6 caracteres.'**
  String get forgotPasswordShortPasswordError;

  /// No description provided for @forgotPasswordSavePasswordButton.
  ///
  /// In es, this message translates to:
  /// **'GUARDAR CONTRASEÑA'**
  String get forgotPasswordSavePasswordButton;

  /// No description provided for @forgotPasswordPasswordUpdatedSuccess.
  ///
  /// In es, this message translates to:
  /// **'¡Contraseña actualizada con éxito! 🏆'**
  String get forgotPasswordPasswordUpdatedSuccess;

  /// No description provided for @validationEmailInvalid.
  ///
  /// In es, this message translates to:
  /// **'El correo electrónico no es válido.'**
  String get validationEmailInvalid;

  /// No description provided for @paywallTitle.
  ///
  /// In es, this message translates to:
  /// **'Disfruta sin publicidad'**
  String get paywallTitle;

  /// No description provided for @paywallSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Todas las funciones están disponibles gratis. Con Pro disfrutas de todo sin interrupciones.'**
  String get paywallSubtitle;

  /// No description provided for @paywallBenefitScanner.
  ///
  /// In es, this message translates to:
  /// **'Escáner sin anuncios intermedios'**
  String get paywallBenefitScanner;

  /// No description provided for @paywallBenefitNoAds.
  ///
  /// In es, this message translates to:
  /// **'Sin publicidad'**
  String get paywallBenefitNoAds;

  /// No description provided for @paywallBenefitSync.
  ///
  /// In es, this message translates to:
  /// **'Sincronización en la nube incluida'**
  String get paywallBenefitSync;

  /// No description provided for @paywallSubscribeButton.
  ///
  /// In es, this message translates to:
  /// **'Suscribirse · {price}'**
  String paywallSubscribeButton(Object price);

  /// No description provided for @paywallPackageMonthly.
  ///
  /// In es, this message translates to:
  /// **'Mensual'**
  String get paywallPackageMonthly;

  /// No description provided for @paywallPackageAnnual.
  ///
  /// In es, this message translates to:
  /// **'Anual'**
  String get paywallPackageAnnual;

  /// No description provided for @paywallPackageWeekly.
  ///
  /// In es, this message translates to:
  /// **'Semanal'**
  String get paywallPackageWeekly;

  /// No description provided for @paywallPackageLifetime.
  ///
  /// In es, this message translates to:
  /// **'De por vida'**
  String get paywallPackageLifetime;

  /// No description provided for @paywallPackageTwoMonth.
  ///
  /// In es, this message translates to:
  /// **'Bimestral'**
  String get paywallPackageTwoMonth;

  /// No description provided for @paywallPackageThreeMonth.
  ///
  /// In es, this message translates to:
  /// **'Trimestral'**
  String get paywallPackageThreeMonth;

  /// No description provided for @paywallPackageSixMonth.
  ///
  /// In es, this message translates to:
  /// **'Semestral'**
  String get paywallPackageSixMonth;

  /// No description provided for @paywallRestorePurchases.
  ///
  /// In es, this message translates to:
  /// **'Restaurar compras'**
  String get paywallRestorePurchases;

  /// No description provided for @paywallCancelAnytime.
  ///
  /// In es, this message translates to:
  /// **'Cancela cuando quieras. Sin compromisos.'**
  String get paywallCancelAnytime;

  /// No description provided for @paywallLoadError.
  ///
  /// In es, this message translates to:
  /// **'No se pudieron cargar los planes. Verifica tu conexión.'**
  String get paywallLoadError;

  /// No description provided for @paywallRetry.
  ///
  /// In es, this message translates to:
  /// **'Reintentar'**
  String get paywallRetry;

  /// No description provided for @paywallPurchaseError.
  ///
  /// In es, this message translates to:
  /// **'Error al procesar la compra. Inténtalo de nuevo.'**
  String get paywallPurchaseError;

  /// No description provided for @paywallRestoreError.
  ///
  /// In es, this message translates to:
  /// **'No se pudieron restaurar las compras. Inténtalo de nuevo.'**
  String get paywallRestoreError;

  /// No description provided for @paywallGuestTitle.
  ///
  /// In es, this message translates to:
  /// **'Inicia sesión para suscribirte'**
  String get paywallGuestTitle;

  /// No description provided for @paywallGuestBody.
  ///
  /// In es, this message translates to:
  /// **'Pro está vinculado a tu cuenta. Inicia sesión o crea una cuenta para desbloquear todas las funciones.'**
  String get paywallGuestBody;

  /// No description provided for @paywallGuestSignInButton.
  ///
  /// In es, this message translates to:
  /// **'INICIAR SESIÓN'**
  String get paywallGuestSignInButton;

  /// No description provided for @scannerDemoRemaining.
  ///
  /// In es, this message translates to:
  /// **'{count} escaneos gratis restantes'**
  String scannerDemoRemaining(Object count);

  /// No description provided for @scannerDemoFinishedTitle.
  ///
  /// In es, this message translates to:
  /// **'Has usado tus 5 escaneos gratis'**
  String get scannerDemoFinishedTitle;

  /// No description provided for @scannerDemoFinishedSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Suscríbete para escanear cromos ilimitados y disfrutar sin publicidad.'**
  String get scannerDemoFinishedSubtitle;

  /// No description provided for @scannerDemoUnlockButton.
  ///
  /// In es, this message translates to:
  /// **'Ver planes Pro'**
  String get scannerDemoUnlockButton;

  /// No description provided for @adDialogTitle.
  ///
  /// In es, this message translates to:
  /// **'Contenido gratuito'**
  String get adDialogTitle;

  /// No description provided for @adDialogBody.
  ///
  /// In es, this message translates to:
  /// **'Para continuar, ve un breve anuncio o suscríbete a Pro y olvídate de la publicidad para siempre.'**
  String get adDialogBody;

  /// No description provided for @adDialogWatchAd.
  ///
  /// In es, this message translates to:
  /// **'Ver anuncio'**
  String get adDialogWatchAd;

  /// No description provided for @adDialogGetPro.
  ///
  /// In es, this message translates to:
  /// **'Obtener Pro'**
  String get adDialogGetPro;

  /// No description provided for @adDialogNotNow.
  ///
  /// In es, this message translates to:
  /// **'Ahora no'**
  String get adDialogNotNow;

  /// No description provided for @scannerCameraInitError.
  ///
  /// In es, this message translates to:
  /// **'No se pudo inicializar la cámara. Verifica que la app tenga permiso de acceso a la cámara.'**
  String get scannerCameraInitError;

  /// No description provided for @variantSheetTitle.
  ///
  /// In es, this message translates to:
  /// **'Variante del álbum'**
  String get variantSheetTitle;

  /// No description provided for @variantSheetInventoryNote.
  ///
  /// In es, this message translates to:
  /// **'Tu inventario se conserva al cambiar de variante. Los cromos que ya tienes siguen registrados.'**
  String get variantSheetInventoryNote;

  /// No description provided for @variantSheetLoadError.
  ///
  /// In es, this message translates to:
  /// **'Error cargando variantes: {error}'**
  String variantSheetLoadError(Object error);

  /// No description provided for @variantSheetEmpty.
  ///
  /// In es, this message translates to:
  /// **'No hay variantes disponibles para este álbum.'**
  String get variantSheetEmpty;

  /// No description provided for @variantSheetDefaultLabel.
  ///
  /// In es, this message translates to:
  /// **'Variante por defecto'**
  String get variantSheetDefaultLabel;

  /// No description provided for @variantMandatoryTitle.
  ///
  /// In es, this message translates to:
  /// **'Elige tu región'**
  String get variantMandatoryTitle;

  /// No description provided for @variantMandatorySubtitle.
  ///
  /// In es, this message translates to:
  /// **'Selecciona la versión del álbum de tu zona para ver los cromos correctos.'**
  String get variantMandatorySubtitle;

  /// No description provided for @variantChangedSuccess.
  ///
  /// In es, this message translates to:
  /// **'Variante cambiada a {name} ✅'**
  String variantChangedSuccess(Object name);

  /// No description provided for @profileDeleteAccountButton.
  ///
  /// In es, this message translates to:
  /// **'Eliminar cuenta'**
  String get profileDeleteAccountButton;

  /// No description provided for @profileDeleteAccountTitle.
  ///
  /// In es, this message translates to:
  /// **'¿Eliminar tu cuenta?'**
  String get profileDeleteAccountTitle;

  /// No description provided for @profileDeleteAccountMessage.
  ///
  /// In es, this message translates to:
  /// **'Esta acción es permanente. Se borrarán todos tus datos y no podrás recuperar tu colección.'**
  String get profileDeleteAccountMessage;

  /// No description provided for @profileDeleteAccountConfirmButton.
  ///
  /// In es, this message translates to:
  /// **'Eliminar definitivamente'**
  String get profileDeleteAccountConfirmButton;

  /// No description provided for @profileDeleteAccountSuccess.
  ///
  /// In es, this message translates to:
  /// **'Tu cuenta ha sido eliminada.'**
  String get profileDeleteAccountSuccess;

  /// No description provided for @profileDeleteAccountError.
  ///
  /// In es, this message translates to:
  /// **'Error al eliminar la cuenta. Inténtalo de nuevo.'**
  String get profileDeleteAccountError;

  /// No description provided for @paywallPrivacyPolicy.
  ///
  /// In es, this message translates to:
  /// **'Política de Privacidad'**
  String get paywallPrivacyPolicy;

  /// No description provided for @paywallTermsOfUse.
  ///
  /// In es, this message translates to:
  /// **'Términos de Uso'**
  String get paywallTermsOfUse;

  /// No description provided for @paywallLegalDisclaimer.
  ///
  /// In es, this message translates to:
  /// **'Al suscribirte aceptas nuestros Términos de Uso y Política de Privacidad.'**
  String get paywallLegalDisclaimer;

  /// No description provided for @tutorialSkip.
  ///
  /// In es, this message translates to:
  /// **'Saltar'**
  String get tutorialSkip;

  /// No description provided for @tutorialTapToContinue.
  ///
  /// In es, this message translates to:
  /// **'Toca en cualquier lugar para continuar'**
  String get tutorialTapToContinue;

  /// No description provided for @tutorialStep1Title.
  ///
  /// In es, this message translates to:
  /// **'Tu progreso global'**
  String get tutorialStep1Title;

  /// No description provided for @tutorialStep1Body.
  ///
  /// In es, this message translates to:
  /// **'Aquí ves cuántos cromos llevas y tu porcentaje de completado. ¡Sigue coleccionando!'**
  String get tutorialStep1Body;

  /// No description provided for @tutorialStep2Title.
  ///
  /// In es, this message translates to:
  /// **'Busca equipos'**
  String get tutorialStep2Title;

  /// No description provided for @tutorialStep2Body.
  ///
  /// In es, this message translates to:
  /// **'Escribe el nombre de un país o equipo para filtrar la lista al instante.'**
  String get tutorialStep2Body;

  /// No description provided for @tutorialStep3Title.
  ///
  /// In es, this message translates to:
  /// **'Menú principal'**
  String get tutorialStep3Title;

  /// No description provided for @tutorialStep3Body.
  ///
  /// In es, this message translates to:
  /// **'Aquí puedes cambiar tu perfil, elegir la variante del álbum y más opciones.'**
  String get tutorialStep3Body;

  /// No description provided for @tutorialStep4Title.
  ///
  /// In es, this message translates to:
  /// **'Escanea cromos'**
  String get tutorialStep4Title;

  /// No description provided for @tutorialStep4Body.
  ///
  /// In es, this message translates to:
  /// **'Usa la cámara para escanear el dorso de tus cromos físicos y añadirlos automáticamente a tu álbum.'**
  String get tutorialStep4Body;

  /// No description provided for @tutorialStep5Title.
  ///
  /// In es, this message translates to:
  /// **'Comparte tu lista'**
  String get tutorialStep5Title;

  /// No description provided for @tutorialStep5Body.
  ///
  /// In es, this message translates to:
  /// **'Exporta tu lista de faltantes o repetidas para intercambiar cromos con amigos.'**
  String get tutorialStep5Body;

  /// No description provided for @globalTutorialStep1Title.
  ///
  /// In es, this message translates to:
  /// **'Filtra tu colección'**
  String get globalTutorialStep1Title;

  /// No description provided for @globalTutorialStep1Body.
  ///
  /// In es, this message translates to:
  /// **'Usa estos botones para ver todos tus cromos, solo los que te faltan o solo los repetidos. ¡Ideal para organizar intercambios!'**
  String get globalTutorialStep1Body;

  /// No description provided for @globalTutorialStep2Title.
  ///
  /// In es, this message translates to:
  /// **'Busca un cromo'**
  String get globalTutorialStep2Title;

  /// No description provided for @globalTutorialStep2Body.
  ///
  /// In es, this message translates to:
  /// **'Escribe el nombre del país, el código o el número del cromo para encontrarlo rápidamente.'**
  String get globalTutorialStep2Body;

  /// No description provided for @globalTutorialStep3Title.
  ///
  /// In es, this message translates to:
  /// **'Toca para marcar'**
  String get globalTutorialStep3Title;

  /// No description provided for @globalTutorialStep3Body.
  ///
  /// In es, this message translates to:
  /// **'Un toque sobre un cromo gris lo añade a tu álbum (se pone dorado). Si ya lo tienes y lo tocas de nuevo, te pedirá confirmación para quitarlo.'**
  String get globalTutorialStep3Body;

  /// No description provided for @globalTutorialStep4Title.
  ///
  /// In es, this message translates to:
  /// **'Mantén pulsado para más opciones'**
  String get globalTutorialStep4Title;

  /// No description provided for @globalTutorialStep4Body.
  ///
  /// In es, this message translates to:
  /// **'Si mantienes pulsado un cromo puedes gestionar cuántas copias tienes de cada variante (Normal, Gold, Legend…) y actualizar tu inventario de repetidas.'**
  String get globalTutorialStep4Body;

  /// No description provided for @tutorialStep6Title.
  ///
  /// In es, this message translates to:
  /// **'Explora una categoria'**
  String get tutorialStep6Title;

  /// No description provided for @tutorialStep6Body.
  ///
  /// In es, this message translates to:
  /// **'Toca cualquier pais o equipo para ver sus cromos. Alli podras marcar los que ya tienes y gestionar tus repetidos.'**
  String get tutorialStep6Body;

  /// No description provided for @categoryTutorialStep1Title.
  ///
  /// In es, this message translates to:
  /// **'Filtra los cromos'**
  String get categoryTutorialStep1Title;

  /// No description provided for @categoryTutorialStep1Body.
  ///
  /// In es, this message translates to:
  /// **'Usa estos botones para ver todos los cromos de esta categoria, solo los que te faltan o solo los repetidos.'**
  String get categoryTutorialStep1Body;

  /// No description provided for @categoryTutorialStep2Title.
  ///
  /// In es, this message translates to:
  /// **'Busca un cromo'**
  String get categoryTutorialStep2Title;

  /// No description provided for @categoryTutorialStep2Body.
  ///
  /// In es, this message translates to:
  /// **'Escribe el nombre del pais, el codigo o el numero del cromo para encontrarlo rapidamente.'**
  String get categoryTutorialStep2Body;

  /// No description provided for @categoryTutorialStep3Title.
  ///
  /// In es, this message translates to:
  /// **'Toca para marcar'**
  String get categoryTutorialStep3Title;

  /// No description provided for @categoryTutorialStep3Body.
  ///
  /// In es, this message translates to:
  /// **'Un toque sobre un cromo gris lo anade a tu album (se pone dorado). Si ya lo tienes y lo tocas de nuevo, te pedira confirmacion para quitarlo.'**
  String get categoryTutorialStep3Body;

  /// No description provided for @categoryTutorialStep4Title.
  ///
  /// In es, this message translates to:
  /// **'Manten pulsado para mas opciones'**
  String get categoryTutorialStep4Title;

  /// No description provided for @categoryTutorialStep4Body.
  ///
  /// In es, this message translates to:
  /// **'Si mantienes pulsado un cromo puedes gestionar cuantas copias tienes de cada variante (Normal, Gold, Legend) y actualizar tu inventario de repetidas.'**
  String get categoryTutorialStep4Body;

  /// No description provided for @drawerReplayTutorial.
  ///
  /// In es, this message translates to:
  /// **'Ver tutorial de nuevo'**
  String get drawerReplayTutorial;

  /// No description provided for @variantTutorialTitle.
  ///
  /// In es, this message translates to:
  /// **'Selecciona tu región'**
  String get variantTutorialTitle;

  /// No description provided for @variantTutorialBody.
  ///
  /// In es, this message translates to:
  /// **'Elige la variante del álbum que corresponde a tu país o región. Esto define qué cromos y variantes (Normal, Gold, Legend) aparecerán en tu colección.'**
  String get variantTutorialBody;

  /// No description provided for @drawerLegalNotice.
  ///
  /// In es, this message translates to:
  /// **'Aviso Legal'**
  String get drawerLegalNotice;

  /// No description provided for @legalNoticeTitle.
  ///
  /// In es, this message translates to:
  /// **'Aviso Legal'**
  String get legalNoticeTitle;

  /// No description provided for @legalNoticeBody.
  ///
  /// In es, this message translates to:
  /// **'Esta aplicación es una creación de fans no oficial y no está afiliada, respaldada ni conectada con cualquier organización oficial de fútbol o fabricante de cromos o cualquier socio oficial del torneo de fútbol. Todas las marcas registradas son propiedad de sus respectivos dueños.'**
  String get legalNoticeBody;

  /// No description provided for @statsTitle.
  ///
  /// In es, this message translates to:
  /// **'Estadísticas'**
  String get statsTitle;

  /// No description provided for @statsTotalLabel.
  ///
  /// In es, this message translates to:
  /// **'Total'**
  String get statsTotalLabel;

  /// No description provided for @statsCollectedLabel.
  ///
  /// In es, this message translates to:
  /// **'Recolectados'**
  String get statsCollectedLabel;

  /// No description provided for @statsDuplicateCopiesLabel.
  ///
  /// In es, this message translates to:
  /// **'Repetidos'**
  String get statsDuplicateCopiesLabel;

  /// No description provided for @statsCategoriesTitle.
  ///
  /// In es, this message translates to:
  /// **'Por Categoría'**
  String get statsCategoriesTitle;

  /// No description provided for @statsAllCategories.
  ///
  /// In es, this message translates to:
  /// **'Todas'**
  String get statsAllCategories;

  /// No description provided for @statsNoStatsYet.
  ///
  /// In es, this message translates to:
  /// **'Sin datos aún. ¡Empieza a coleccionar!'**
  String get statsNoStatsYet;

  /// No description provided for @statsBestCategory.
  ///
  /// In es, this message translates to:
  /// **'Mayor progreso'**
  String get statsBestCategory;

  /// No description provided for @statsWorstCategory.
  ///
  /// In es, this message translates to:
  /// **'Menor progreso'**
  String get statsWorstCategory;

  /// No description provided for @statsCompletedCategories.
  ///
  /// In es, this message translates to:
  /// **'Completas'**
  String get statsCompletedCategories;

  /// No description provided for @drawerStats.
  ///
  /// In es, this message translates to:
  /// **'Estadísticas'**
  String get drawerStats;

  /// No description provided for @statsCategoryPickerSearch.
  ///
  /// In es, this message translates to:
  /// **'Buscar categoría...'**
  String get statsCategoryPickerSearch;

  /// No description provided for @statsCategoryPickerSelected.
  ///
  /// In es, this message translates to:
  /// **'{count} seleccionadas'**
  String statsCategoryPickerSelected(Object count);

  /// No description provided for @statsCategoryPickerAll.
  ///
  /// In es, this message translates to:
  /// **'Todas las categorías'**
  String get statsCategoryPickerAll;

  /// No description provided for @statsCategoryPickerClear.
  ///
  /// In es, this message translates to:
  /// **'Limpiar'**
  String get statsCategoryPickerClear;

  /// No description provided for @statsSortTooltip.
  ///
  /// In es, this message translates to:
  /// **'Ordenar'**
  String get statsSortTooltip;

  /// No description provided for @statsSortByName.
  ///
  /// In es, this message translates to:
  /// **'Categoría'**
  String get statsSortByName;

  /// No description provided for @statsSortByProgressDesc.
  ///
  /// In es, this message translates to:
  /// **'Mayor progreso primero'**
  String get statsSortByProgressDesc;

  /// No description provided for @statsSortByProgressAsc.
  ///
  /// In es, this message translates to:
  /// **'Menor progreso primero'**
  String get statsSortByProgressAsc;

  /// No description provided for @statsSortByMissing.
  ///
  /// In es, this message translates to:
  /// **'Más faltantes primero'**
  String get statsSortByMissing;

  /// No description provided for @statsSortByDuplicates.
  ///
  /// In es, this message translates to:
  /// **'Más repetidos primero'**
  String get statsSortByDuplicates;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'de',
    'en',
    'es',
    'fa',
    'fr',
    'he',
    'hi',
    'it',
    'ja',
    'ko',
    'nl',
    'pl',
    'pt',
    'ru',
    'tr',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fa':
      return AppLocalizationsFa();
    case 'fr':
      return AppLocalizationsFr();
    case 'he':
      return AppLocalizationsHe();
    case 'hi':
      return AppLocalizationsHi();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'nl':
      return AppLocalizationsNl();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'tr':
      return AppLocalizationsTr();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
