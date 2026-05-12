// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'Album 2026';

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
  String get homeTitle => 'Mój Album 2026';

  @override
  String get homeProfileTooltip => 'Mój profil';

  @override
  String get drawerSignIn => 'Zaloguj się';

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
  String get shareHeader => '⚽ *LISTA WYMIAN Album 2026* 🏆';

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
  String get validationEmailInvalid => 'Adres e-mail jest nieprawidłowy.';

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

  @override
  String get variantSheetTitle => 'Wariant albumu';

  @override
  String get variantSheetInventoryNote =>
      'Twój ekwipunek jest zachowywany podczas zmiany wariantu. Naklejki, które już masz, pozostają zarejestrowane.';

  @override
  String variantSheetLoadError(Object error) {
    return 'Błąd podczas ładowania wariantów: $error';
  }

  @override
  String get variantSheetEmpty => 'Brak dostępnych wariantów dla tego albumu.';

  @override
  String get variantSheetDefaultLabel => 'Wariant domyślny';

  @override
  String get variantMandatoryTitle => 'Wybierz region';

  @override
  String get variantMandatorySubtitle =>
      'Wybierz wersję albumu dla swojego regionu.';

  @override
  String variantChangedSuccess(Object name) {
    return 'Wariant zmieniony na $name ✅';
  }

  @override
  String get profileDeleteAccountButton => 'Usuń konto';

  @override
  String get profileDeleteAccountTitle => 'Usunąć swoje konto?';

  @override
  String get profileDeleteAccountMessage =>
      'Ta czynność jest trwała. Wszystkie dane zostaną usunięte i nie będziesz mógł odzyskać swojej kolekcji.';

  @override
  String get profileDeleteAccountConfirmButton => 'Usuń na stałe';

  @override
  String get profileDeleteAccountSuccess => 'Twoje konto zostało usunięte.';

  @override
  String get profileDeleteAccountError =>
      'Błąd podczas usuwania konta. Spróbuj ponownie.';

  @override
  String get paywallPrivacyPolicy => 'Polityka prywatności';

  @override
  String get paywallTermsOfUse => 'Warunki użytkowania';

  @override
  String get paywallLegalDisclaimer =>
      'Subskrybując, akceptujesz nasze Warunki użytkowania i Politykę prywatności.';

  @override
  String get tutorialSkip => 'Pomiń';

  @override
  String get tutorialTapToContinue => 'Dotknij gdziekolwiek, aby kontynuować';

  @override
  String get tutorialStep1Title => 'Twój globalny postep';

  @override
  String get tutorialStep1Body =>
      'Tutaj widzisz, ile naklejek zebrales. Kolekcjonuj dalej!';

  @override
  String get tutorialStep2Title => 'Szukaj druzyn';

  @override
  String get tutorialStep2Body =>
      'Wpisz nazwe kraju lub druzyny, aby filtrowac liste.';

  @override
  String get tutorialStep3Title => 'Glowne menu';

  @override
  String get tutorialStep3Body => 'Przejdz do profilu i zmien wariant albumu.';

  @override
  String get tutorialStep4Title => 'Skanuj naklejki';

  @override
  String get tutorialStep4Body =>
      'Uzyj kamery, aby skanowac naklejki i automatycznie je dodawac.';

  @override
  String get tutorialStep5Title => 'Udostepnij liste';

  @override
  String get tutorialStep5Body =>
      'Eksportuj liste brakujacych lub zduplikowanych naklejek do wymiany.';

  @override
  String get globalTutorialStep1Title => 'Filtruj kolekcje';

  @override
  String get globalTutorialStep1Body =>
      'Uzyj tych przyciskow, aby zobaczyc wszystkie naklejki, tylko brakujace lub tylko powtarzajace sie. Idealne do organizowania wymian!';

  @override
  String get globalTutorialStep2Title => 'Szukaj naklejki';

  @override
  String get globalTutorialStep2Body =>
      'Wpisz nazwe kraju, kod lub numer naklejki, aby szybko ja znalezc.';

  @override
  String get globalTutorialStep3Title => 'Dotknij, aby oznaczyc';

  @override
  String get globalTutorialStep3Body =>
      'Jedno dotknięcie szarej naklejki dodaje ja do albumu (staje sie zlota). Jesli dotkniesz ponownie, zostaniesz poproszon o potwierdzenie usuniecia.';

  @override
  String get globalTutorialStep4Title => 'Przytrzymaj dla wiekszych opcji';

  @override
  String get globalTutorialStep4Body =>
      'Przytrzymaj naklejke, aby zarzadzac liczba kopii kazdego wariantu (Normal, Gold, Legend...).';

  @override
  String get tutorialStep6Title => 'Przegladaj kategorie';

  @override
  String get tutorialStep6Body =>
      'Dotknij dowolnego kraju lub druzyny, aby zobaczyc jego naklejki. Tam mozesz oznaczac te, ktore juz masz i zarzadzac duplikatami.';

  @override
  String get categoryTutorialStep1Title => 'Filtruj naklejki';

  @override
  String get categoryTutorialStep1Body =>
      'Uzyj tych przyciskow, aby zobaczyc wszystkie naklejki, tylko brakujace lub tylko duplikaty.';

  @override
  String get categoryTutorialStep2Title => 'Szukaj naklejki';

  @override
  String get categoryTutorialStep2Body =>
      'Wpisz nazwe kraju, kod lub numer naklejki, aby szybko ja znalezc.';

  @override
  String get categoryTutorialStep3Title => 'Dotknij, aby oznaczyc';

  @override
  String get categoryTutorialStep3Body =>
      'Dotknięcie szarej naklejki dodaje ja do albumu (staje sie zlota). Jesli juz ja masz i dotkniesz ponownie, zostaniesz poproszony o potwierdzenie usuniecia.';

  @override
  String get categoryTutorialStep4Title =>
      'Przytrzymaj, aby zobaczyc wiecej opcji';

  @override
  String get categoryTutorialStep4Body =>
      'Przytrzymanie naklejki pozwala zarzadzac liczba kopii kazdego wariantu (Normal, Gold, Legend).';

  @override
  String get drawerReplayTutorial => 'Powtorz samouczek';

  @override
  String get variantTutorialTitle => 'Wybierz swój region';

  @override
  String get variantTutorialBody =>
      'Wybierz wariant albumu odpowiadający twojemu krajowi lub regionowi. To określa, które naklejki i warianty (Normal, Gold, Legend) pojawią się w twojej kolekcji.';

  @override
  String get drawerLegalNotice => 'Informacja Prawna';

  @override
  String get legalNoticeTitle => 'Informacja Prawna';

  @override
  String get legalNoticeBody =>
      'Ta aplikacja jest nieoficjalną twórczością fanów i nie jest powiązana, popierana ani połączona z żadną oficjalną organizacją piłkarską, producentem naklejek ani oficjalnym partnerem turnieju piłkarskiego. Wszystkie znaki towarowe są własnością ich odpowiednich właścicieli.';

  @override
  String get statsTitle => 'Statystyki';

  @override
  String get statsTotalLabel => 'Łącznie';

  @override
  String get statsCollectedLabel => 'Zebrane';

  @override
  String get statsDuplicateCopiesLabel => 'Duplikaty';

  @override
  String get statsCategoriesTitle => 'Według kategorii';

  @override
  String get statsAllCategories => 'Wszystkie';

  @override
  String get statsNoStatsYet => 'Brak danych. Zacznij zbierać!';

  @override
  String get statsBestCategory => 'Największy postęp';

  @override
  String get statsWorstCategory => 'Najmniejszy postęp';

  @override
  String get statsCompletedCategories => 'Ukończone';

  @override
  String get drawerStats => 'Statystyki';

  @override
  String get statsCategoryPickerSearch => 'Szukaj kategorii...';

  @override
  String statsCategoryPickerSelected(Object count) {
    return '$count wybranych';
  }

  @override
  String get statsCategoryPickerAll => 'Wszystkie kategorie';

  @override
  String get statsCategoryPickerClear => 'Wyczyść';

  @override
  String get statsSortTooltip => 'Sortuj';

  @override
  String get statsSortByName => 'Kategoria';

  @override
  String get statsSortByProgressDesc => 'Największy postęp najpierw';

  @override
  String get statsSortByProgressAsc => 'Najmniejszy postęp najpierw';

  @override
  String get statsSortByMissing => 'Najwięcej brakujących najpierw';

  @override
  String get statsSortByDuplicates => 'Najwięcej duplikatów najpierw';

  @override
  String get tradeHubTitle => 'Intercambio de Cromos';

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
      'Se cancelará el intercambio y los cromos volverán a tu inventario.';

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
      'Alguien quiere intercambiar cromos contigo.';

  @override
  String get tradeStatusSelecting => 'Seleccionando cromos';

  @override
  String get tradeStatusSelectingDesc =>
      'Ambos están eligiendo qué cromos ofrecer.';

  @override
  String get tradeStatusMyConfirmed => 'Tu oferta está lista';

  @override
  String get tradeStatusMyConfirmedDesc =>
      'Esperando que el otro usuario confirme su oferta.';

  @override
  String get tradeStatusOtherConfirmed => 'El otro ya confirmó';

  @override
  String get tradeStatusOtherConfirmedDesc =>
      'Confirma tu selección de cromos para continuar.';

  @override
  String get tradeStatusReservedLabel => 'Cromos reservados';

  @override
  String get tradeStatusReservedDesc =>
      'Intercambio acordado. Confirma cuando hayas recibido tus cromos.';

  @override
  String get tradeAcceptBtn => 'Aceptar intercambio';

  @override
  String get tradeSeeOfferBtn => 'Ver intercambio';

  @override
  String get tradeSelectBtn => 'Seleccionar mis cromos';

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
  String get tradeNegNoStickers => 'No tienes cromos para ofrecer.';

  @override
  String get tradeNegPartnerWaiting =>
      'El otro coleccionista aún no ha seleccionado sus cromos.';

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
      'Podrás cambiar los cromos que vas a dar. El otro coleccionista deberá esperar.';

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
      'El otro coleccionista actualizó su oferta de cromos.';

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
      'Marca los cromos que recibiste físicamente';

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
    return 'Recibiste todos los cromos ($received/$total)';
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
  String get tradeDrawerTitle => 'Intercambiar cromos';

  @override
  String get tradeDrawerActiveBadge => 'ACTIVO';

  @override
  String get tradeErrorGeneric =>
      'Ocurrió un error en el intercambio. Inténtalo de nuevo.';

  @override
  String get tradeErrorNotLoggedIn =>
      'Debes iniciar sesión para intercambiar cromos.';

  @override
  String get tradeErrorSelf => 'No puedes intercambiar cromos contigo mismo.';

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
  String get drawerLookup => 'Wyszukaj naklejkę';

  @override
  String get lookupScreenTitle => 'Wyszukaj naklejkę';

  @override
  String get lookupTabManual => 'Ręcznie';

  @override
  String get lookupTabScanner => 'Skaner';

  @override
  String get lookupSearchHint => 'Np.: ECU 10, ARG 5, FRA 1...';

  @override
  String get lookupSearchButton => 'Szukaj';

  @override
  String get lookupStickerNotFound => 'Nie znaleziono naklejki z tym kodem.';

  @override
  String get lookupStatusMissing => 'Brakuje';

  @override
  String get lookupStatusCollected => 'Masz już ✓';

  @override
  String lookupStatusDuplicates(Object count) {
    return '$count duplikat(y) 🔁';
  }

  @override
  String get lookupQtyLabel => 'Ilość w twoim ekwipunku';

  @override
  String get lookupScannerHint => 'Wyśrodkuj naklejkę, aby ją zidentyfikować';

  @override
  String get lookupTutorialStep1Title => 'Dwa sposoby wyszukiwania';

  @override
  String get lookupTutorialStep1Body =>
      'Użyj karty Ręcznie, aby wpisać kod naklejki, lub karty Skaner, aby użyć aparatu.';

  @override
  String get lookupTutorialStep2Title => 'Wpisz kod';

  @override
  String get lookupTutorialStep2Body =>
      'Wpisz kod naklejki tak, jak pojawia się w albumie, np. ECU 10 lub ARG 5, a następnie naciśnij Szukaj.';

  @override
  String get lookupTutorialStep3Title => 'Sprawdzaj i zarządzaj';

  @override
  String get lookupTutorialStep3Body =>
      'Zobaczysz, czy naklejka jest brakująca czy już masz. Przyciskami + i – możesz natychmiast zaktualizować swój ekwipunek.';
}
