// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Album 2026';

  @override
  String get authWelcomeTitle => 'Willkommen bei Album 2026';

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
  String get homeTitle => 'Mein Album 2026';

  @override
  String get homeProfileTooltip => 'Mein Profil';

  @override
  String get drawerSignIn => 'Anmelden';

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
  String get shareHeader => '⚽ *TAUSCH-LISTE Album 2026* 🏆';

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
  String get validationEmailInvalid => 'Die E-Mail-Adresse ist ungültig.';

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

  @override
  String get variantSheetTitle => 'Album-Variante';

  @override
  String get variantSheetInventoryNote =>
      'Dein Inventar bleibt beim Variantenwechsel erhalten. Die Sticker, die du bereits hast, bleiben registriert.';

  @override
  String variantSheetLoadError(Object error) {
    return 'Fehler beim Laden der Varianten: $error';
  }

  @override
  String get variantSheetEmpty => 'Keine Varianten für dieses Album verfügbar.';

  @override
  String get variantSheetDefaultLabel => 'Standardvariante';

  @override
  String get variantMandatoryTitle => 'Wähle deine Region';

  @override
  String get variantMandatorySubtitle =>
      'Wähle deine Albumvariante, um die richtigen Sticker anzuzeigen.';

  @override
  String variantChangedSuccess(Object name) {
    return 'Variante geändert zu $name ✅';
  }

  @override
  String get profileDeleteAccountButton => 'Konto löschen';

  @override
  String get profileDeleteAccountTitle => 'Konto löschen?';

  @override
  String get profileDeleteAccountMessage =>
      'Diese Aktion ist dauerhaft. Alle deine Daten werden gelöscht und du kannst deine Sammlung nicht wiederherstellen.';

  @override
  String get profileDeleteAccountConfirmButton => 'Endgültig löschen';

  @override
  String get profileDeleteAccountSuccess => 'Dein Konto wurde gelöscht.';

  @override
  String get profileDeleteAccountError =>
      'Fehler beim Löschen des Kontos. Bitte versuche es erneut.';

  @override
  String get paywallPrivacyPolicy => 'Datenschutzrichtlinie';

  @override
  String get paywallTermsOfUse => 'Nutzungsbedingungen';

  @override
  String get paywallLegalDisclaimer =>
      'Durch das Abonnieren stimmst du unseren Nutzungsbedingungen und der Datenschutzrichtlinie zu.';

  @override
  String get tutorialSkip => 'Überspringen';

  @override
  String get tutorialTapToContinue => 'Tippe irgendwo, um fortzufahren';

  @override
  String get tutorialStep1Title => 'Dein globaler Fortschritt';

  @override
  String get tutorialStep1Body =>
      'Hier siehst du, wie viele Sticker du gesammelt hast. Weiter sammeln!';

  @override
  String get tutorialStep2Title => 'Teams suchen';

  @override
  String get tutorialStep2Body =>
      'Tippe einen Land- oder Teamnamen ein, um die Liste zu filtern.';

  @override
  String get tutorialStep3Title => 'Hauptmenü';

  @override
  String get tutorialStep3Body =>
      'Greife auf dein Profil zu und wechsle Album-Varianten.';

  @override
  String get tutorialStep4Title => 'Sticker scannen';

  @override
  String get tutorialStep4Body =>
      'Nutze die Kamera, um Sticker zu scannen und automatisch hinzuzufügen.';

  @override
  String get tutorialStep5Title => 'Liste teilen';

  @override
  String get tutorialStep5Body =>
      'Exportiere deine fehlenden oder doppelten Sticker zum Tauschen.';

  @override
  String get globalTutorialStep1Title => 'Sammlung filtern';

  @override
  String get globalTutorialStep1Body =>
      'Nutze diese Schaltflächen, um alle Sticker, nur die fehlenden oder nur die doppelten anzuzeigen. Ideal zum Organisieren von Tauschangeboten!';

  @override
  String get globalTutorialStep2Title => 'Sticker suchen';

  @override
  String get globalTutorialStep2Body =>
      'Tippe den Ländernamen, den Code oder die Stickernummer ein, um ihn schnell zu finden.';

  @override
  String get globalTutorialStep3Title => 'Tippen zum Markieren';

  @override
  String get globalTutorialStep3Body =>
      'Ein Tippen auf einen grauen Sticker fügt ihn zu deinem Album hinzu (wird golden). Wenn du ihn erneut antippst, wirst du um Bestätigung gebeten, ihn zu entfernen.';

  @override
  String get globalTutorialStep4Title => 'Lang drücken für mehr Optionen';

  @override
  String get globalTutorialStep4Body =>
      'Halte einen Sticker gedrückt, um zu verwalten, wie viele Exemplare du von jeder Variante (Normal, Gold, Legend...) hast.';

  @override
  String get tutorialStep6Title => 'Kategorie erkunden';

  @override
  String get tutorialStep6Body =>
      'Tippe auf ein Land oder Team, um seine Sticker zu sehen. Dort kannst du vorhandene markieren und doppelte Sticker verwalten.';

  @override
  String get categoryTutorialStep1Title => 'Sticker filtern';

  @override
  String get categoryTutorialStep1Body =>
      'Nutze diese Schaltflaechen, um alle Sticker, nur fehlende oder nur doppelte Sticker zu sehen.';

  @override
  String get categoryTutorialStep2Title => 'Sticker suchen';

  @override
  String get categoryTutorialStep2Body =>
      'Tippe den Laendernamen, Code oder die Stickernummer ein, um ihn schnell zu finden.';

  @override
  String get categoryTutorialStep3Title => 'Antippen zum Markieren';

  @override
  String get categoryTutorialStep3Body =>
      'Ein Tipp auf einen grauen Sticker fuegt ihn deinem Album hinzu (wird gold). Wenn du ihn bereits hast und erneut tippst, wirst du gefragt, ob du ihn entfernen moechtest.';

  @override
  String get categoryTutorialStep4Title =>
      'Lang druecken fuer weitere Optionen';

  @override
  String get categoryTutorialStep4Body =>
      'Langes Druecken erlaubt dir, die Anzahl der Exemplare jeder Variante (Normal, Gold, Legend) zu verwalten.';

  @override
  String get drawerReplayTutorial => 'Tutorial wiederholen';

  @override
  String get variantTutorialTitle => 'Wähle deine Region';

  @override
  String get variantTutorialBody =>
      'Wähle die Albumvariante, die deinem Land oder deiner Region entspricht. Das legt fest, welche Sticker und Varianten (Normal, Gold, Legend) in deiner Sammlung erscheinen.';

  @override
  String get drawerLegalNotice => 'Rechtlicher Hinweis';

  @override
  String get legalNoticeTitle => 'Rechtlicher Hinweis';

  @override
  String get legalNoticeBody =>
      'Diese Anwendung ist eine inoffizielle Fan-Erstellung und steht in keiner Verbindung zu einer offiziellen Fußballorganisation, einem Stickerhersteller oder einem offiziellen Partner des Fußballturniers, wird von diesen nicht unterstützt oder genehmigt. Alle Markenzeichen sind Eigentum der jeweiligen Inhaber.';

  @override
  String get statsTitle => 'Statistiken';

  @override
  String get statsTotalLabel => 'Gesamt';

  @override
  String get statsCollectedLabel => 'Gesammelt';

  @override
  String get statsDuplicateCopiesLabel => 'Doppelte';

  @override
  String get statsCategoriesTitle => 'Nach Kategorie';

  @override
  String get statsAllCategories => 'Alle';

  @override
  String get statsNoStatsYet => 'Noch keine Daten. Fange an zu sammeln!';

  @override
  String get statsBestCategory => 'Meisten Fortschritt';

  @override
  String get statsWorstCategory => 'Wenigsten Fortschritt';

  @override
  String get statsCompletedCategories => 'Abgeschlossen';

  @override
  String get drawerStats => 'Statistiken';

  @override
  String get statsCategoryPickerSearch => 'Kategorie suchen...';

  @override
  String statsCategoryPickerSelected(Object count) {
    return '$count ausgewählt';
  }

  @override
  String get statsCategoryPickerAll => 'Alle Kategorien';

  @override
  String get statsCategoryPickerClear => 'Löschen';

  @override
  String get statsSortTooltip => 'Sortieren';

  @override
  String get statsSortByName => 'Kategorie';

  @override
  String get statsSortByProgressDesc => 'Meisten Fortschritt zuerst';

  @override
  String get statsSortByProgressAsc => 'Wenigsten Fortschritt zuerst';

  @override
  String get statsSortByMissing => 'Meisten Fehlenden zuerst';

  @override
  String get statsSortByDuplicates => 'Meisten Duplikate zuerst';

  @override
  String get tradeHubTitle => 'Intercambio de stickers';

  @override
  String get tradeHubMyCode => 'Mi código de intercambio';

  @override
  String get tradeHubCodeCopied => 'Código copiado al portapapeles';

  @override
  String get tradeHubShareHint =>
      'Comparte este código o escanea el del otro usuario';

  @override
  String get tradeHubNoActive => 'Sin intercambio activo';

  @override
  String get tradeHubNoActiveDesc =>
      'Inicia un intercambio ingresando el código de otro coleccionista.';

  @override
  String get tradeHubStartBtn => 'Iniciar intercambio';

  @override
  String get tradeHubHistory => 'Historial';

  @override
  String get tradeHubCancel => 'Cancelar intercambio';

  @override
  String get tradeHubCancelTitle => '¿Cancelar intercambio?';

  @override
  String get tradeHubCancelMsg =>
      'Se cancelará el intercambio y los stickers volverán a tu inventario.';

  @override
  String get tradeHubCancelYes => 'Sí, cancelar';

  @override
  String get tradeHubActiveLabel => 'Intercambio activo';

  @override
  String get tradeStatusPending => 'Esperando respuesta';

  @override
  String get tradeStatusPendingDesc =>
      'El otro usuario debe aceptar tu solicitud de intercambio.';

  @override
  String get tradeStatusIncoming => '¡Tienes una solicitud!';

  @override
  String get tradeStatusIncomingDesc =>
      'Alguien quiere intercambiar stickers contigo.';

  @override
  String get tradeStatusSelecting => 'Seleccionando stickers';

  @override
  String get tradeStatusSelectingDesc =>
      'Ambos están eligiendo qué stickers ofrecer.';

  @override
  String get tradeStatusMyConfirmed => 'Tu oferta está lista';

  @override
  String get tradeStatusMyConfirmedDesc =>
      'Esperando que el otro usuario confirme su oferta.';

  @override
  String get tradeStatusOtherConfirmed => 'El otro ya confirmó';

  @override
  String get tradeStatusOtherConfirmedDesc =>
      'Confirma tu selección de stickers para continuar.';

  @override
  String get tradeStatusReservedLabel => 'stickers reservados';

  @override
  String get tradeStatusReservedDesc =>
      'Intercambio acordado. Confirma cuando hayas recibido tus stickers.';

  @override
  String get tradeAcceptBtn => 'Aceptar intercambio';

  @override
  String get tradeSeeOfferBtn => 'Ver intercambio';

  @override
  String get tradeSelectBtn => 'Seleccionar mis stickers';

  @override
  String get tradeConfirmDeliveryBtn => 'Confirmar recepción';

  @override
  String get tradeFindTitle => 'Buscar coleccionista';

  @override
  String get tradeFindCodeTab => 'Código';

  @override
  String get tradeFindScanTab => 'Escanear QR';

  @override
  String get tradeFindInstruction =>
      'Ingresa el código de 6 dígitos del coleccionista';

  @override
  String get tradeFindHint =>
      'Puedes encontrar el código en su pantalla de intercambio.';

  @override
  String get tradeFindSearchBtn => 'Buscar';

  @override
  String get tradeFindSearching => 'Buscando…';

  @override
  String get tradeFindScanHint => 'Apunta al código QR del otro coleccionista';

  @override
  String get tradeFindPartnerFound => '¡Usuario encontrado!';

  @override
  String tradeFindPartnerCode(Object code) {
    return 'Código: $code';
  }

  @override
  String get tradeFindSendBtn => 'Enviar solicitud de intercambio';

  @override
  String get tradeFindSending => 'Enviando…';

  @override
  String tradeFindRequestSent(Object name) {
    return '¡Solicitud enviada a $name! Espera su respuesta.';
  }

  @override
  String get tradeNegTitle => 'Negociación';

  @override
  String get tradeNegMyOfferTab => 'Mi oferta';

  @override
  String get tradeNegReceivingTab => 'Voy a recibir';

  @override
  String get tradeNegAutoMode => 'Auto';

  @override
  String get tradeNegManualMode => 'Manual';

  @override
  String get tradeNegAutoHint =>
      'Modo automático: se muestran tus repetidos. Cambia a Manual para personalizar.';

  @override
  String tradeNegSelectedCount(Object count) {
    return '$count cromo(s) seleccionado(s)';
  }

  @override
  String get tradeNegNoStickers => 'No tienes stickers para ofrecer.';

  @override
  String get tradeNegPartnerWaiting =>
      'El otro coleccionista aún no ha seleccionado sus stickers.';

  @override
  String tradeNegOfferLabel(Object count) {
    return 'Ofrecerás $count cromo(s)';
  }

  @override
  String get tradeNegConfirmBtn => 'Confirmar mi oferta';

  @override
  String get tradeNegSaving => 'Guardando…';

  @override
  String get tradeNegAtLeastOne => 'Selecciona al menos un cromo para ofrecer.';

  @override
  String get tradeNegOfferConfirmed =>
      '¡Oferta confirmada! Esperando al otro coleccionista.';

  @override
  String get tradeNegAlreadyConfirmedBanner =>
      'Tu oferta está confirmada. Esperando al otro coleccionista.';

  @override
  String get tradeNegModifyOffer => 'Modificar mi oferta';

  @override
  String get tradeNegModifyOfferWarning =>
      'Podrás cambiar los stickers que vas a dar. El otro coleccionista deberá esperar.';

  @override
  String get tradeNegQtyPickerTitle => '¿Cuántos ofrecer?';

  @override
  String tradeNegQtyPickerHint(Object total, Object max) {
    return 'Tienes $total copias. Máx. a ofrecer: $max.';
  }

  @override
  String tradeNegOfferedQtyBadge(Object qty) {
    return 'Ofreciendo $qty';
  }

  @override
  String get tradeNegPartnerOfferUpdated =>
      'El otro coleccionista actualizó su oferta de stickers.';

  @override
  String tradeNegTotalItems(Object count) {
    return '$count cromo(s) en total';
  }

  @override
  String tradeNegReceivingCount(Object count) {
    return '$count cromo(s) que vas a recibir';
  }

  @override
  String get tradeDeliveryTitle => 'Confirmar recepción';

  @override
  String get tradeDeliveryInstruction =>
      'Marca los stickers que recibiste físicamente';

  @override
  String get tradeDeliveryDesc =>
      'Los marcados se añadirán a tu álbum. Los desmarcados volverán al inventario del otro coleccionista.';

  @override
  String get tradeDeliveryNoOffer =>
      'El otro coleccionista no ofreció ningún cromo.';

  @override
  String get tradeDeliveryNotReceived => 'No recibido';

  @override
  String tradeDeliveryAllReceived(Object received, Object total) {
    return 'Recibiste todos los stickers ($received/$total)';
  }

  @override
  String tradeDeliveryPartial(Object received, Object total, Object pending) {
    return '$received de $total marcados · $pending volverán al otro coleccionista.';
  }

  @override
  String get tradeDeliveryConfirmTitle => 'Confirmar recepción';

  @override
  String tradeDeliveryConfirmMsg(Object received, Object pending) {
    return 'Se añadirán $received cromo(s) a tu álbum.\n$pending cromo(s) desmarcados volverán al otro coleccionista.';
  }

  @override
  String tradeDeliverySuccess(Object count) {
    return '¡$count cromo(s) añadidos a tu álbum! 🏆';
  }

  @override
  String get tradeHistoryTitle => 'Historial de intercambios';

  @override
  String get tradeHistoryEmpty => 'Sin intercambios todavía';

  @override
  String get tradeHistoryEmptyDesc =>
      'Los intercambios completados y cancelados aparecerán aquí.';

  @override
  String get tradeHistoryCompleted => 'Completado';

  @override
  String get tradeHistoryCancelled => 'Cancelado';

  @override
  String get tradeHistoryStartedByMe => 'Tú iniciaste';

  @override
  String get tradeHistoryReceivedRequest => 'Recibiste solicitud';

  @override
  String get tradeHistorySent => 'Enviaste';

  @override
  String get tradeHistoryReceivedLabel => 'Recibiste';

  @override
  String tradeHistoryDelivered(Object count) {
    return '$count entregado(s)';
  }

  @override
  String tradeHistoryStickerCount(Object count) {
    return '$count cromo(s)';
  }

  @override
  String get tradeDrawerTitle => 'Intercambiar stickers';

  @override
  String get tradeDrawerActiveBadge => 'ACTIVO';

  @override
  String get tradeErrorGeneric =>
      'Ocurrió un error en el intercambio. Inténtalo de nuevo.';

  @override
  String get tradeErrorNotLoggedIn =>
      'Debes iniciar sesión para intercambiar stickers.';

  @override
  String get tradeErrorSelf => 'No puedes intercambiar stickers contigo mismo.';

  @override
  String get tradeErrorCodeNotFound =>
      'No se encontró ningún usuario con ese código.';

  @override
  String get tradeErrorCodeLength =>
      'El código debe tener exactamente 6 dígitos.';

  @override
  String get tradeErrorActiveExists =>
      'Ya tienes un intercambio activo. Completa o cancela el actual primero.';

  @override
  String get tradeErrorNoConnection =>
      'Esta función requiere conexión a internet.';

  @override
  String get tradeRejectBtn => 'Rechazar solicitud';

  @override
  String get tradeDrawerRequestBadge => 'SOLICITUD';

  @override
  String get drawerPhysicalExchange => 'Intercambio';

  @override
  String get physicalExchangeScreenTitle => 'Intercambio Físico';

  @override
  String get drawerLookup => 'Sticker abfragen';

  @override
  String get physicalExchangeVirtualBtn => 'Intercambio Virtual';

  @override
  String get lookupScreenTitle => 'Sticker abfragen';

  @override
  String get lookupTabManual => 'Manuell';

  @override
  String get lookupTabScanner => 'Scanner';

  @override
  String get lookupSearchHint => 'z.B.: ECU 10, ARG 5, FRA 1...';

  @override
  String get lookupSearchButton => 'Suchen';

  @override
  String get lookupStickerNotFound => 'Kein Sticker mit diesem Code gefunden.';

  @override
  String get lookupStatusMissing => 'Fehlt';

  @override
  String get lookupStatusCollected => 'Hast du ✓';

  @override
  String lookupStatusDuplicates(Object count) {
    return '$count Duplikat(e) 🔁';
  }

  @override
  String get lookupQtyLabel => 'Menge in deinem Inventar';

  @override
  String get lookupScannerHint => 'Sticker zentrieren, um ihn zu erkennen';

  @override
  String get lookupScannerOpenTooltip => 'Abrir escáner';

  @override
  String get lookupScannerOpenCamera => 'Escanear stickers';

  @override
  String get lookupScannerViewResults => 'Ver resultados';

  @override
  String lookupScannerSaveSuccess(Object count) {
    return '$count cromo(s) agregado(s) al inventario';
  }

  @override
  String lookupScannerScannedCount(Object count) {
    return '$count escaneados';
  }

  @override
  String get lookupScannerNewLabel => 'nuevos';

  @override
  String get lookupScannerDuplicatesLabel => 'repetidos';

  @override
  String get lookupScannerResetTooltip => 'Reiniciar sesión';

  @override
  String get lookupScannerResetConfirmTitle => '¿Reiniciar sesión?';

  @override
  String get lookupScannerResetConfirmMsg =>
      'Se borrarán todos los stickers escaneados. Esta acción no se puede deshacer.';

  @override
  String get lookupScannerResetConfirmBtn => 'Reiniciar';

  @override
  String get lookupScannerEmptyHint => 'Apunta la cámara a los stickers';

  @override
  String lookupScannerMissingSection(Object count) {
    return 'Me faltan ($count)';
  }

  @override
  String lookupScannerAddSelected(Object count) {
    return 'Agregar $count';
  }

  @override
  String lookupScannerDuplicatesSection(Object count) {
    return 'Repetidos ($count)';
  }

  @override
  String get lookupTutorialStep1Title => 'Zwei Suchmethoden';

  @override
  String get lookupTutorialStep1Body =>
      'Nutze den Tab \"Manuell\" zum Eingeben des Sticker-Codes oder den Tab \"Scanner\" zum direkten Scannen.';

  @override
  String get lookupTutorialStep2Title => 'Code eingeben';

  @override
  String get lookupTutorialStep2Body =>
      'Gib den Sticker-Code ein, wie er im Album erscheint, z.B. ECU 10 oder ARG 5, und tippe auf Suchen.';

  @override
  String get lookupTutorialStep3Title => 'Prüfen und verwalten';

  @override
  String get lookupTutorialStep3Body =>
      'Du siehst ob der Sticker fehlt oder schon vorhanden ist. Mit + und – kannst du dein Inventar sofort aktualisieren.';
}
