// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Album 2026';

  @override
  String get authWelcomeTitle => 'Benvenuto su Album 2026';

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
  String get homeTitle => 'Il Mio Album 2026';

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
  String get shareHeader => '⚽ *LISTA SCAMBI Album 2026* 🏆';

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

  @override
  String get variantTutorialTitle => 'Seleziona la tua regione';

  @override
  String get variantTutorialBody =>
      'Scegli la variante dell\'album corrispondente al tuo paese o regione. Questo definisce quali figurine e varianti (Normal, Gold, Legend) appariranno nella tua collezione.';

  @override
  String get drawerLegalNotice => 'Note Legali';

  @override
  String get legalNoticeTitle => 'Note Legali';

  @override
  String get legalNoticeBody =>
      'Questa applicazione è una creazione non ufficiale di fan e non è affiliata, approvata o collegata a qualsiasi organizzazione calcistica ufficiale, produttore di figurine o partner ufficiale del torneo di calcio. Tutti i marchi registrati sono di proprietà dei rispettivi titolari.';

  @override
  String get statsTitle => 'Statistiche';

  @override
  String get statsTotalLabel => 'Totale';

  @override
  String get statsCollectedLabel => 'Raccolte';

  @override
  String get statsDuplicateCopiesLabel => 'Duplicati';

  @override
  String get statsCategoriesTitle => 'Per Categoria';

  @override
  String get statsAllCategories => 'Tutte';

  @override
  String get statsNoStatsYet => 'Nessun dato ancora. Inizia a collezionare!';

  @override
  String get statsBestCategory => 'Maggior progresso';

  @override
  String get statsWorstCategory => 'Minor progresso';

  @override
  String get statsCompletedCategories => 'Completate';

  @override
  String get drawerStats => 'Statistiche';

  @override
  String get statsCategoryPickerSearch => 'Cerca categoria...';

  @override
  String statsCategoryPickerSelected(Object count) {
    return '$count selezionate';
  }

  @override
  String get statsCategoryPickerAll => 'Tutte le categorie';

  @override
  String get statsCategoryPickerClear => 'Cancella';

  @override
  String get statsSortTooltip => 'Ordina';

  @override
  String get statsSortByName => 'Categoria';

  @override
  String get statsSortByProgressDesc => 'Maggior progresso prima';

  @override
  String get statsSortByProgressAsc => 'Minor progresso prima';

  @override
  String get statsSortByMissing => 'Più mancanti prima';

  @override
  String get statsSortByDuplicates => 'Più doppioni prima';

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
  String get drawerLookup => 'Cerca figurina';

  @override
  String get physicalExchangeVirtualBtn => 'Intercambio Virtual';

  @override
  String get lookupScreenTitle => 'Cerca figurina';

  @override
  String get lookupTabManual => 'Manuale';

  @override
  String get lookupTabScanner => 'Scanner';

  @override
  String get lookupSearchHint => 'Es.: ECU 10, ARG 5, FRA 1...';

  @override
  String get lookupSearchButton => 'Cerca';

  @override
  String get lookupStickerNotFound =>
      'Nessuna figurina trovata con quel codice.';

  @override
  String get lookupStatusMissing => 'Mancante';

  @override
  String get lookupStatusCollected => 'Ce l\'hai già ✓';

  @override
  String lookupStatusDuplicates(Object count) {
    return '$count doppione/i 🔁';
  }

  @override
  String get lookupQtyLabel => 'Quantità nel tuo inventario';

  @override
  String get lookupScannerHint => 'Centra la figurina per identificarla';

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
  String get lookupTutorialStep1Title => 'Due modi per cercare';

  @override
  String get lookupTutorialStep1Body =>
      'Usa la scheda Manuale per inserire il codice della figurina o la scheda Scanner per puntare la fotocamera.';

  @override
  String get lookupTutorialStep2Title => 'Inserisci il codice';

  @override
  String get lookupTutorialStep2Body =>
      'Digita il codice della figurina come appare nell\'album, es. ECU 10 o ARG 5, poi tocca Cerca.';

  @override
  String get lookupTutorialStep3Title => 'Consulta e gestisci';

  @override
  String get lookupTutorialStep3Body =>
      'Vedrai se la figurina manca o ce l\'hai già. Con i pulsanti + e – puoi aggiornare il tuo inventario all\'istante.';

  @override
  String get scanBadgeNew => 'Nuovo';

  @override
  String get scanBadgeRepeated => 'Duplicato';

  @override
  String get navAlbum => 'Album';

  @override
  String get navScanner => 'Scanner';
}
