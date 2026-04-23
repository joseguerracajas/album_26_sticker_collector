import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

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
    Locale('en'),
    Locale('es'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In es, this message translates to:
  /// **'Album 26'**
  String get appTitle;

  /// No description provided for @authWelcomeTitle.
  ///
  /// In es, this message translates to:
  /// **'Bienvenido a Album 26'**
  String get authWelcomeTitle;

  /// No description provided for @authEmailLabel.
  ///
  /// In es, this message translates to:
  /// **'Correo electronico'**
  String get authEmailLabel;

  /// No description provided for @authPasswordLabel.
  ///
  /// In es, this message translates to:
  /// **'Contrasena'**
  String get authPasswordLabel;

  /// No description provided for @authLoginButton.
  ///
  /// In es, this message translates to:
  /// **'INICIAR SESION'**
  String get authLoginButton;

  /// No description provided for @authContinueWith.
  ///
  /// In es, this message translates to:
  /// **'O continuar con'**
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
  /// **'No tienes cuenta? Registrate'**
  String get authNoAccountRegister;

  /// No description provided for @authGuestMigratedSuccess.
  ///
  /// In es, this message translates to:
  /// **'Tu progreso invitado se copio a tu nueva cuenta.'**
  String get authGuestMigratedSuccess;

  /// No description provided for @authGuestRemotePreserved.
  ///
  /// In es, this message translates to:
  /// **'La cuenta ya existia: se conservaron los datos de la nube y se descarto el progreso invitado local.'**
  String get authGuestRemotePreserved;

  /// No description provided for @commonErrorWithMessage.
  ///
  /// In es, this message translates to:
  /// **'Error: {message}'**
  String commonErrorWithMessage(Object message);

  /// No description provided for @registerTitle.
  ///
  /// In es, this message translates to:
  /// **'Crear Cuenta'**
  String get registerTitle;

  /// No description provided for @registerFillAllFields.
  ///
  /// In es, this message translates to:
  /// **'Por favor, llena todos los campos.'**
  String get registerFillAllFields;

  /// No description provided for @registerEmailsDontMatch.
  ///
  /// In es, this message translates to:
  /// **'Los correos electronicos no coinciden.'**
  String get registerEmailsDontMatch;

  /// No description provided for @registerPasswordsDontMatch.
  ///
  /// In es, this message translates to:
  /// **'Las contrasenas no coinciden.'**
  String get registerPasswordsDontMatch;

  /// No description provided for @registerPasswordMinLength.
  ///
  /// In es, this message translates to:
  /// **'La contrasena debe tener al menos 6 caracteres.'**
  String get registerPasswordMinLength;

  /// No description provided for @registerAccountCreated.
  ///
  /// In es, this message translates to:
  /// **'Cuenta creada con exito. Ahora inicia sesion.'**
  String get registerAccountCreated;

  /// No description provided for @registerConfirmEmailLabel.
  ///
  /// In es, this message translates to:
  /// **'Confirmar correo electronico'**
  String get registerConfirmEmailLabel;

  /// No description provided for @registerConfirmPasswordLabel.
  ///
  /// In es, this message translates to:
  /// **'Confirmar contrasena'**
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
  /// **'Coleccionista Oficial'**
  String get profileOfficialCollector;

  /// No description provided for @profileLogoutButton.
  ///
  /// In es, this message translates to:
  /// **'Cerrar Sesion'**
  String get profileLogoutButton;

  /// No description provided for @profileUnknownUser.
  ///
  /// In es, this message translates to:
  /// **'Usuario desconocido'**
  String get profileUnknownUser;

  /// No description provided for @profileLogoutError.
  ///
  /// In es, this message translates to:
  /// **'Error al cerrar sesion: {message}'**
  String profileLogoutError(Object message);

  /// No description provided for @homeTitle.
  ///
  /// In es, this message translates to:
  /// **'Mi Album 26'**
  String get homeTitle;

  /// No description provided for @homeProfileTooltip.
  ///
  /// In es, this message translates to:
  /// **'Mi Perfil'**
  String get homeProfileTooltip;

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
  /// **'Ver Coleccion Completa'**
  String get homeViewFullCollection;

  /// No description provided for @homeTeamsTitle.
  ///
  /// In es, this message translates to:
  /// **'Equipos'**
  String get homeTeamsTitle;

  /// No description provided for @homeSearchTeamsHint.
  ///
  /// In es, this message translates to:
  /// **'Buscar pais o equipo...'**
  String get homeSearchTeamsHint;

  /// No description provided for @homeNoResults.
  ///
  /// In es, this message translates to:
  /// **'Sin resultados'**
  String get homeNoResults;

  /// No description provided for @homeScanButton.
  ///
  /// In es, this message translates to:
  /// **'Escanear'**
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
  /// **'Coleccion Completa'**
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
  /// **'Buscar pais, codigo o numero...'**
  String get filterSearchHint;

  /// No description provided for @stickerRemoveTitle.
  ///
  /// In es, this message translates to:
  /// **'Quitar cromo?'**
  String get stickerRemoveTitle;

  /// No description provided for @stickerRemoveConfirm.
  ///
  /// In es, this message translates to:
  /// **'Seguro que quieres quitar el cromo {stickerLabel}?'**
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
  /// **'Sin resultados.'**
  String get gridNoResults;

  /// No description provided for @scannerViewScannedButton.
  ///
  /// In es, this message translates to:
  /// **'Ver {count} cromos escaneados'**
  String scannerViewScannedButton(Object count);

  /// No description provided for @scannerOverlayHint.
  ///
  /// In es, this message translates to:
  /// **'Centra la parte trasera del cromo aqui'**
  String get scannerOverlayHint;

  /// No description provided for @pendingScansTitle.
  ///
  /// In es, this message translates to:
  /// **'Cromos Escaneados'**
  String get pendingScansTitle;

  /// No description provided for @pendingScansEmpty.
  ///
  /// In es, this message translates to:
  /// **'Aun no has escaneado nada'**
  String get pendingScansEmpty;

  /// No description provided for @pendingScansItemLabel.
  ///
  /// In es, this message translates to:
  /// **'Cromo: {code}'**
  String pendingScansItemLabel(Object code);

  /// No description provided for @pendingScansSavedSuccess.
  ///
  /// In es, this message translates to:
  /// **'{count} cromos guardados con exito!'**
  String pendingScansSavedSuccess(Object count);

  /// No description provided for @pendingScansSaveError.
  ///
  /// In es, this message translates to:
  /// **'Error al guardar: {message}'**
  String pendingScansSaveError(Object message);

  /// No description provided for @shareHeader.
  ///
  /// In es, this message translates to:
  /// **'⚽ *INTERCAMBIO ALBUM 26* 🏆'**
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
  /// **'Ninguno! 😎'**
  String get shareNoneMissing;

  /// No description provided for @shareNoDuplicates.
  ///
  /// In es, this message translates to:
  /// **'Sin repetidas 😅'**
  String get shareNoDuplicates;

  /// No description provided for @shareLetsTrade.
  ///
  /// In es, this message translates to:
  /// **'Cambiamos? 👀🔥'**
  String get shareLetsTrade;

  /// No description provided for @shareSeparator.
  ///
  /// In es, this message translates to:
  /// **'--------------------------'**
  String get shareSeparator;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
