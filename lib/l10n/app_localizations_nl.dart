// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appTitle => 'Album 2026';

  @override
  String get authWelcomeTitle => 'Welkom bij Album 2026';

  @override
  String get authEmailLabel => 'E-mail';

  @override
  String get authPasswordLabel => 'Wachtwoord';

  @override
  String get authLoginButton => 'INLOGGEN';

  @override
  String get authContinueWith => 'Of ga verder met';

  @override
  String get authContinueGoogle => 'Ga verder met Google';

  @override
  String get authContinueApple => 'Ga verder met Apple';

  @override
  String get authContinueGuest => 'Ga verder als gast';

  @override
  String get authNoAccountRegister => 'Geen account? Registreer je';

  @override
  String get authForgotPassword => 'Wachtwoord vergeten?';

  @override
  String get authResetPasswordEnterEmail =>
      'Voer je e-mail in om je wachtwoord te herstellen.';

  @override
  String get authResetPasswordEmailSent =>
      'We hebben een e-mail gestuurd om je wachtwoord opnieuw in te stellen.';

  @override
  String get authGuestMigratedSuccess =>
      'Je gastvoortgang is succesvol overgedragen naar je nieuwe account! 🏆';

  @override
  String get authGuestRemotePreserved =>
      'Welkom terug! Je cloudcollectie is hersteld en de lokale gastvoortgang is verwijderd.';

  @override
  String commonErrorWithMessage(Object message) {
    return 'Fout: $message';
  }

  @override
  String get authErrorInvalidCredentials =>
      'Onjuist e-mailadres of wachtwoord. Controleer je gegevens en probeer het opnieuw.';

  @override
  String get authErrorEmailNotConfirmed =>
      'Je e-mail is nog niet bevestigd. Controleer je inbox.';

  @override
  String get authErrorUserAlreadyRegistered =>
      'Er bestaat al een account met dat e-mailadres.';

  @override
  String get authErrorWeakPassword =>
      'Het wachtwoord is te zwak. Gebruik minimaal 6 tekens.';

  @override
  String get authErrorInvalidEmail =>
      'Het formaat van het e-mailadres is ongeldig.';

  @override
  String get authErrorTokenExpired =>
      'De code is verlopen of ongeldig. Vraag een nieuwe aan.';

  @override
  String get authErrorRateLimit =>
      'Te veel pogingen. Wacht even voordat je het opnieuw probeert.';

  @override
  String get authErrorNetworkError =>
      'Geen verbinding. Controleer je netwerk en probeer het opnieuw.';

  @override
  String get authErrorSessionExpired =>
      'Je sessie is verlopen. Log opnieuw in.';

  @override
  String get authErrorUnknown =>
      'Er is een onverwachte fout opgetreden. Probeer het opnieuw.';

  @override
  String get registerTitle => 'Account aanmaken';

  @override
  String get registerFillAllFields => 'Vul alle velden in.';

  @override
  String get registerEmailsDontMatch => 'De e-mailadressen komen niet overeen.';

  @override
  String get registerPasswordsDontMatch =>
      'De wachtwoorden komen niet overeen.';

  @override
  String get registerPasswordMinLength =>
      'Het wachtwoord moet minimaal 6 tekens bevatten.';

  @override
  String get registerAccountCreated =>
      'Account succesvol aangemaakt! ⚽ Log in.';

  @override
  String get registerConfirmEmailLabel => 'E-mail bevestigen';

  @override
  String get registerConfirmPasswordLabel => 'Wachtwoord bevestigen';

  @override
  String get registerSubmitButton => 'REGISTREREN';

  @override
  String get profileTitle => 'Mijn profiel';

  @override
  String get profileOfficialCollector => 'Officiële verzamelaar 🌟';

  @override
  String get profileChangePasswordButton => 'Wachtwoord bijwerken';

  @override
  String get profileChangePasswordTitle => 'Wachtwoord bijwerken';

  @override
  String get profileNewPasswordLabel => 'Nieuw wachtwoord';

  @override
  String get profileConfirmNewPasswordLabel => 'Nieuw wachtwoord bevestigen';

  @override
  String get profilePasswordUpdatedSuccess =>
      'Wachtwoord succesvol bijgewerkt.';

  @override
  String get profileLogoutButton => 'Uitloggen';

  @override
  String get profileLogoutSuccess => 'Je bent succesvol uitgelogd.';

  @override
  String get profileUnknownUser => 'Onbekende gebruiker';

  @override
  String profileLogoutError(Object message) {
    return 'Fout bij uitloggen: $message';
  }

  @override
  String get homeTitle => 'Mijn Album 2026';

  @override
  String get homeProfileTooltip => 'Mijn profiel';

  @override
  String get drawerSignIn => 'Inloggen';

  @override
  String get homeShareAll => 'Volledige lijst delen';

  @override
  String get homeShareMissingOnly => 'Alleen ontbrekende';

  @override
  String get homeShareDuplicatesOnly => 'Alleen duplicaten';

  @override
  String get homeGlobalProgressTitle => 'Algemene voortgang';

  @override
  String homeCollectedCount(Object collected, Object total) {
    return '$collected van $total verzameld';
  }

  @override
  String get homeViewFullCollection => 'Volledige collectie bekijken';

  @override
  String get homeTeamsTitle => 'Teams';

  @override
  String get homeSearchTeamsHint => 'Zoek op land of team...';

  @override
  String get homeNoResults => 'Geen teams gevonden';

  @override
  String get homeScanButton => 'Sticker scannen';

  @override
  String homeObtainedCount(Object collected, Object total) {
    return '$collected van $total verkregen';
  }

  @override
  String get homeProgressError => 'Fout';

  @override
  String get globalCollectionTitle => 'Volledige collectie';

  @override
  String get filterAll => 'Alles';

  @override
  String get filterMissing => 'Ontbrekende';

  @override
  String get filterDuplicates => 'Duplicaten';

  @override
  String get filterSearchHint => 'Zoek op land, code of nummer...';

  @override
  String get stickerRemoveTitle => 'Sticker verwijderen?';

  @override
  String stickerRemoveConfirm(Object stickerLabel) {
    return 'Weet je zeker dat je sticker $stickerLabel uit je album wilt verwijderen?';
  }

  @override
  String get commonCancel => 'Annuleren';

  @override
  String get commonRemove => 'Verwijderen';

  @override
  String get commonDone => 'KLAAR';

  @override
  String get gridNoResults => 'Geen stickers gevonden.';

  @override
  String scannerViewScannedButton(Object count) {
    return '$count gescande stickers bekijken';
  }

  @override
  String get scannerOverlayHint => 'Centreer de achterkant van de sticker hier';

  @override
  String get pendingScansTitle => 'Gescande stickers';

  @override
  String get pendingScansEmpty => 'Je hebt nog geen stickers gescand';

  @override
  String pendingScansItemLabel(Object code) {
    return 'Sticker: $code';
  }

  @override
  String pendingScansSavedSuccess(Object count) {
    return '$count stickers toegevoegd aan je album! 🏆';
  }

  @override
  String pendingScansSaveError(Object message) {
    return 'Fout bij opslaan: $message';
  }

  @override
  String get shareHeader => '⚽ *RUILLIJST Album 2026* 🏆';

  @override
  String get shareMissingSectionTitle => '❌ *ONTBREKEND:*';

  @override
  String get shareDuplicatesSectionTitle => '🔁 *DUPLICATEN:*';

  @override
  String get shareNoneMissing => 'Geen! 😎';

  @override
  String get shareNoDuplicates => 'Geen duplicaten 😅';

  @override
  String get shareLetsTrade => 'Wil je ruilen? 👀🔥';

  @override
  String get shareSeparator => '--------------------------';

  @override
  String get forgotPasswordTitle => 'Account herstellen';

  @override
  String get forgotPasswordDescription =>
      'Voer je e-mail in en we sturen je een 6-cijferige code om je wachtwoord opnieuw in te stellen.';

  @override
  String get forgotPasswordEmailLabel => 'E-mail';

  @override
  String get forgotPasswordEmptyEmailError => 'Voer je e-mailadres in.';

  @override
  String get forgotPasswordCodeSentSuccess =>
      'Code verzonden. Controleer je inbox.';

  @override
  String get forgotPasswordSendCodeButton => 'CODE VERZENDEN';

  @override
  String forgotPasswordStep2Description(Object email) {
    return 'Voer de code in die we naar $email hebben gestuurd en je nieuwe wachtwoord.';
  }

  @override
  String get forgotPasswordCodeInputLabel => '8-cijferige code';

  @override
  String get forgotPasswordInvalidCodeError =>
      'De code moet precies 6 cijfers hebben.';

  @override
  String get forgotPasswordNewPasswordLabel => 'Nieuw wachtwoord';

  @override
  String get forgotPasswordShortPasswordError =>
      'Het wachtwoord moet minimaal 6 tekens bevatten.';

  @override
  String get forgotPasswordSavePasswordButton => 'WACHTWOORD OPSLAAN';

  @override
  String get forgotPasswordPasswordUpdatedSuccess =>
      'Wachtwoord succesvol bijgewerkt! 🏆';

  @override
  String get validationEmailInvalid => 'Het e-mailadres is ongeldig.';

  @override
  String get paywallTitle => 'Geniet zonder advertenties';

  @override
  String get paywallSubtitle =>
      'Alle functies zijn gratis beschikbaar. Met Pro geniet je van alles zonder onderbrekingen.';

  @override
  String get paywallBenefitScanner =>
      'Scanner zonder interstitiële advertenties';

  @override
  String get paywallBenefitNoAds => 'Geen advertenties';

  @override
  String get paywallBenefitSync => 'Cloudsynchronisatie inbegrepen';

  @override
  String paywallSubscribeButton(Object price) {
    return 'Abonneren · $price';
  }

  @override
  String get paywallPackageMonthly => 'Maandelijks';

  @override
  String get paywallPackageAnnual => 'Jaarlijks';

  @override
  String get paywallPackageWeekly => 'Wekelijks';

  @override
  String get paywallPackageLifetime => 'Levenslang';

  @override
  String get paywallPackageTwoMonth => 'Elke 2 maanden';

  @override
  String get paywallPackageThreeMonth => 'Elke 3 maanden';

  @override
  String get paywallPackageSixMonth => 'Elke 6 maanden';

  @override
  String get paywallRestorePurchases => 'Aankopen herstellen';

  @override
  String get paywallCancelAnytime =>
      'Op elk moment opzeggen. Geen verplichtingen.';

  @override
  String get paywallLoadError =>
      'Kon plannen niet laden. Controleer je verbinding.';

  @override
  String get paywallRetry => 'Opnieuw proberen';

  @override
  String get paywallPurchaseError => 'Aankoop mislukt. Probeer het opnieuw.';

  @override
  String get paywallRestoreError =>
      'Kon aankopen niet herstellen. Probeer het opnieuw.';

  @override
  String get paywallGuestTitle => 'Log in om te abonneren';

  @override
  String get paywallGuestBody =>
      'Pro is gekoppeld aan je account. Log in of maak een account aan om alle functies te ontgrendelen.';

  @override
  String get paywallGuestSignInButton => 'INLOGGEN';

  @override
  String scannerDemoRemaining(Object count) {
    return '$count gratis scans resterend';
  }

  @override
  String get scannerDemoFinishedTitle => 'Je hebt je 5 gratis scans gebruikt';

  @override
  String get scannerDemoFinishedSubtitle =>
      'Abonneer je om onbeperkt stickers te scannen en een advertentievrije ervaring te hebben.';

  @override
  String get scannerDemoUnlockButton => 'Pro-plannen bekijken';

  @override
  String get adDialogTitle => 'Gratis content';

  @override
  String get adDialogBody =>
      'Om door te gaan, bekijk een korte advertentie of abonneer je op Pro en vergeet advertenties voor altijd.';

  @override
  String get adDialogWatchAd => 'Advertentie bekijken';

  @override
  String get adDialogGetPro => 'Pro halen';

  @override
  String get adDialogNotNow => 'Niet nu';

  @override
  String get scannerCameraInitError =>
      'Kon de camera niet initialiseren. Zorg ervoor dat de app cameratoegang heeft.';

  @override
  String get variantSheetTitle => 'Albumvariant';

  @override
  String get variantSheetInventoryNote =>
      'Uw inventaris blijft behouden bij het wisselen van variant. De stickers die u al heeft, blijven geregistreerd.';

  @override
  String variantSheetLoadError(Object error) {
    return 'Fout bij het laden van varianten: $error';
  }

  @override
  String get variantSheetEmpty => 'Geen varianten beschikbaar voor dit album.';

  @override
  String get variantSheetDefaultLabel => 'Standaardvariant';

  @override
  String get variantMandatoryTitle => 'Kies je regio';

  @override
  String get variantMandatorySubtitle =>
      'Selecteer de albumversie voor jouw regio.';

  @override
  String variantChangedSuccess(Object name) {
    return 'Variant gewijzigd naar $name ✅';
  }

  @override
  String get profileDeleteAccountButton => 'Account verwijderen';

  @override
  String get profileDeleteAccountTitle => 'Je account verwijderen?';

  @override
  String get profileDeleteAccountMessage =>
      'Deze actie is permanent. Al je gegevens worden verwijderd en je kunt je collectie niet terugkrijgen.';

  @override
  String get profileDeleteAccountConfirmButton => 'Definitief verwijderen';

  @override
  String get profileDeleteAccountSuccess => 'Je account is verwijderd.';

  @override
  String get profileDeleteAccountError =>
      'Fout bij het verwijderen van het account. Probeer het opnieuw.';

  @override
  String get paywallPrivacyPolicy => 'Privacybeleid';

  @override
  String get paywallTermsOfUse => 'Gebruiksvoorwaarden';

  @override
  String get paywallLegalDisclaimer =>
      'Door te abonneren ga je akkoord met onze Gebruiksvoorwaarden en ons Privacybeleid.';

  @override
  String get tutorialSkip => 'Overslaan';

  @override
  String get tutorialTapToContinue => 'Tik ergens om door te gaan';

  @override
  String get tutorialStep1Title => 'Je globale voortgang';

  @override
  String get tutorialStep1Body =>
      'Zie hoeveel stickers je hebt verzameld. Blijf verzamelen!';

  @override
  String get tutorialStep2Title => 'Teams zoeken';

  @override
  String get tutorialStep2Body =>
      'Typ een land- of teamnaam om de lijst direct te filteren.';

  @override
  String get tutorialStep3Title => 'Hoofdmenu';

  @override
  String get tutorialStep3Body =>
      'Ga naar je profiel en wissel van albumvariant.';

  @override
  String get tutorialStep4Title => 'Stickers scannen';

  @override
  String get tutorialStep4Body =>
      'Gebruik de camera om stickers te scannen en automatisch toe te voegen.';

  @override
  String get tutorialStep5Title => 'Lijst delen';

  @override
  String get tutorialStep5Body =>
      'Exporteer je lijst met ontbrekende of dubbele stickers om te ruilen.';

  @override
  String get globalTutorialStep1Title => 'Verzameling filteren';

  @override
  String get globalTutorialStep1Body =>
      'Gebruik deze knoppen om alle stickers, alleen de ontbrekende of alleen de dubbele te zien. Perfect om ruilhandel te organiseren!';

  @override
  String get globalTutorialStep2Title => 'Zoek een sticker';

  @override
  String get globalTutorialStep2Body =>
      'Typ de landnaam, de code of het stickernummer om deze snel te vinden.';

  @override
  String get globalTutorialStep3Title => 'Tikken om te markeren';

  @override
  String get globalTutorialStep3Body =>
      'Eén tik op een grijze sticker voegt hem toe aan je album (wordt goud). Als je opnieuw tikt, wordt om bevestiging gevraagd om hem te verwijderen.';

  @override
  String get globalTutorialStep4Title => 'Lang indrukken voor meer opties';

  @override
  String get globalTutorialStep4Body =>
      'Houd een sticker ingedrukt om te beheren hoeveel exemplaren je hebt van elke variant (Normal, Gold, Legend...).';

  @override
  String get tutorialStep6Title => 'Verken een categorie';

  @override
  String get tutorialStep6Body =>
      'Tik op een land of team om zijn stickers te zien. Daar kun je de stickers die je al hebt markeren en je dubbele beheren.';

  @override
  String get categoryTutorialStep1Title => 'Stickers filteren';

  @override
  String get categoryTutorialStep1Body =>
      'Gebruik deze knoppen om alle stickers, alleen ontbrekende of alleen dubbele stickers te zien.';

  @override
  String get categoryTutorialStep2Title => 'Zoek een sticker';

  @override
  String get categoryTutorialStep2Body =>
      'Typ de naam van het land, de code of het nummer van de sticker om hem snel te vinden.';

  @override
  String get categoryTutorialStep3Title => 'Tik om te markeren';

  @override
  String get categoryTutorialStep3Body =>
      'Tikken op een grijze sticker voegt hem toe aan je album (wordt goud). Als je hem al hebt en opnieuw tikt, wordt je gevraagd om de verwijdering te bevestigen.';

  @override
  String get categoryTutorialStep4Title => 'Lang indrukken voor meer opties';

  @override
  String get categoryTutorialStep4Body =>
      'Lang indrukken van een sticker laat je beheren hoeveel exemplaren je hebt van elke variant (Normal, Gold, Legend).';

  @override
  String get drawerReplayTutorial => 'Tutorial opnieuw bekijken';

  @override
  String get variantTutorialTitle => 'Selecteer je regio';

  @override
  String get variantTutorialBody =>
      'Kies de albumvariant die overeenkomt met jouw land of regio. Dit bepaalt welke stickers en varianten (Normal, Gold, Legend) in jouw collectie verschijnen.';

  @override
  String get drawerLegalNotice => 'Juridische Kennisgeving';

  @override
  String get legalNoticeTitle => 'Juridische Kennisgeving';

  @override
  String get legalNoticeBody =>
      'Deze applicatie is een niet-officiële fan-creatie en is niet gelieerd aan, goedgekeurd door of verbonden met enige officiële voetbalorganisatie, stickerproducent of officiële partner van het voetbaltoernooi. Alle handelsmerken zijn eigendom van hun respectieve eigenaren.';

  @override
  String get statsTitle => 'Statistieken';

  @override
  String get statsTotalLabel => 'Totaal';

  @override
  String get statsCollectedLabel => 'Verzameld';

  @override
  String get statsDuplicateCopiesLabel => 'Duplicaten';

  @override
  String get statsCategoriesTitle => 'Per categorie';

  @override
  String get statsAllCategories => 'Alle';

  @override
  String get statsNoStatsYet => 'Nog geen gegevens. Begin met verzamelen!';

  @override
  String get statsBestCategory => 'Meeste voortgang';

  @override
  String get statsWorstCategory => 'Minste voortgang';

  @override
  String get statsCompletedCategories => 'Voltooid';

  @override
  String get drawerStats => 'Statistieken';

  @override
  String get statsCategoryPickerSearch => 'Categorie zoeken...';

  @override
  String statsCategoryPickerSelected(Object count) {
    return '$count geselecteerd';
  }

  @override
  String get statsCategoryPickerAll => 'Alle categorieën';

  @override
  String get statsCategoryPickerClear => 'Wissen';

  @override
  String get statsSortTooltip => 'Sorteren';

  @override
  String get statsSortByName => 'Categorie';

  @override
  String get statsSortByProgressDesc => 'Meeste voortgang eerst';

  @override
  String get statsSortByProgressAsc => 'Minste voortgang eerst';

  @override
  String get statsSortByMissing => 'Meest ontbrekend eerst';

  @override
  String get statsSortByDuplicates => 'Meeste duplicaten eerst';

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
  String get drawerLookup => 'Sticker opzoeken';

  @override
  String get physicalExchangeVirtualBtn => 'Intercambio Virtual';

  @override
  String get lookupScreenTitle => 'Sticker opzoeken';

  @override
  String get lookupTabManual => 'Handmatig';

  @override
  String get lookupTabScanner => 'Scanner';

  @override
  String get lookupSearchHint => 'Bijv.: ECU 10, ARG 5, FRA 1...';

  @override
  String get lookupSearchButton => 'Zoeken';

  @override
  String get lookupStickerNotFound => 'Geen sticker gevonden met die code.';

  @override
  String get lookupStatusMissing => 'Ontbreekt';

  @override
  String get lookupStatusCollected => 'Je hebt hem al ✓';

  @override
  String lookupStatusDuplicates(Object count) {
    return '$count duplicaat/dubbel 🔁';
  }

  @override
  String get lookupQtyLabel => 'Aantal in jouw inventaris';

  @override
  String get lookupScannerHint => 'Centreer de sticker om hem te herkennen';

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
  String get lookupTutorialStep1Title => 'Twee zoekmanieren';

  @override
  String get lookupTutorialStep1Body =>
      'Gebruik het tabblad Handmatig om de stickercode in te voeren of het tabblad Scanner om de camera te richten.';

  @override
  String get lookupTutorialStep2Title => 'Voer de code in';

  @override
  String get lookupTutorialStep2Body =>
      'Typ de stickercode zoals die in het album staat, bijv. ECU 10 of ARG 5, en tik op Zoeken.';

  @override
  String get lookupTutorialStep3Title => 'Controleer en beheer';

  @override
  String get lookupTutorialStep3Body =>
      'Je ziet of de sticker ontbreekt of al in je bezit is. Met + en – kun je je inventaris direct bijwerken.';
}
