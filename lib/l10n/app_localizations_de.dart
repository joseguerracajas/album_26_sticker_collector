// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Album 26';

  @override
  String get authWelcomeTitle => 'Willkommen bei Album 26';

  @override
  String get authEmailLabel => 'E-Mail';

  @override
  String get authPasswordLabel => 'Passwort';

  @override
  String get authLoginButton => 'ANMELDEN';

  @override
  String get authContinueWith => 'Oder weiter mit';

  @override
  String get authContinueGoogle => 'Mit Google fortfahren';

  @override
  String get authContinueApple => 'Mit Apple fortfahren';

  @override
  String get authContinueGuest => 'Als Gast fortfahren';

  @override
  String get authNoAccountRegister => 'Kein Konto? Registrieren';

  @override
  String get authForgotPassword => 'Passwort vergessen?';

  @override
  String get authResetPasswordEnterEmail =>
      'Gib deine E-Mail ein, um dein Passwort zurückzusetzen.';

  @override
  String get authResetPasswordEmailSent =>
      'Wir haben dir eine E-Mail zum Zurücksetzen deines Passworts gesendet.';

  @override
  String get authGuestMigratedSuccess =>
      'Dein Gastfortschritt wurde erfolgreich auf dein neues Konto übertragen! 🏆';

  @override
  String get authGuestRemotePreserved =>
      'Willkommen zurück! Deine Cloud-Sammlung wurde wiederhergestellt und der lokale Gastfortschritt wurde verworfen.';

  @override
  String commonErrorWithMessage(Object message) {
    return 'Fehler: $message';
  }

  @override
  String get authErrorInvalidCredentials =>
      'Falsche E-Mail oder falsches Passwort. Überprüfe deine Daten und versuche es erneut.';

  @override
  String get authErrorEmailNotConfirmed =>
      'Deine E-Mail wurde noch nicht bestätigt. Überprüfe deinen Posteingang.';

  @override
  String get authErrorUserAlreadyRegistered =>
      'Es existiert bereits ein Konto mit dieser E-Mail-Adresse.';

  @override
  String get authErrorWeakPassword =>
      'Das Passwort ist zu schwach. Verwende mindestens 6 Zeichen.';

  @override
  String get authErrorInvalidEmail =>
      'Das Format der E-Mail-Adresse ist ungültig.';

  @override
  String get authErrorTokenExpired =>
      'Der Code ist abgelaufen oder ungültig. Bitte fordere einen neuen an.';

  @override
  String get authErrorRateLimit =>
      'Zu viele Versuche. Warte einen Moment, bevor du es erneut versuchst.';

  @override
  String get authErrorNetworkError =>
      'Keine Verbindung. Überprüfe dein Netzwerk und versuche es erneut.';

  @override
  String get authErrorSessionExpired =>
      'Deine Sitzung ist abgelaufen. Bitte melde dich erneut an.';

  @override
  String get authErrorUnknown =>
      'Ein unerwarteter Fehler ist aufgetreten. Bitte versuche es erneut.';

  @override
  String get registerTitle => 'Konto erstellen';

  @override
  String get registerFillAllFields => 'Bitte fülle alle Felder aus.';

  @override
  String get registerEmailsDontMatch =>
      'Die E-Mail-Adressen stimmen nicht überein.';

  @override
  String get registerPasswordsDontMatch =>
      'Die Passwörter stimmen nicht überein.';

  @override
  String get registerPasswordMinLength =>
      'Das Passwort muss mindestens 6 Zeichen lang sein.';

  @override
  String get registerAccountCreated =>
      'Konto erfolgreich erstellt! ⚽ Bitte melde dich an.';

  @override
  String get registerConfirmEmailLabel => 'E-Mail bestätigen';

  @override
  String get registerConfirmPasswordLabel => 'Passwort bestätigen';

  @override
  String get registerSubmitButton => 'REGISTRIEREN';

  @override
  String get profileTitle => 'Mein Profil';

  @override
  String get profileOfficialCollector => 'Offizieller Sammler 🌟';

  @override
  String get profileChangePasswordButton => 'Passwort aktualisieren';

  @override
  String get profileChangePasswordTitle => 'Passwort aktualisieren';

  @override
  String get profileNewPasswordLabel => 'Neues Passwort';

  @override
  String get profileConfirmNewPasswordLabel => 'Neues Passwort bestätigen';

  @override
  String get profilePasswordUpdatedSuccess =>
      'Passwort erfolgreich aktualisiert.';

  @override
  String get profileLogoutButton => 'Abmelden';

  @override
  String get profileLogoutSuccess => 'Du hast dich erfolgreich abgemeldet.';

  @override
  String get profileUnknownUser => 'Unbekannter Benutzer';

  @override
  String profileLogoutError(Object message) {
    return 'Fehler beim Abmelden: $message';
  }

  @override
  String get homeTitle => 'Mein Album 26';

  @override
  String get homeProfileTooltip => 'Mein Profil';

  @override
  String get homeShareAll => 'Vollständige Liste teilen';

  @override
  String get homeShareMissingOnly => 'Nur Fehlende';

  @override
  String get homeShareDuplicatesOnly => 'Nur Doppelte';

  @override
  String get homeGlobalProgressTitle => 'Gesamtfortschritt';

  @override
  String homeCollectedCount(Object collected, Object total) {
    return '$collected von $total gesammelt';
  }

  @override
  String get homeViewFullCollection => 'Vollständige Sammlung anzeigen';

  @override
  String get homeTeamsTitle => 'Mannschaften';

  @override
  String get homeSearchTeamsHint => 'Nach Land oder Mannschaft suchen...';

  @override
  String get homeNoResults => 'Keine Mannschaften gefunden';

  @override
  String get homeScanButton => 'Sticker scannen';

  @override
  String homeObtainedCount(Object collected, Object total) {
    return '$collected von $total erhalten';
  }

  @override
  String get homeProgressError => 'Fehler';

  @override
  String get globalCollectionTitle => 'Vollständige Sammlung';

  @override
  String get filterAll => 'Alle';

  @override
  String get filterMissing => 'Fehlende';

  @override
  String get filterDuplicates => 'Doppelte';

  @override
  String get filterSearchHint => 'Nach Land, Code oder Nummer suchen...';

  @override
  String get stickerRemoveTitle => 'Sticker entfernen?';

  @override
  String stickerRemoveConfirm(Object stickerLabel) {
    return 'Möchtest du den Sticker $stickerLabel wirklich aus deinem Album entfernen?';
  }

  @override
  String get commonCancel => 'Abbrechen';

  @override
  String get commonRemove => 'Entfernen';

  @override
  String get commonDone => 'FERTIG';

  @override
  String get gridNoResults => 'Keine Sticker gefunden.';

  @override
  String scannerViewScannedButton(Object count) {
    return '$count gescannte Sticker überprüfen';
  }

  @override
  String get scannerOverlayHint => 'Zentriere die Rückseite des Stickers hier';

  @override
  String get pendingScansTitle => 'Gescannte Sticker';

  @override
  String get pendingScansEmpty => 'Du hast noch keine Sticker gescannt';

  @override
  String pendingScansItemLabel(Object code) {
    return 'Sticker: $code';
  }

  @override
  String pendingScansSavedSuccess(Object count) {
    return '$count Sticker erfolgreich zu deinem Album hinzugefügt! 🏆';
  }

  @override
  String pendingScansSaveError(Object message) {
    return 'Fehler beim Speichern: $message';
  }

  @override
  String get shareHeader => '⚽ *TAUSCH-LISTE ALBUM 26* 🏆';

  @override
  String get shareMissingSectionTitle => '❌ *FEHLEND:*';

  @override
  String get shareDuplicatesSectionTitle => '🔁 *DOPPELTE:*';

  @override
  String get shareNoneMissing => 'Keine! 😎';

  @override
  String get shareNoDuplicates => 'Keine Doppelten 😅';

  @override
  String get shareLetsTrade => 'Möchtest du tauschen? 👀🔥';

  @override
  String get shareSeparator => '--------------------------';

  @override
  String get forgotPasswordTitle => 'Konto wiederherstellen';

  @override
  String get forgotPasswordDescription =>
      'Gib deine E-Mail ein und wir senden dir einen 6-stelligen Code zum Zurücksetzen deines Passworts.';

  @override
  String get forgotPasswordEmailLabel => 'E-Mail';

  @override
  String get forgotPasswordEmptyEmailError =>
      'Bitte gib deine E-Mail-Adresse ein.';

  @override
  String get forgotPasswordCodeSentSuccess =>
      'Code gesendet. Überprüfe deinen Posteingang.';

  @override
  String get forgotPasswordSendCodeButton => 'CODE SENDEN';

  @override
  String forgotPasswordStep2Description(Object email) {
    return 'Gib den Code ein, den wir an $email gesendet haben, und dein neues Passwort.';
  }

  @override
  String get forgotPasswordCodeInputLabel => '8-stelliger Code';

  @override
  String get forgotPasswordInvalidCodeError =>
      'Der Code muss genau 6 Ziffern haben.';

  @override
  String get forgotPasswordNewPasswordLabel => 'Neues Passwort';

  @override
  String get forgotPasswordShortPasswordError =>
      'Das Passwort muss mindestens 6 Zeichen lang sein.';

  @override
  String get forgotPasswordSavePasswordButton => 'PASSWORT SPEICHERN';

  @override
  String get forgotPasswordPasswordUpdatedSuccess =>
      'Passwort erfolgreich aktualisiert! 🏆';

  @override
  String get paywallTitle => 'Ohne Werbung genießen';

  @override
  String get paywallSubtitle =>
      'Alle Funktionen sind kostenlos verfügbar. Mit Pro genießt du alles ohne Unterbrechungen.';

  @override
  String get paywallBenefitScanner => 'Scanner ohne Interstitial-Anzeigen';

  @override
  String get paywallBenefitNoAds => 'Keine Werbung';

  @override
  String get paywallBenefitSync => 'Cloud-Synchronisierung inklusive';

  @override
  String paywallSubscribeButton(Object price) {
    return 'Abonnieren · $price';
  }

  @override
  String get paywallPackageMonthly => 'Monatlich';

  @override
  String get paywallPackageAnnual => 'Jährlich';

  @override
  String get paywallPackageWeekly => 'Wöchentlich';

  @override
  String get paywallPackageLifetime => 'Lebenslang';

  @override
  String get paywallPackageTwoMonth => 'Alle 2 Monate';

  @override
  String get paywallPackageThreeMonth => 'Alle 3 Monate';

  @override
  String get paywallPackageSixMonth => 'Alle 6 Monate';

  @override
  String get paywallRestorePurchases => 'Käufe wiederherstellen';

  @override
  String get paywallCancelAnytime =>
      'Jederzeit kündbar. Keine Verpflichtungen.';

  @override
  String get paywallLoadError =>
      'Pläne konnten nicht geladen werden. Überprüfe deine Verbindung.';

  @override
  String get paywallRetry => 'Erneut versuchen';

  @override
  String get paywallPurchaseError =>
      'Kauf fehlgeschlagen. Bitte versuche es erneut.';

  @override
  String get paywallRestoreError =>
      'Käufe konnten nicht wiederhergestellt werden. Bitte versuche es erneut.';

  @override
  String get paywallGuestTitle => 'Anmelden, um zu abonnieren';

  @override
  String get paywallGuestBody =>
      'Pro ist mit deinem Konto verknüpft. Melde dich an oder erstelle ein Konto, um alle Funktionen freizuschalten.';

  @override
  String get paywallGuestSignInButton => 'ANMELDEN';

  @override
  String scannerDemoRemaining(Object count) {
    return '$count kostenlose Scans verbleibend';
  }

  @override
  String get scannerDemoFinishedTitle =>
      'Du hast deine 5 kostenlosen Scans verwendet';

  @override
  String get scannerDemoFinishedSubtitle =>
      'Abonniere, um unbegrenzt Sticker zu scannen und werbefrei zu genießen.';

  @override
  String get scannerDemoUnlockButton => 'Pro-Pläne ansehen';

  @override
  String get adDialogTitle => 'Kostenloser Inhalt';

  @override
  String get adDialogBody =>
      'Um fortzufahren, sieh dir eine kurze Werbung an oder abonniere Pro und vergiss Werbung für immer.';

  @override
  String get adDialogWatchAd => 'Werbung ansehen';

  @override
  String get adDialogGetPro => 'Pro holen';

  @override
  String get adDialogNotNow => 'Nicht jetzt';

  @override
  String get scannerCameraInitError =>
      'Die Kamera konnte nicht initialisiert werden. Stelle sicher, dass die App Kamerazugriff hat.';
}
