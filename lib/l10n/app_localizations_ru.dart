// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get shareStatisticsTooltip => 'Compartir progreso';

  @override
  String shareStatisticsMessage(
    String percentage,
    String appTitle,
    String appLink,
  ) {
    return '¡He coleccionado el $percentage% de mi álbum de cromos! Únete a mí en $appTitle: $appLink';
  }

  @override
  String get appTitle => 'Sticker Album 2026';

  @override
  String get authWelcomeTitle => 'Добро пожаловать в Sticker Album 2026';

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
  String get homeTitle => 'Sticker Album 2026';

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
  String get shareHeader => '⚽ *СПИСОК ОБМЕНА STICKER ALBUM 2026* 🏆';

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
  String shareDownloadLink(String appName) {
    return '📲 Скачать приложение $appName\nhttps://onelink.to/5adrft?olbm=1';
  }

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
  String get paywallBestOption => 'Лучший вариант';

  @override
  String get paywallStartFreeTrial => 'Начать бесплатный пробный период';

  @override
  String paywallFreeTrial(int days) {
    return 'Бесплатный пробный период $days дней';
  }

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
  String get tutorialNavAlbumTitle => 'Álbum';

  @override
  String get tutorialNavAlbumBody =>
      'Tu álbum principal. Aquí ves todos los países y equipos, marcas tus stickers y ves tu progreso global.';

  @override
  String get tutorialNavScannerTitle => 'Escáner';

  @override
  String get tutorialNavScannerBody =>
      'Escanea el dorso de tus stickers físicos con la cámara. La app los reconoce automáticamente y los añade a tu colección. ¡También puedes quitar repetidos!';

  @override
  String get tutorialNavExchangeTitle => 'Intercambio';

  @override
  String get tutorialNavExchangeBody =>
      'Escanea los stickers de otro coleccionista para saber cuáles te faltan y cuáles puedes ofrecerle a cambio. Perfecto para intercambios cara a cara.';

  @override
  String get tutorialNavLookupTitle => 'Buscar';

  @override
  String get tutorialNavLookupBody =>
      'Consulta cualquier sticker por su código o número. Puedes buscarlo escribiéndolo o escaneándolo directamente.';

  @override
  String get tutorialNavStatsTitle => 'Estadísticas';

  @override
  String get tutorialNavStatsBody =>
      'Analiza tu progreso por categoría: porcentaje completado, faltantes y repetidos. Ordena y filtra como quieras.';

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
  String get drawerRateApp => 'Оцените наше приложение';

  @override
  String get scannerTutorialStep1Title => 'Modo de escaneo';

  @override
  String get scannerTutorialStep1Body =>
      'Elige Agregar para registrar stickers nuevos, o Quitar repetidos para eliminar del inventario los que ya tienes de más.';

  @override
  String get scannerTutorialStep2Title => 'Apunta al sticker';

  @override
  String get scannerTutorialStep2Body =>
      'Coloca el dorso del sticker dentro del marco. La app detecta el código automáticamente y lo añade a tu álbum. Verás una notificación en pantalla con el resultado.';

  @override
  String get exchangeTutorialStep1Title => 'Escanea los stickers de tu amigo';

  @override
  String get exchangeTutorialStep1Body =>
      'Apunta la cámara al dorso de los stickers de otro coleccionista. La app clasifica cuáles te faltan y cuáles ya tienes repetidos.';

  @override
  String get exchangeTutorialStep2Title => 'Faltantes y repetidos';

  @override
  String get exchangeTutorialStep2Body =>
      'Aquí verás en tiempo real cuántos stickers nuevos encontraste y cuántos ya tenías. Toca Ver resultados para ver la lista completa y guardar los que te faltan.';

  @override
  String get statsTutorialStep1Title => 'Tu progreso global';

  @override
  String get statsTutorialStep1Body =>
      'Esta tarjeta muestra cuántos stickers únicos tienes del total del álbum. ¡Apunta al 100%! Desliza hacia abajo para actualizar.';

  @override
  String get statsTutorialStep2Title => 'Filtra por categoría';

  @override
  String get statsTutorialStep2Body =>
      'Toca estos chips para ver las estadísticas de un país o equipo concreto. Puedes seleccionar varios a la vez para comparar.';

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

  @override
  String get statsTitle => 'Статистика';

  @override
  String get statsTotalLabel => 'Всего';

  @override
  String get statsCollectedLabel => 'Собрано';

  @override
  String get statsDuplicateCopiesLabel => 'Дубликаты';

  @override
  String get statsCategoriesTitle => 'По категориям';

  @override
  String get statsAllCategories => 'Все';

  @override
  String get statsNoStatsYet => 'Данных ещё нет. Начни собирать!';

  @override
  String get statsBestCategory => 'Наибольший прогресс';

  @override
  String get statsWorstCategory => 'Наименьший прогресс';

  @override
  String get statsCompletedCategories => 'Завершено';

  @override
  String get drawerStats => 'Статистика';

  @override
  String get statsCategoryPickerSearch => 'Поиск категории...';

  @override
  String statsCategoryPickerSelected(Object count) {
    return '$count выбрано';
  }

  @override
  String get statsCategoryPickerAll => 'Все категории';

  @override
  String get statsCategoryPickerClear => 'Очистить';

  @override
  String get statsSortTooltip => 'Сортировка';

  @override
  String get statsSortByName => 'Категория';

  @override
  String get statsSortByProgressDesc => 'Наибольший прогресс сначала';

  @override
  String get statsSortByProgressAsc => 'Наименьший прогресс сначала';

  @override
  String get statsSortByMissing => 'Больше всего отсутствует сначала';

  @override
  String get statsSortByDuplicates => 'Больше всего дублей сначала';

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
    return '$count sticker(s) seleccionado(s)';
  }

  @override
  String get tradeNegNoStickers => 'No tienes stickers para ofrecer.';

  @override
  String get tradeNegPartnerWaiting =>
      'El otro coleccionista aún no ha seleccionado sus stickers.';

  @override
  String tradeNegOfferLabel(Object count) {
    return 'Ofrecerás $count sticker(s)';
  }

  @override
  String get tradeNegConfirmBtn => 'Confirmar mi oferta';

  @override
  String get tradeNegSaving => 'Guardando…';

  @override
  String get tradeNegAtLeastOne =>
      'Selecciona al menos un sticker para ofrecer.';

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
    return '$count sticker(s) en total';
  }

  @override
  String tradeNegReceivingCount(Object count) {
    return '$count sticker(s) que vas a recibir';
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
      'El otro coleccionista no ofreció ningún sticker.';

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
    return 'Se añadirán $received sticker(s) a tu álbum.\n$pending sticker(s) desmarcados volverán al otro coleccionista.';
  }

  @override
  String tradeDeliverySuccess(Object count) {
    return '¡$count sticker(s) añadidos a tu álbum! 🏆';
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
    return '$count sticker(s)';
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
  String get drawerLookup => 'Поиск наклейки';

  @override
  String get physicalExchangeVirtualBtn => 'Intercambio Virtual';

  @override
  String get lookupScreenTitle => 'Поиск наклейки';

  @override
  String get lookupTabManual => 'Вручную';

  @override
  String get lookupTabScanner => 'Сканер';

  @override
  String get lookupSearchHint => 'Напр.: ECU 10, ARG 5, FRA 1...';

  @override
  String get lookupSearchButton => 'Найти';

  @override
  String get lookupStickerNotFound => 'Наклейка с таким кодом не найдена.';

  @override
  String get lookupStatusMissing => 'Отсутствует';

  @override
  String get lookupStatusCollected => 'Уже есть ✓';

  @override
  String lookupStatusDuplicates(Object count) {
    return '$count дубликат(а/ов) 🔁';
  }

  @override
  String get lookupQtyLabel => 'Количество в вашем инвентаре';

  @override
  String get lookupScannerHint =>
      'Поместите наклейку в центр для распознавания';

  @override
  String get lookupScannerOpenTooltip => 'Abrir escáner';

  @override
  String get lookupScannerOpenCamera => 'Escanear stickers';

  @override
  String get lookupScannerViewResults => 'Ver resultados';

  @override
  String lookupScannerSaveSuccess(Object count) {
    return '$count sticker(s) agregado(s) al inventario';
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
  String get lookupTutorialStep1Title => 'Два способа поиска';

  @override
  String get lookupTutorialStep1Body =>
      'Используйте вкладку «Вручную» для ввода кода или «Сканер» для съёмки камерой.';

  @override
  String get lookupTutorialStep2Title => 'Введите код';

  @override
  String get lookupTutorialStep2Body =>
      'Напечатайте код наклейки как в альбоме, например ECU 10 или ARG 5, затем нажмите Найти.';

  @override
  String get lookupTutorialStep3Title => 'Проверьте и управляйте';

  @override
  String get lookupTutorialStep3Body =>
      'Вы увидите, есть ли наклейка или её не хватает. Кнопками + и – можно мгновенно обновить инвентарь.';

  @override
  String get scanBadgeNew => 'Новая';

  @override
  String get scanBadgeRepeated => 'Дубликат';

  @override
  String get scannerModeAdd => 'Добавить наклейки';

  @override
  String get scannerModeRemoveDuplicates => 'Убрать дубликаты';

  @override
  String get scannerRemoveModeHint => 'Наведите на дубликат для удаления';

  @override
  String get removeDuplicatesTitle => 'Дубликаты для удаления';

  @override
  String get removeDuplicatesEmpty => 'Дубликаты ещё не отсканированы';

  @override
  String removeDuplicatesSavedSuccess(Object count) {
    return '$count дубликата удалено из инвентаря 🗑️';
  }

  @override
  String removeDuplicatesSaveError(Object message) {
    return 'Ошибка при сохранении: $message';
  }

  @override
  String removeDuplicatesLimitWarning(Object label) {
    return 'У $label нет дублирующихся наклеек';
  }

  @override
  String removeDuplicatesReviewButton(Object count) {
    return 'Проверить $count для удаления';
  }

  @override
  String get navAlbum => 'Альбом';

  @override
  String get navScanner => 'Сканер';
}
