// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Альбом 26';

  @override
  String get authWelcomeTitle => 'Добро пожаловать в Альбом 26';

  @override
  String get authEmailLabel => 'Электронная почта';

  @override
  String get authPasswordLabel => 'Пароль';

  @override
  String get authLoginButton => 'ВОЙТИ';

  @override
  String get authContinueWith => 'Или продолжить с';

  @override
  String get authContinueGoogle => 'Продолжить с Google';

  @override
  String get authContinueApple => 'Продолжить с Apple';

  @override
  String get authContinueGuest => 'Продолжить как гость';

  @override
  String get authNoAccountRegister => 'Нет аккаунта? Зарегистрироваться';

  @override
  String get authForgotPassword => 'Забыли пароль?';

  @override
  String get authResetPasswordEnterEmail =>
      'Введите свою почту для восстановления пароля.';

  @override
  String get authResetPasswordEmailSent =>
      'Мы отправили вам письмо для сброса пароля.';

  @override
  String get authGuestMigratedSuccess =>
      'Ваш прогресс гостя успешно перенесён в новый аккаунт! 🏆';

  @override
  String get authGuestRemotePreserved =>
      'С возвращением! Ваша облачная коллекция восстановлена, а локальный прогресс гостя удалён.';

  @override
  String commonErrorWithMessage(Object message) {
    return 'Ошибка: $message';
  }

  @override
  String get authErrorInvalidCredentials =>
      'Неверная почта или пароль. Проверьте данные и попробуйте снова.';

  @override
  String get authErrorEmailNotConfirmed =>
      'Ваша почта ещё не подтверждена. Проверьте папку входящих.';

  @override
  String get authErrorUserAlreadyRegistered =>
      'Аккаунт с этой электронной почтой уже существует.';

  @override
  String get authErrorWeakPassword =>
      'Пароль слишком слабый. Используйте не менее 6 символов.';

  @override
  String get authErrorInvalidEmail =>
      'Неверный формат адреса электронной почты.';

  @override
  String get authErrorTokenExpired =>
      'Код устарел или недействителен. Запросите новый.';

  @override
  String get authErrorRateLimit =>
      'Слишком много попыток. Подождите немного перед повторной попыткой.';

  @override
  String get authErrorNetworkError =>
      'Нет соединения. Проверьте сеть и попробуйте снова.';

  @override
  String get authErrorSessionExpired =>
      'Ваша сессия истекла. Пожалуйста, войдите снова.';

  @override
  String get authErrorUnknown =>
      'Произошла неожиданная ошибка. Попробуйте снова.';

  @override
  String get registerTitle => 'Создать аккаунт';

  @override
  String get registerFillAllFields => 'Пожалуйста, заполните все поля.';

  @override
  String get registerEmailsDontMatch =>
      'Адреса электронной почты не совпадают.';

  @override
  String get registerPasswordsDontMatch => 'Пароли не совпадают.';

  @override
  String get registerPasswordMinLength =>
      'Пароль должен содержать не менее 6 символов.';

  @override
  String get registerAccountCreated =>
      'Аккаунт успешно создан! ⚽ Пожалуйста, войдите.';

  @override
  String get registerConfirmEmailLabel => 'Подтвердить почту';

  @override
  String get registerConfirmPasswordLabel => 'Подтвердить пароль';

  @override
  String get registerSubmitButton => 'ЗАРЕГИСТРИРОВАТЬСЯ';

  @override
  String get profileTitle => 'Мой профиль';

  @override
  String get profileOfficialCollector => 'Официальный коллекционер 🌟';

  @override
  String get profileChangePasswordButton => 'Обновить пароль';

  @override
  String get profileChangePasswordTitle => 'Обновить пароль';

  @override
  String get profileNewPasswordLabel => 'Новый пароль';

  @override
  String get profileConfirmNewPasswordLabel => 'Подтвердить новый пароль';

  @override
  String get profilePasswordUpdatedSuccess => 'Пароль успешно обновлён.';

  @override
  String get profileLogoutButton => 'Выйти';

  @override
  String get profileLogoutSuccess => 'Вы успешно вышли из системы.';

  @override
  String get profileUnknownUser => 'Неизвестный пользователь';

  @override
  String profileLogoutError(Object message) {
    return 'Ошибка при выходе: $message';
  }

  @override
  String get homeTitle => 'Мой альбом 26';

  @override
  String get homeProfileTooltip => 'Мой профиль';

  @override
  String get drawerSignIn => 'Войти';

  @override
  String get homeShareAll => 'Поделиться полным списком';

  @override
  String get homeShareMissingOnly => 'Только отсутствующие';

  @override
  String get homeShareDuplicatesOnly => 'Только дубликаты';

  @override
  String get homeGlobalProgressTitle => 'Общий прогресс';

  @override
  String homeCollectedCount(Object collected, Object total) {
    return '$collected из $total собрано';
  }

  @override
  String get homeViewFullCollection => 'Посмотреть всю коллекцию';

  @override
  String get homeTeamsTitle => 'Команды';

  @override
  String get homeSearchTeamsHint => 'Поиск по стране или команде...';

  @override
  String get homeNoResults => 'Команды не найдены';

  @override
  String get homeScanButton => 'Сканировать наклейку';

  @override
  String homeObtainedCount(Object collected, Object total) {
    return '$collected из $total получено';
  }

  @override
  String get homeProgressError => 'Ошибка';

  @override
  String get globalCollectionTitle => 'Полная коллекция';

  @override
  String get filterAll => 'Все';

  @override
  String get filterMissing => 'Отсутствующие';

  @override
  String get filterDuplicates => 'Дубликаты';

  @override
  String get filterSearchHint => 'Поиск по стране, коду или номеру...';

  @override
  String get stickerRemoveTitle => 'Удалить наклейку?';

  @override
  String stickerRemoveConfirm(Object stickerLabel) {
    return 'Вы уверены, что хотите удалить наклейку $stickerLabel из своего альбома?';
  }

  @override
  String get commonCancel => 'Отмена';

  @override
  String get commonRemove => 'Удалить';

  @override
  String get commonDone => 'ГОТОВО';

  @override
  String get gridNoResults => 'Наклейки не найдены.';

  @override
  String scannerViewScannedButton(Object count) {
    return 'Просмотреть $count отсканированных наклеек';
  }

  @override
  String get scannerOverlayHint =>
      'Разместите оборотную сторону наклейки здесь по центру';

  @override
  String get pendingScansTitle => 'Отсканированные наклейки';

  @override
  String get pendingScansEmpty => 'Вы ещё не отсканировали ни одной наклейки';

  @override
  String pendingScansItemLabel(Object code) {
    return 'Наклейка: $code';
  }

  @override
  String pendingScansSavedSuccess(Object count) {
    return '$count наклеек добавлено в ваш альбом! 🏆';
  }

  @override
  String pendingScansSaveError(Object message) {
    return 'Ошибка при сохранении: $message';
  }

  @override
  String get shareHeader => '⚽ *СПИСОК ОБМЕНА АЛЬБОМ 26* 🏆';

  @override
  String get shareMissingSectionTitle => '❌ *ОТСУТСТВУЮЩИЕ:*';

  @override
  String get shareDuplicatesSectionTitle => '🔁 *ДУБЛИКАТЫ:*';

  @override
  String get shareNoneMissing => 'Ни одной! 😎';

  @override
  String get shareNoDuplicates => 'Нет дубликатов 😅';

  @override
  String get shareLetsTrade => 'Хотите обменяться? 👀🔥';

  @override
  String get shareSeparator => '--------------------------';

  @override
  String get forgotPasswordTitle => 'Восстановить аккаунт';

  @override
  String get forgotPasswordDescription =>
      'Введите вашу почту и мы отправим 6-значный код для сброса пароля.';

  @override
  String get forgotPasswordEmailLabel => 'Электронная почта';

  @override
  String get forgotPasswordEmptyEmailError =>
      'Пожалуйста, введите вашу электронную почту.';

  @override
  String get forgotPasswordCodeSentSuccess =>
      'Код отправлен. Проверьте папку входящих.';

  @override
  String get forgotPasswordSendCodeButton => 'ОТПРАВИТЬ КОД';

  @override
  String forgotPasswordStep2Description(Object email) {
    return 'Введите код, отправленный на $email, и ваш новый пароль.';
  }

  @override
  String get forgotPasswordCodeInputLabel => '8-значный код';

  @override
  String get forgotPasswordInvalidCodeError =>
      'Код должен состоять ровно из 6 цифр.';

  @override
  String get forgotPasswordNewPasswordLabel => 'Новый пароль';

  @override
  String get forgotPasswordShortPasswordError =>
      'Пароль должен содержать не менее 6 символов.';

  @override
  String get forgotPasswordSavePasswordButton => 'СОХРАНИТЬ ПАРОЛЬ';

  @override
  String get forgotPasswordPasswordUpdatedSuccess =>
      'Пароль успешно обновлён! 🏆';

  @override
  String get validationEmailInvalid =>
      'Адрес электронной почты недействителен.';

  @override
  String get paywallTitle => 'Наслаждайтесь без рекламы';

  @override
  String get paywallSubtitle =>
      'Все функции доступны бесплатно. С Pro наслаждайтесь всем без перебоев.';

  @override
  String get paywallBenefitScanner => 'Сканер без межстраничной рекламы';

  @override
  String get paywallBenefitNoAds => 'Без рекламы';

  @override
  String get paywallBenefitSync => 'Синхронизация с облаком включена';

  @override
  String paywallSubscribeButton(Object price) {
    return 'Подписаться · $price';
  }

  @override
  String get paywallPackageMonthly => 'Ежемесячно';

  @override
  String get paywallPackageAnnual => 'Ежегодно';

  @override
  String get paywallPackageWeekly => 'Еженедельно';

  @override
  String get paywallPackageLifetime => 'Навсегда';

  @override
  String get paywallPackageTwoMonth => 'Каждые 2 месяца';

  @override
  String get paywallPackageThreeMonth => 'Каждые 3 месяца';

  @override
  String get paywallPackageSixMonth => 'Каждые 6 месяцев';

  @override
  String get paywallRestorePurchases => 'Восстановить покупки';

  @override
  String get paywallCancelAnytime => 'Отмена в любое время. Без обязательств.';

  @override
  String get paywallLoadError =>
      'Не удалось загрузить планы. Проверьте подключение.';

  @override
  String get paywallRetry => 'Повторить';

  @override
  String get paywallPurchaseError =>
      'Покупка не удалась. Пожалуйста, попробуйте снова.';

  @override
  String get paywallRestoreError =>
      'Не удалось восстановить покупки. Пожалуйста, попробуйте снова.';

  @override
  String get paywallGuestTitle => 'Войдите, чтобы подписаться';

  @override
  String get paywallGuestBody =>
      'Pro привязан к вашему аккаунту. Войдите или создайте аккаунт, чтобы разблокировать все функции.';

  @override
  String get paywallGuestSignInButton => 'ВОЙТИ';

  @override
  String scannerDemoRemaining(Object count) {
    return 'Осталось $count бесплатных сканирований';
  }

  @override
  String get scannerDemoFinishedTitle =>
      'Вы использовали свои 5 бесплатных сканирований';

  @override
  String get scannerDemoFinishedSubtitle =>
      'Подпишитесь для неограниченного сканирования наклеек и работы без рекламы.';

  @override
  String get scannerDemoUnlockButton => 'Просмотреть планы Pro';

  @override
  String get adDialogTitle => 'Бесплатный контент';

  @override
  String get adDialogBody =>
      'Чтобы продолжить, посмотрите короткую рекламу или подпишитесь на Pro и забудьте о рекламе навсегда.';

  @override
  String get adDialogWatchAd => 'Смотреть рекламу';

  @override
  String get adDialogGetPro => 'Получить Pro';

  @override
  String get adDialogNotNow => 'Не сейчас';

  @override
  String get scannerCameraInitError =>
      'Не удалось инициализировать камеру. Убедитесь, что приложение имеет разрешение на использование камеры.';

  @override
  String get variantSheetTitle => 'Вариант альбома';

  @override
  String get variantSheetInventoryNote =>
      'Ваш инвентарь сохраняется при смене варианта. Наклейки, которые у вас уже есть, остаются зарегистрированными.';

  @override
  String variantSheetLoadError(Object error) {
    return 'Ошибка загрузки вариантов: $error';
  }

  @override
  String get variantSheetEmpty => 'Для этого альбома нет доступных вариантов.';

  @override
  String get variantSheetDefaultLabel => 'Вариант по умолчанию';

  @override
  String get variantMandatoryTitle => 'Выберите регион';

  @override
  String get variantMandatorySubtitle =>
      'Выберите версию альбома для вашего региона.';

  @override
  String variantChangedSuccess(Object name) {
    return 'Вариант изменён на $name ✅';
  }

  @override
  String get profileDeleteAccountButton => 'Удалить аккаунт';

  @override
  String get profileDeleteAccountTitle => 'Удалить аккаунт?';

  @override
  String get profileDeleteAccountMessage =>
      'Это действие необратимо. Все данные будут удалены, и вы не сможете восстановить коллекцию.';

  @override
  String get profileDeleteAccountConfirmButton => 'Удалить навсегда';

  @override
  String get profileDeleteAccountSuccess => 'Ваш аккаунт удалён.';

  @override
  String get profileDeleteAccountError =>
      'Ошибка при удалении аккаунта. Попробуйте ещё раз.';

  @override
  String get paywallPrivacyPolicy => 'Политика конфиденциальности';

  @override
  String get paywallTermsOfUse => 'Условия использования';

  @override
  String get paywallLegalDisclaimer =>
      'Подписываясь, вы принимаете наши Условия использования и Политику конфиденциальности.';

  @override
  String get tutorialSkip => 'Пропустить';

  @override
  String get tutorialTapToContinue => 'Нажмите в любом месте, чтобы продолжить';

  @override
  String get tutorialStep1Title => 'Ваш общий прогресс';

  @override
  String get tutorialStep1Body =>
      'Здесь видно, сколько наклеек вы собрали. Продолжайте!';

  @override
  String get tutorialStep2Title => 'Поиск команд';

  @override
  String get tutorialStep2Body =>
      'Введите название страны или команды для фильтрации.';

  @override
  String get tutorialStep3Title => 'Главное меню';

  @override
  String get tutorialStep3Body => 'Откройте профиль и смените вариант альбома.';

  @override
  String get tutorialStep4Title => 'Сканирование наклеек';

  @override
  String get tutorialStep4Body =>
      'Используйте камеру для сканирования и добавления наклеек автоматически.';

  @override
  String get tutorialStep5Title => 'Поделиться списком';

  @override
  String get tutorialStep5Body =>
      'Экспортируйте список недостающих или дублирующихся наклеек для обмена.';

  @override
  String get globalTutorialStep1Title => 'Фильтр коллекции';

  @override
  String get globalTutorialStep1Body =>
      'Используйте эти кнопки, чтобы просматривать все наклейки, только недостающие или только дублирующиеся. Идеально для организации обменов!';

  @override
  String get globalTutorialStep2Title => 'Поиск наклейки';

  @override
  String get globalTutorialStep2Body =>
      'Введите название страны, код или номер наклейки, чтобы быстро её найти.';

  @override
  String get globalTutorialStep3Title => 'Нажмите, чтобы отметить';

  @override
  String get globalTutorialStep3Body =>
      'Одно нажатие на серую наклейку добавляет её в альбом (становится золотой). Повторное нажатие запросит подтверждение удаления.';

  @override
  String get globalTutorialStep4Title => 'Долгое нажатие для доп. опций';

  @override
  String get globalTutorialStep4Body =>
      'Удерживайте наклейку, чтобы управлять количеством копий каждого варианта (Normal, Gold, Legend...).';

  @override
  String get tutorialStep6Title => 'Issleduyte kategoriju';

  @override
  String get tutorialStep6Body =>
      'Nazhimite na ljubuju stranu ili komandu, chtoby uvidet ee naklejki. Tam vy mozhete otmechat uzhe imejushhiesja i upravljat dublikatami.';

  @override
  String get categoryTutorialStep1Title => 'Filtracija naklejok';

  @override
  String get categoryTutorialStep1Body =>
      'Ispolzujte eti knopki, chtoby uvidet vse naklejki, tolko nedostajushhie ili tolko duplikaty.';

  @override
  String get categoryTutorialStep2Title => 'Poisk naklejki';

  @override
  String get categoryTutorialStep2Body =>
      'Vvedite nazvanie strany, kod ili nomer naklejki, chtoby bystro ee najti.';

  @override
  String get categoryTutorialStep3Title => 'Nazhmite dlja otmetki';

  @override
  String get categoryTutorialStep3Body =>
      'Nazhatenie na seruju naklejku dobavljaet ee v albom (stanovitsja zolotoj). Esli ona uzhe est, povtornoe nazhatenie poproset podtverzhdenie udalenija.';

  @override
  String get categoryTutorialStep4Title => 'Uderzhivajte dlja dop opcij';

  @override
  String get categoryTutorialStep4Body =>
      'Uderzhivanie naklejki pozvoljaet upravljat kolichestvom kopij kazhdogo varianta (Normal, Gold, Legend).';

  @override
  String get drawerReplayTutorial => 'Povtorit obuchenie';

  @override
  String get variantTutorialTitle => 'Выберите свой регион';

  @override
  String get variantTutorialBody =>
      'Выбери вариант альбома, соответствующий твоей стране или региону. Это определяет, какие наклейки и варианты (Normal, Gold, Legend) появятся в твоей коллекции.';

  @override
  String get drawerLegalNotice => 'Правовое уведомление';

  @override
  String get legalNoticeTitle => 'Правовое уведомление';

  @override
  String get legalNoticeBody =>
      'Это приложение является неофициальным фанатским проектом и не связано, не поддержано и не аффилировано ни с какой официальной футбольной организацией, производителем наклеек или официальным партнёром футбольного турнира. Все товарные знаки являются собственностью соответствующих владельцев.';
}
