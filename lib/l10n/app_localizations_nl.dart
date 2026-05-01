// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appTitle => 'Album 26';

  @override
  String get authWelcomeTitle => 'Welkom bij Album 26';

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
  String get homeTitle => 'Mijn Album 26';

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
  String get shareHeader => '⚽ *RUILLIJST ALBUM 26* 🏆';

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
}
