// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Album 26';

  @override
  String get authWelcomeTitle => 'Benvenuto su Album 26';

  @override
  String get authEmailLabel => 'Email';

  @override
  String get authPasswordLabel => 'Password';

  @override
  String get authLoginButton => 'ACCEDI';

  @override
  String get authContinueWith => 'Oppure continua con';

  @override
  String get authContinueGoogle => 'Continua con Google';

  @override
  String get authContinueApple => 'Continua con Apple';

  @override
  String get authContinueGuest => 'Continua come ospite';

  @override
  String get authNoAccountRegister => 'Non hai un account? Registrati';

  @override
  String get authForgotPassword => 'Hai dimenticato la password?';

  @override
  String get authResetPasswordEnterEmail =>
      'Inserisci la tua email per recuperare la password.';

  @override
  String get authResetPasswordEmailSent =>
      'Ti abbiamo inviato un\'email per reimpostare la password.';

  @override
  String get authGuestMigratedSuccess =>
      'I tuoi progressi come ospite sono stati trasferiti con successo al tuo nuovo account! 🏆';

  @override
  String get authGuestRemotePreserved =>
      'Bentornato! La tua collezione cloud è stata ripristinata e i progressi locali sono stati scartati.';

  @override
  String commonErrorWithMessage(Object message) {
    return 'Errore: $message';
  }

  @override
  String get authErrorInvalidCredentials =>
      'Email o password errati. Verifica i tuoi dati e riprova.';

  @override
  String get authErrorEmailNotConfirmed =>
      'La tua email non è ancora stata confermata. Controlla la tua casella di posta.';

  @override
  String get authErrorUserAlreadyRegistered =>
      'Esiste già un account con questa email.';

  @override
  String get authErrorWeakPassword =>
      'La password è troppo debole. Usa almeno 6 caratteri.';

  @override
  String get authErrorInvalidEmail =>
      'Il formato dell\'indirizzo email non è valido.';

  @override
  String get authErrorTokenExpired =>
      'Il codice è scaduto o non è valido. Richiedine uno nuovo.';

  @override
  String get authErrorRateLimit =>
      'Troppi tentativi. Attendi un momento prima di riprovare.';

  @override
  String get authErrorNetworkError =>
      'Nessuna connessione. Controlla la rete e riprova.';

  @override
  String get authErrorSessionExpired =>
      'La tua sessione è scaduta. Accedi di nuovo.';

  @override
  String get authErrorUnknown =>
      'Si è verificato un errore imprevisto. Riprova.';

  @override
  String get registerTitle => 'Crea Account';

  @override
  String get registerFillAllFields => 'Compila tutti i campi.';

  @override
  String get registerEmailsDontMatch => 'Le email non corrispondono.';

  @override
  String get registerPasswordsDontMatch => 'Le password non corrispondono.';

  @override
  String get registerPasswordMinLength =>
      'La password deve contenere almeno 6 caratteri.';

  @override
  String get registerAccountCreated =>
      'Account creato con successo! ⚽ Accedi ora.';

  @override
  String get registerConfirmEmailLabel => 'Conferma email';

  @override
  String get registerConfirmPasswordLabel => 'Conferma password';

  @override
  String get registerSubmitButton => 'REGISTRATI';

  @override
  String get profileTitle => 'Il Mio Profilo';

  @override
  String get profileOfficialCollector => 'Collezionista Ufficiale 🌟';

  @override
  String get profileChangePasswordButton => 'Aggiorna password';

  @override
  String get profileChangePasswordTitle => 'Aggiorna password';

  @override
  String get profileNewPasswordLabel => 'Nuova password';

  @override
  String get profileConfirmNewPasswordLabel => 'Conferma nuova password';

  @override
  String get profilePasswordUpdatedSuccess =>
      'Password aggiornata con successo.';

  @override
  String get profileLogoutButton => 'Esci';

  @override
  String get profileLogoutSuccess => 'Hai effettuato il logout con successo.';

  @override
  String get profileUnknownUser => 'Utente sconosciuto';

  @override
  String profileLogoutError(Object message) {
    return 'Errore durante il logout: $message';
  }

  @override
  String get homeTitle => 'Il Mio Album 26';

  @override
  String get homeProfileTooltip => 'Il Mio Profilo';

  @override
  String get drawerSignIn => 'Accedi';

  @override
  String get homeShareAll => 'Condividi Lista Completa';

  @override
  String get homeShareMissingOnly => 'Solo Mancanti';

  @override
  String get homeShareDuplicatesOnly => 'Solo Doppioni';

  @override
  String get homeGlobalProgressTitle => 'Progresso Globale';

  @override
  String homeCollectedCount(Object collected, Object total) {
    return '$collected di $total raccolte';
  }

  @override
  String get homeViewFullCollection => 'Vedi Collezione Completa';

  @override
  String get homeTeamsTitle => 'Squadre';

  @override
  String get homeSearchTeamsHint => 'Cerca per paese o squadra...';

  @override
  String get homeNoResults => 'Nessuna squadra trovata';

  @override
  String get homeScanButton => 'Scansiona Figurina';

  @override
  String homeObtainedCount(Object collected, Object total) {
    return '$collected di $total ottenute';
  }

  @override
  String get homeProgressError => 'Errore';

  @override
  String get globalCollectionTitle => 'Collezione Completa';

  @override
  String get filterAll => 'Tutte';

  @override
  String get filterMissing => 'Mancanti';

  @override
  String get filterDuplicates => 'Doppioni';

  @override
  String get filterSearchHint => 'Cerca per paese, codice o numero...';

  @override
  String get stickerRemoveTitle => 'Rimuovere figurina?';

  @override
  String stickerRemoveConfirm(Object stickerLabel) {
    return 'Sei sicuro di voler rimuovere la figurina $stickerLabel dal tuo album?';
  }

  @override
  String get commonCancel => 'Annulla';

  @override
  String get commonRemove => 'Rimuovi';

  @override
  String get commonDone => 'FATTO';

  @override
  String get gridNoResults => 'Nessuna figurina trovata.';

  @override
  String scannerViewScannedButton(Object count) {
    return 'Rivedi $count figurine scansionate';
  }

  @override
  String get scannerOverlayHint => 'Centra il retro della figurina qui';

  @override
  String get pendingScansTitle => 'Figurine Scansionate';

  @override
  String get pendingScansEmpty => 'Non hai ancora scansionato nessuna figurina';

  @override
  String pendingScansItemLabel(Object code) {
    return 'Figurina: $code';
  }

  @override
  String pendingScansSavedSuccess(Object count) {
    return '$count figurine aggiunte al tuo album! 🏆';
  }

  @override
  String pendingScansSaveError(Object message) {
    return 'Errore durante il salvataggio: $message';
  }

  @override
  String get shareHeader => '⚽ *LISTA SCAMBI ALBUM 26* 🏆';

  @override
  String get shareMissingSectionTitle => '❌ *MANCANTI:*';

  @override
  String get shareDuplicatesSectionTitle => '🔁 *DOPPIONI:*';

  @override
  String get shareNoneMissing => 'Nessuno! 😎';

  @override
  String get shareNoDuplicates => 'Nessun doppione 😅';

  @override
  String get shareLetsTrade => 'Vuoi scambiare? 👀🔥';

  @override
  String get shareSeparator => '--------------------------';

  @override
  String get forgotPasswordTitle => 'Recupera Account';

  @override
  String get forgotPasswordDescription =>
      'Inserisci la tua email e ti invieremo un codice di 6 cifre per reimpostare la password.';

  @override
  String get forgotPasswordEmailLabel => 'Email';

  @override
  String get forgotPasswordEmptyEmailError => 'Inserisci la tua email.';

  @override
  String get forgotPasswordCodeSentSuccess =>
      'Codice inviato. Controlla la tua casella di posta.';

  @override
  String get forgotPasswordSendCodeButton => 'INVIA CODICE';

  @override
  String forgotPasswordStep2Description(Object email) {
    return 'Inserisci il codice che abbiamo inviato a $email e la tua nuova password.';
  }

  @override
  String get forgotPasswordCodeInputLabel => 'Codice a 8 cifre';

  @override
  String get forgotPasswordInvalidCodeError =>
      'Il codice deve avere esattamente 6 cifre.';

  @override
  String get forgotPasswordNewPasswordLabel => 'Nuova Password';

  @override
  String get forgotPasswordShortPasswordError =>
      'La password deve contenere almeno 6 caratteri.';

  @override
  String get forgotPasswordSavePasswordButton => 'SALVA PASSWORD';

  @override
  String get forgotPasswordPasswordUpdatedSuccess =>
      'Password aggiornata con successo! 🏆';

  @override
  String get validationEmailInvalid => 'L\'indirizzo email non è valido.';

  @override
  String get paywallTitle => 'Goditi l\'app senza pubblicità';

  @override
  String get paywallSubtitle =>
      'Tutte le funzioni sono gratuite. Con Pro godi di tutto senza interruzioni.';

  @override
  String get paywallBenefitScanner => 'Scanner senza annunci interstitial';

  @override
  String get paywallBenefitNoAds => 'Nessuna pubblicità';

  @override
  String get paywallBenefitSync => 'Sincronizzazione cloud inclusa';

  @override
  String paywallSubscribeButton(Object price) {
    return 'Abbonati · $price';
  }

  @override
  String get paywallPackageMonthly => 'Mensile';

  @override
  String get paywallPackageAnnual => 'Annuale';

  @override
  String get paywallPackageWeekly => 'Settimanale';

  @override
  String get paywallPackageLifetime => 'A vita';

  @override
  String get paywallPackageTwoMonth => 'Ogni 2 mesi';

  @override
  String get paywallPackageThreeMonth => 'Ogni 3 mesi';

  @override
  String get paywallPackageSixMonth => 'Ogni 6 mesi';

  @override
  String get paywallRestorePurchases => 'Ripristina acquisti';

  @override
  String get paywallCancelAnytime => 'Annulla quando vuoi. Nessun impegno.';

  @override
  String get paywallLoadError =>
      'Impossibile caricare i piani. Controlla la connessione.';

  @override
  String get paywallRetry => 'Riprova';

  @override
  String get paywallPurchaseError => 'Acquisto non riuscito. Riprova.';

  @override
  String get paywallRestoreError =>
      'Impossibile ripristinare gli acquisti. Riprova.';

  @override
  String get paywallGuestTitle => 'Accedi per abbonarti';

  @override
  String get paywallGuestBody =>
      'Pro è collegato al tuo account. Accedi o crea un account per sbloccare tutte le funzioni.';

  @override
  String get paywallGuestSignInButton => 'ACCEDI';

  @override
  String scannerDemoRemaining(Object count) {
    return '$count scansioni gratuite rimanenti';
  }

  @override
  String get scannerDemoFinishedTitle =>
      'Hai usato le tue 5 scansioni gratuite';

  @override
  String get scannerDemoFinishedSubtitle =>
      'Abbonati per scansionare figurine illimitate e vivere un\'esperienza senza pubblicità.';

  @override
  String get scannerDemoUnlockButton => 'Vedi Piani Pro';

  @override
  String get adDialogTitle => 'Contenuto gratuito';

  @override
  String get adDialogBody =>
      'Per continuare, guarda un breve annuncio o abbonati a Pro e dimentica la pubblicità per sempre.';

  @override
  String get adDialogWatchAd => 'Guarda annuncio';

  @override
  String get adDialogGetPro => 'Ottieni Pro';

  @override
  String get adDialogNotNow => 'Non ora';

  @override
  String get scannerCameraInitError =>
      'Impossibile inizializzare la fotocamera. Assicurati che l\'app abbia il permesso di accedere alla fotocamera.';

  @override
  String get variantSheetTitle => 'Variante dell\'album';

  @override
  String get variantSheetInventoryNote =>
      'Il tuo inventario viene conservato quando cambi variante. Le figurine che hai già continuano ad essere registrate.';

  @override
  String variantSheetLoadError(Object error) {
    return 'Errore nel caricamento delle varianti: $error';
  }

  @override
  String get variantSheetEmpty =>
      'Nessuna variante disponibile per questo album.';

  @override
  String get variantSheetDefaultLabel => 'Variante predefinita';

  @override
  String get variantMandatoryTitle => 'Scegli la tua regione';

  @override
  String get variantMandatorySubtitle =>
      'Seleziona la versione dell\'album per la tua regione.';

  @override
  String variantChangedSuccess(Object name) {
    return 'Variante cambiata in $name ✅';
  }

  @override
  String get profileDeleteAccountButton => 'Elimina account';

  @override
  String get profileDeleteAccountTitle => 'Eliminare il tuo account?';

  @override
  String get profileDeleteAccountMessage =>
      'Questa azione è permanente. Tutti i tuoi dati verranno eliminati e non potrai recuperare la tua collezione.';

  @override
  String get profileDeleteAccountConfirmButton => 'Elimina definitivamente';

  @override
  String get profileDeleteAccountSuccess => 'Il tuo account è stato eliminato.';

  @override
  String get profileDeleteAccountError =>
      'Errore durante l\'eliminazione dell\'account. Riprova.';

  @override
  String get paywallPrivacyPolicy => 'Informativa sulla privacy';

  @override
  String get paywallTermsOfUse => 'Termini di utilizzo';

  @override
  String get paywallLegalDisclaimer =>
      'Abbonandoti accetti i nostri Termini di utilizzo e la nostra Informativa sulla privacy.';

  @override
  String get tutorialSkip => 'Salta';

  @override
  String get tutorialTapToContinue => 'Tocca ovunque per continuare';

  @override
  String get tutorialStep1Title => 'Il tuo progresso globale';

  @override
  String get tutorialStep1Body =>
      'Vedi quante figurine hai collezionato. Continua!';

  @override
  String get tutorialStep2Title => 'Cerca squadre';

  @override
  String get tutorialStep2Body =>
      'Digita il nome di un paese o squadra per filtrare la lista.';

  @override
  String get tutorialStep3Title => 'Menu principale';

  @override
  String get tutorialStep3Body =>
      'Accedi al tuo profilo e cambia la variante dell\'album.';

  @override
  String get tutorialStep4Title => 'Scansiona figurine';

  @override
  String get tutorialStep4Body =>
      'Usa la fotocamera per scansionare figurine fisiche e aggiungerle automaticamente.';

  @override
  String get tutorialStep5Title => 'Condividi la lista';

  @override
  String get tutorialStep5Body =>
      'Esporta la tua lista di figurine mancanti o duplicate per scambiarle.';

  @override
  String get globalTutorialStep1Title => 'Filtra la tua raccolta';

  @override
  String get globalTutorialStep1Body =>
      'Usa questi pulsanti per vedere tutte le tue figurine, solo quelle mancanti o solo i doppioni. Perfetto per organizzare gli scambi!';

  @override
  String get globalTutorialStep2Title => 'Cerca una figurina';

  @override
  String get globalTutorialStep2Body =>
      'Digita il nome del paese, il codice o il numero della figurina per trovarla rapidamente.';

  @override
  String get globalTutorialStep3Title => 'Tocca per segnare';

  @override
  String get globalTutorialStep3Body =>
      'Un tocco su una figurina grigia la aggiunge al tuo album (diventa dorata). Se la tocchi di nuovo, ti verrà chiesta conferma per rimuoverla.';

  @override
  String get globalTutorialStep4Title => 'Premi a lungo per più opzioni';

  @override
  String get globalTutorialStep4Body =>
      'Tieni premuta una figurina per gestire quante copie hai di ogni variante (Normal, Gold, Legend...).';

  @override
  String get tutorialStep6Title => 'Esplora una categoria';

  @override
  String get tutorialStep6Body =>
      'Tocca un paese o una squadra per vedere le sue figurine. Li puoi segnare quelle che hai gia e gestire i duplicati.';

  @override
  String get categoryTutorialStep1Title => 'Filtra le figurine';

  @override
  String get categoryTutorialStep1Body =>
      'Usa questi pulsanti per vedere tutte le figurine, solo quelle mancanti o solo i doppioni.';

  @override
  String get categoryTutorialStep2Title => 'Cerca una figurina';

  @override
  String get categoryTutorialStep2Body =>
      'Digita il nome del paese, il codice o il numero della figurina per trovarla rapidamente.';

  @override
  String get categoryTutorialStep3Title => 'Tocca per segnare';

  @override
  String get categoryTutorialStep3Body =>
      'Toccare una figurina grigia la aggiunge all album (diventa dorata). Se ce l hai gia e tocchi di nuovo, ti verra chiesta conferma per rimuoverla.';

  @override
  String get categoryTutorialStep4Title => 'Tieni premuto per piu opzioni';

  @override
  String get categoryTutorialStep4Body =>
      'Tenere premuta una figurina permette di gestire quante copie hai di ogni variante (Normal, Gold, Legend).';

  @override
  String get drawerReplayTutorial => 'Rivedere il tutorial';
}
