// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'Album 26';

  @override
  String get authWelcomeTitle => 'Witaj w Albumie 26';

  @override
  String get authEmailLabel => 'E-mail';

  @override
  String get authPasswordLabel => 'Hasło';

  @override
  String get authLoginButton => 'ZALOGUJ SIĘ';

  @override
  String get authContinueWith => 'Lub kontynuuj z';

  @override
  String get authContinueGoogle => 'Kontynuuj z Google';

  @override
  String get authContinueApple => 'Kontynuuj z Apple';

  @override
  String get authContinueGuest => 'Kontynuuj jako gość';

  @override
  String get authNoAccountRegister => 'Nie masz konta? Zarejestruj się';

  @override
  String get authForgotPassword => 'Nie pamiętasz hasła?';

  @override
  String get authResetPasswordEnterEmail =>
      'Wpisz swój adres e-mail, aby odzyskać hasło.';

  @override
  String get authResetPasswordEmailSent =>
      'Wysłaliśmy Ci wiadomość e-mail do zresetowania hasła.';

  @override
  String get authGuestMigratedSuccess =>
      'Twój postęp jako gość został pomyślnie przeniesiony na nowe konto! 🏆';

  @override
  String get authGuestRemotePreserved =>
      'Witaj ponownie! Twoja kolekcja z chmury została przywrócona, a lokalny postęp gościa został odrzucony.';

  @override
  String commonErrorWithMessage(Object message) {
    return 'Błąd: $message';
  }

  @override
  String get authErrorInvalidCredentials =>
      'Nieprawidłowy adres e-mail lub hasło. Sprawdź dane i spróbuj ponownie.';

  @override
  String get authErrorEmailNotConfirmed =>
      'Twój adres e-mail nie został jeszcze potwierdzony. Sprawdź skrzynkę odbiorczą.';

  @override
  String get authErrorUserAlreadyRegistered =>
      'Konto z tym adresem e-mail już istnieje.';

  @override
  String get authErrorWeakPassword =>
      'Hasło jest zbyt słabe. Użyj co najmniej 6 znaków.';

  @override
  String get authErrorInvalidEmail =>
      'Format adresu e-mail jest nieprawidłowy.';

  @override
  String get authErrorTokenExpired =>
      'Kod wygasł lub jest nieważny. Poproś o nowy.';

  @override
  String get authErrorRateLimit =>
      'Zbyt wiele prób. Poczekaj chwilę przed ponowną próbą.';

  @override
  String get authErrorNetworkError =>
      'Brak połączenia. Sprawdź sieć i spróbuj ponownie.';

  @override
  String get authErrorSessionExpired =>
      'Twoja sesja wygasła. Zaloguj się ponownie.';

  @override
  String get authErrorUnknown =>
      'Wystąpił nieoczekiwany błąd. Spróbuj ponownie.';

  @override
  String get registerTitle => 'Utwórz konto';

  @override
  String get registerFillAllFields => 'Proszę wypełnić wszystkie pola.';

  @override
  String get registerEmailsDontMatch => 'Adresy e-mail nie są zgodne.';

  @override
  String get registerPasswordsDontMatch => 'Hasła nie są zgodne.';

  @override
  String get registerPasswordMinLength =>
      'Hasło musi mieć co najmniej 6 znaków.';

  @override
  String get registerAccountCreated =>
      'Konto zostało pomyślnie utworzone! ⚽ Zaloguj się.';

  @override
  String get registerConfirmEmailLabel => 'Potwierdź e-mail';

  @override
  String get registerConfirmPasswordLabel => 'Potwierdź hasło';

  @override
  String get registerSubmitButton => 'ZAREJESTRUJ SIĘ';

  @override
  String get profileTitle => 'Mój profil';

  @override
  String get profileOfficialCollector => 'Oficjalny kolekcjoner 🌟';

  @override
  String get profileChangePasswordButton => 'Zaktualizuj hasło';

  @override
  String get profileChangePasswordTitle => 'Zaktualizuj hasło';

  @override
  String get profileNewPasswordLabel => 'Nowe hasło';

  @override
  String get profileConfirmNewPasswordLabel => 'Potwierdź nowe hasło';

  @override
  String get profilePasswordUpdatedSuccess =>
      'Hasło zostało pomyślnie zaktualizowane.';

  @override
  String get profileLogoutButton => 'Wyloguj się';

  @override
  String get profileLogoutSuccess => 'Zostałeś pomyślnie wylogowany.';

  @override
  String get profileUnknownUser => 'Nieznany użytkownik';

  @override
  String profileLogoutError(Object message) {
    return 'Błąd podczas wylogowywania: $message';
  }

  @override
  String get homeTitle => 'Mój Album 26';

  @override
  String get homeProfileTooltip => 'Mój profil';

  @override
  String get homeShareAll => 'Udostępnij pełną listę';

  @override
  String get homeShareMissingOnly => 'Tylko brakujące';

  @override
  String get homeShareDuplicatesOnly => 'Tylko duplikaty';

  @override
  String get homeGlobalProgressTitle => 'Ogólny postęp';

  @override
  String homeCollectedCount(Object collected, Object total) {
    return '$collected z $total zebranych';
  }

  @override
  String get homeViewFullCollection => 'Zobacz pełną kolekcję';

  @override
  String get homeTeamsTitle => 'Drużyny';

  @override
  String get homeSearchTeamsHint => 'Szukaj po kraju lub drużynie...';

  @override
  String get homeNoResults => 'Nie znaleziono drużyn';

  @override
  String get homeScanButton => 'Skanuj naklejkę';

  @override
  String homeObtainedCount(Object collected, Object total) {
    return '$collected z $total uzyskanych';
  }

  @override
  String get homeProgressError => 'Błąd';

  @override
  String get globalCollectionTitle => 'Pełna kolekcja';

  @override
  String get filterAll => 'Wszystkie';

  @override
  String get filterMissing => 'Brakujące';

  @override
  String get filterDuplicates => 'Duplikaty';

  @override
  String get filterSearchHint => 'Szukaj po kraju, kodzie lub numerze...';

  @override
  String get stickerRemoveTitle => 'Usunąć naklejkę?';

  @override
  String stickerRemoveConfirm(Object stickerLabel) {
    return 'Czy na pewno chcesz usunąć naklejkę $stickerLabel ze swojego albumu?';
  }

  @override
  String get commonCancel => 'Anuluj';

  @override
  String get commonRemove => 'Usuń';

  @override
  String get commonDone => 'GOTOWE';

  @override
  String get gridNoResults => 'Nie znaleziono naklejek.';

  @override
  String scannerViewScannedButton(Object count) {
    return 'Przejrzyj $count zeskanowane naklejki';
  }

  @override
  String get scannerOverlayHint => 'Wyśrodkuj tylną część naklejki tutaj';

  @override
  String get pendingScansTitle => 'Zeskanowane naklejki';

  @override
  String get pendingScansEmpty => 'Nie zeskanowałeś jeszcze żadnej naklejki';

  @override
  String pendingScansItemLabel(Object code) {
    return 'Naklejka: $code';
  }

  @override
  String pendingScansSavedSuccess(Object count) {
    return '$count naklejek dodanych do Twojego albumu! 🏆';
  }

  @override
  String pendingScansSaveError(Object message) {
    return 'Błąd podczas zapisywania: $message';
  }

  @override
  String get shareHeader => '⚽ *LISTA WYMIAN ALBUM 26* 🏆';

  @override
  String get shareMissingSectionTitle => '❌ *BRAKUJĄCE:*';

  @override
  String get shareDuplicatesSectionTitle => '🔁 *DUPLIKATY:*';

  @override
  String get shareNoneMissing => 'Żadnych! 😎';

  @override
  String get shareNoDuplicates => 'Brak duplikatów 😅';

  @override
  String get shareLetsTrade => 'Chcesz się wymienić? 👀🔥';

  @override
  String get shareSeparator => '--------------------------';

  @override
  String get forgotPasswordTitle => 'Odzyskaj konto';

  @override
  String get forgotPasswordDescription =>
      'Podaj swój adres e-mail, a wyślemy Ci 6-cyfrowy kod do zresetowania hasła.';

  @override
  String get forgotPasswordEmailLabel => 'E-mail';

  @override
  String get forgotPasswordEmptyEmailError => 'Proszę wpisać adres e-mail.';

  @override
  String get forgotPasswordCodeSentSuccess =>
      'Kod wysłany. Sprawdź skrzynkę odbiorczą.';

  @override
  String get forgotPasswordSendCodeButton => 'WYŚLIJ KOD';

  @override
  String forgotPasswordStep2Description(Object email) {
    return 'Wpisz kod, który wysłaliśmy na $email i nowe hasło.';
  }

  @override
  String get forgotPasswordCodeInputLabel => '8-cyfrowy kod';

  @override
  String get forgotPasswordInvalidCodeError =>
      'Kod musi składać się z dokładnie 6 cyfr.';

  @override
  String get forgotPasswordNewPasswordLabel => 'Nowe hasło';

  @override
  String get forgotPasswordShortPasswordError =>
      'Hasło musi mieć co najmniej 6 znaków.';

  @override
  String get forgotPasswordSavePasswordButton => 'ZAPISZ HASŁO';

  @override
  String get forgotPasswordPasswordUpdatedSuccess =>
      'Hasło zostało pomyślnie zaktualizowane! 🏆';

  @override
  String get paywallTitle => 'Ciesz się bez reklam';

  @override
  String get paywallSubtitle =>
      'Wszystkie funkcje są dostępne bezpłatnie. Z Pro ciesz się wszystkim bez przerw.';

  @override
  String get paywallBenefitScanner => 'Skaner bez reklam pełnoekranowych';

  @override
  String get paywallBenefitNoAds => 'Bez reklam';

  @override
  String get paywallBenefitSync => 'Synchronizacja z chmurą w zestawie';

  @override
  String paywallSubscribeButton(Object price) {
    return 'Subskrybuj · $price';
  }

  @override
  String get paywallPackageMonthly => 'Miesięcznie';

  @override
  String get paywallPackageAnnual => 'Rocznie';

  @override
  String get paywallPackageWeekly => 'Tygodniowo';

  @override
  String get paywallPackageLifetime => 'Dożywotnio';

  @override
  String get paywallPackageTwoMonth => 'Co 2 miesiące';

  @override
  String get paywallPackageThreeMonth => 'Co 3 miesiące';

  @override
  String get paywallPackageSixMonth => 'Co 6 miesięcy';

  @override
  String get paywallRestorePurchases => 'Przywróć zakupy';

  @override
  String get paywallCancelAnytime =>
      'Anuluj w dowolnym momencie. Bez zobowiązań.';

  @override
  String get paywallLoadError =>
      'Nie można załadować planów. Sprawdź połączenie.';

  @override
  String get paywallRetry => 'Spróbuj ponownie';

  @override
  String get paywallPurchaseError => 'Zakup nie powiódł się. Spróbuj ponownie.';

  @override
  String get paywallRestoreError =>
      'Nie można przywrócić zakupów. Spróbuj ponownie.';

  @override
  String get paywallGuestTitle => 'Zaloguj się, aby subskrybować';

  @override
  String get paywallGuestBody =>
      'Pro jest powiązany z Twoim kontem. Zaloguj się lub utwórz konto, aby odblokować wszystkie funkcje.';

  @override
  String get paywallGuestSignInButton => 'ZALOGUJ SIĘ';

  @override
  String scannerDemoRemaining(Object count) {
    return 'Pozostało $count darmowych skanowań';
  }

  @override
  String get scannerDemoFinishedTitle =>
      'Wykorzystałeś swoje 5 darmowych skanowań';

  @override
  String get scannerDemoFinishedSubtitle =>
      'Subskrybuj, aby skanować nieograniczoną liczbę naklejek i cieszyć się doświadczeniem bez reklam.';

  @override
  String get scannerDemoUnlockButton => 'Zobacz plany Pro';

  @override
  String get adDialogTitle => 'Darmowe treści';

  @override
  String get adDialogBody =>
      'Aby kontynuować, obejrzyj krótką reklamę lub subskrybuj Pro i zapomnij o reklamach na zawsze.';

  @override
  String get adDialogWatchAd => 'Obejrzyj reklamę';

  @override
  String get adDialogGetPro => 'Zdobądź Pro';

  @override
  String get adDialogNotNow => 'Nie teraz';

  @override
  String get scannerCameraInitError =>
      'Nie można zainicjować kamery. Upewnij się, że aplikacja ma uprawnienia do kamery.';
}
