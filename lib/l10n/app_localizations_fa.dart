// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get appTitle => 'آلبوم ۲۶';

  @override
  String get authWelcomeTitle => 'به آلبوم ۲۶ خوش آمدید';

  @override
  String get authEmailLabel => 'ایمیل';

  @override
  String get authPasswordLabel => 'رمز عبور';

  @override
  String get authLoginButton => 'ورود';

  @override
  String get authContinueWith => 'یا ادامه با';

  @override
  String get authContinueGoogle => 'ادامه با Google';

  @override
  String get authContinueApple => 'ادامه با Apple';

  @override
  String get authContinueGuest => 'ادامه به عنوان مهمان';

  @override
  String get authNoAccountRegister => 'حساب ندارید؟ ثبت‌نام کنید';

  @override
  String get authForgotPassword => 'رمز عبور را فراموش کردید؟';

  @override
  String get authResetPasswordEnterEmail =>
      'ایمیل خود را برای بازیابی رمز عبور وارد کنید.';

  @override
  String get authResetPasswordEmailSent =>
      'ایمیلی برای بازنشانی رمز عبور برای شما ارسال کردیم.';

  @override
  String get authGuestMigratedSuccess =>
      'پیشرفت شما به عنوان مهمان با موفقیت به حساب جدیدتان منتقل شد! 🏆';

  @override
  String get authGuestRemotePreserved =>
      'خوش برگشتید! مجموعه ابری شما بازیابی شد و پیشرفت محلی مهمان حذف شد.';

  @override
  String commonErrorWithMessage(Object message) {
    return 'خطا: $message';
  }

  @override
  String get authErrorInvalidCredentials =>
      'ایمیل یا رمز عبور اشتباه است. اطلاعات خود را بررسی کرده و دوباره امتحان کنید.';

  @override
  String get authErrorEmailNotConfirmed =>
      'ایمیل شما هنوز تأیید نشده است. صندوق ورودی خود را بررسی کنید.';

  @override
  String get authErrorUserAlreadyRegistered =>
      'قبلاً یک حساب با این ایمیل وجود دارد.';

  @override
  String get authErrorWeakPassword =>
      'رمز عبور خیلی ضعیف است. از حداقل ۶ کاراکتر استفاده کنید.';

  @override
  String get authErrorInvalidEmail => 'فرمت آدرس ایمیل معتبر نیست.';

  @override
  String get authErrorTokenExpired =>
      'کد منقضی شده یا نامعتبر است. لطفاً یک کد جدید درخواست کنید.';

  @override
  String get authErrorRateLimit =>
      'تلاش‌های زیاد. لطفاً قبل از امتحان مجدد کمی صبر کنید.';

  @override
  String get authErrorNetworkError =>
      'اتصال ندارید. شبکه خود را بررسی کرده و دوباره امتحان کنید.';

  @override
  String get authErrorSessionExpired =>
      'جلسه شما منقضی شده است. لطفاً دوباره وارد شوید.';

  @override
  String get authErrorUnknown =>
      'خطای غیرمنتظره‌ای رخ داد. لطفاً دوباره امتحان کنید.';

  @override
  String get registerTitle => 'ایجاد حساب';

  @override
  String get registerFillAllFields => 'لطفاً تمام فیلدها را پر کنید.';

  @override
  String get registerEmailsDontMatch => 'ایمیل‌ها مطابقت ندارند.';

  @override
  String get registerPasswordsDontMatch => 'رمزهای عبور مطابقت ندارند.';

  @override
  String get registerPasswordMinLength =>
      'رمز عبور باید حداقل ۶ کاراکتر داشته باشد.';

  @override
  String get registerAccountCreated =>
      'حساب با موفقیت ایجاد شد! ⚽ لطفاً وارد شوید.';

  @override
  String get registerConfirmEmailLabel => 'تأیید ایمیل';

  @override
  String get registerConfirmPasswordLabel => 'تأیید رمز عبور';

  @override
  String get registerSubmitButton => 'ثبت‌نام';

  @override
  String get profileTitle => 'پروفایل من';

  @override
  String get profileOfficialCollector => 'کلکسیونر رسمی 🌟';

  @override
  String get profileChangePasswordButton => 'به‌روزرسانی رمز عبور';

  @override
  String get profileChangePasswordTitle => 'به‌روزرسانی رمز عبور';

  @override
  String get profileNewPasswordLabel => 'رمز عبور جدید';

  @override
  String get profileConfirmNewPasswordLabel => 'تأیید رمز عبور جدید';

  @override
  String get profilePasswordUpdatedSuccess =>
      'رمز عبور با موفقیت به‌روزرسانی شد.';

  @override
  String get profileLogoutButton => 'خروج';

  @override
  String get profileLogoutSuccess => 'با موفقیت خارج شدید.';

  @override
  String get profileUnknownUser => 'کاربر ناشناس';

  @override
  String profileLogoutError(Object message) {
    return 'خطا در خروج: $message';
  }

  @override
  String get homeTitle => 'آلبوم من ۲۶';

  @override
  String get homeProfileTooltip => 'پروفایل من';

  @override
  String get drawerSignIn => 'ورود به حساب';

  @override
  String get homeShareAll => 'اشتراک‌گذاری لیست کامل';

  @override
  String get homeShareMissingOnly => 'فقط گم‌شده‌ها';

  @override
  String get homeShareDuplicatesOnly => 'فقط تکراری‌ها';

  @override
  String get homeGlobalProgressTitle => 'پیشرفت کلی';

  @override
  String homeCollectedCount(Object collected, Object total) {
    return '$collected از $total جمع‌آوری شده';
  }

  @override
  String get homeViewFullCollection => 'مشاهده مجموعه کامل';

  @override
  String get homeTeamsTitle => 'تیم‌ها';

  @override
  String get homeSearchTeamsHint => 'جستجو بر اساس کشور یا تیم...';

  @override
  String get homeNoResults => 'تیمی یافت نشد';

  @override
  String get homeScanButton => 'اسکن برچسب';

  @override
  String homeObtainedCount(Object collected, Object total) {
    return '$collected از $total به دست آمده';
  }

  @override
  String get homeProgressError => 'خطا';

  @override
  String get globalCollectionTitle => 'مجموعه کامل';

  @override
  String get filterAll => 'همه';

  @override
  String get filterMissing => 'گم‌شده‌ها';

  @override
  String get filterDuplicates => 'تکراری‌ها';

  @override
  String get filterSearchHint => 'جستجو بر اساس کشور، کد یا شماره...';

  @override
  String get stickerRemoveTitle => 'حذف برچسب؟';

  @override
  String stickerRemoveConfirm(Object stickerLabel) {
    return 'آیا مطمئنید که می‌خواهید برچسب $stickerLabel را از آلبوم خود حذف کنید؟';
  }

  @override
  String get commonCancel => 'لغو';

  @override
  String get commonRemove => 'حذف';

  @override
  String get commonDone => 'تمام';

  @override
  String get gridNoResults => 'برچسبی یافت نشد.';

  @override
  String scannerViewScannedButton(Object count) {
    return 'مرور $count برچسب اسکن‌شده';
  }

  @override
  String get scannerOverlayHint => 'پشت برچسب را اینجا وسط قرار دهید';

  @override
  String get pendingScansTitle => 'برچسب‌های اسکن‌شده';

  @override
  String get pendingScansEmpty => 'هنوز هیچ برچسبی اسکن نکرده‌اید';

  @override
  String pendingScansItemLabel(Object code) {
    return 'برچسب: $code';
  }

  @override
  String pendingScansSavedSuccess(Object count) {
    return '$count برچسب به آلبوم شما اضافه شد! 🏆';
  }

  @override
  String pendingScansSaveError(Object message) {
    return 'خطا در ذخیره‌سازی: $message';
  }

  @override
  String get shareHeader => '⚽ *لیست تبادل آلبوم ۲۶* 🏆';

  @override
  String get shareMissingSectionTitle => '❌ *گم‌شده‌ها:*';

  @override
  String get shareDuplicatesSectionTitle => '🔁 *تکراری‌ها:*';

  @override
  String get shareNoneMissing => 'هیچ‌کدام! 😎';

  @override
  String get shareNoDuplicates => 'تکراری ندارم 😅';

  @override
  String get shareLetsTrade => 'می‌خواهید تبادل کنید؟ 👀🔥';

  @override
  String get shareSeparator => '--------------------------';

  @override
  String get forgotPasswordTitle => 'بازیابی حساب';

  @override
  String get forgotPasswordDescription =>
      'ایمیل خود را وارد کنید تا کد ۶ رقمی برای بازنشانی رمز عبور برایتان ارسال کنیم.';

  @override
  String get forgotPasswordEmailLabel => 'ایمیل';

  @override
  String get forgotPasswordEmptyEmailError =>
      'لطفاً آدرس ایمیل خود را وارد کنید.';

  @override
  String get forgotPasswordCodeSentSuccess =>
      'کد ارسال شد. صندوق ورودی خود را بررسی کنید.';

  @override
  String get forgotPasswordSendCodeButton => 'ارسال کد';

  @override
  String forgotPasswordStep2Description(Object email) {
    return 'کدی که به $email ارسال کردیم و رمز عبور جدیدتان را وارد کنید.';
  }

  @override
  String get forgotPasswordCodeInputLabel => 'کد ۸ رقمی';

  @override
  String get forgotPasswordInvalidCodeError =>
      'کد باید دقیقاً ۶ رقم داشته باشد.';

  @override
  String get forgotPasswordNewPasswordLabel => 'رمز عبور جدید';

  @override
  String get forgotPasswordShortPasswordError =>
      'رمز عبور باید حداقل ۶ کاراکتر داشته باشد.';

  @override
  String get forgotPasswordSavePasswordButton => 'ذخیره رمز عبور';

  @override
  String get forgotPasswordPasswordUpdatedSuccess =>
      'رمز عبور با موفقیت به‌روزرسانی شد! 🏆';

  @override
  String get validationEmailInvalid => 'آدرس ایمیل معتبر نیست.';

  @override
  String get paywallTitle => 'بدون تبلیغات لذت ببرید';

  @override
  String get paywallSubtitle =>
      'تمام ویژگی‌ها رایگان هستند. با Pro همه چیز را بدون وقفه لذت ببرید.';

  @override
  String get paywallBenefitScanner => 'اسکنر بدون تبلیغات میانی';

  @override
  String get paywallBenefitNoAds => 'بدون تبلیغات';

  @override
  String get paywallBenefitSync => 'همگام‌سازی ابری شامل';

  @override
  String paywallSubscribeButton(Object price) {
    return 'اشتراک · $price';
  }

  @override
  String get paywallPackageMonthly => 'ماهانه';

  @override
  String get paywallPackageAnnual => 'سالانه';

  @override
  String get paywallPackageWeekly => 'هفتگی';

  @override
  String get paywallPackageLifetime => 'مادام‌العمر';

  @override
  String get paywallPackageTwoMonth => 'هر ۲ ماه';

  @override
  String get paywallPackageThreeMonth => 'هر ۳ ماه';

  @override
  String get paywallPackageSixMonth => 'هر ۶ ماه';

  @override
  String get paywallRestorePurchases => 'بازیابی خریدها';

  @override
  String get paywallCancelAnytime => 'هر زمان لغو کنید. بدون تعهد.';

  @override
  String get paywallLoadError =>
      'بارگذاری طرح‌ها امکان‌پذیر نیست. اتصال خود را بررسی کنید.';

  @override
  String get paywallRetry => 'تلاش مجدد';

  @override
  String get paywallPurchaseError =>
      'خرید ناموفق بود. لطفاً دوباره امتحان کنید.';

  @override
  String get paywallRestoreError =>
      'بازیابی خریدها امکان‌پذیر نیست. لطفاً دوباره امتحان کنید.';

  @override
  String get paywallGuestTitle => 'برای اشتراک وارد شوید';

  @override
  String get paywallGuestBody =>
      'Pro به حساب شما مرتبط است. برای باز کردن همه ویژگی‌ها وارد شوید یا حساب ایجاد کنید.';

  @override
  String get paywallGuestSignInButton => 'ورود';

  @override
  String scannerDemoRemaining(Object count) {
    return '$count اسکن رایگان باقی‌مانده';
  }

  @override
  String get scannerDemoFinishedTitle => '۵ اسکن رایگان خود را استفاده کردید';

  @override
  String get scannerDemoFinishedSubtitle =>
      'برای اسکن نامحدود برچسب و تجربه بدون تبلیغات اشتراک بگیرید.';

  @override
  String get scannerDemoUnlockButton => 'مشاهده طرح‌های Pro';

  @override
  String get adDialogTitle => 'محتوای رایگان';

  @override
  String get adDialogBody =>
      'برای ادامه، یک تبلیغ کوتاه تماشا کنید یا در Pro مشترک شوید و تبلیغات را برای همیشه فراموش کنید.';

  @override
  String get adDialogWatchAd => 'تماشای تبلیغ';

  @override
  String get adDialogGetPro => 'دریافت Pro';

  @override
  String get adDialogNotNow => 'نه الان';

  @override
  String get scannerCameraInitError =>
      'دوربین قابل راه‌اندازی نیست. مطمئن شوید که برنامه دسترسی به دوربین را دارد.';

  @override
  String get variantSheetTitle => 'نسخه آلبوم';

  @override
  String get variantSheetInventoryNote =>
      'هنگام تغییر نسخه، موجودی شما حفظ می‌شود. استیکرهایی که دارید ثبت‌شده باقی می‌مانند.';

  @override
  String variantSheetLoadError(Object error) {
    return 'خطا در بارگذاری نسخه‌ها: $error';
  }

  @override
  String get variantSheetEmpty => 'هیچ نسخه‌ای برای این آلبوم موجود نیست.';

  @override
  String get variantSheetDefaultLabel => 'نسخه پیش‌فرض';

  @override
  String get variantMandatoryTitle => 'منطقه خود را انتخاب کنید';

  @override
  String get variantMandatorySubtitle =>
      'نسخه آلبوم مناسب منطقه خود را انتخاب کنید.';

  @override
  String variantChangedSuccess(Object name) {
    return 'نسخه به $name تغییر یافت ✅';
  }

  @override
  String get profileDeleteAccountButton => 'حذف حساب';

  @override
  String get profileDeleteAccountTitle => 'حذف حساب شما؟';

  @override
  String get profileDeleteAccountMessage =>
      'این عمل دائمی است. تمام داده‌های شما حذف خواهند شد و نمی‌توانید مجموعه‌تان را بازیابی کنید.';

  @override
  String get profileDeleteAccountConfirmButton => 'حذف دائمی';

  @override
  String get profileDeleteAccountSuccess => 'حساب شما حذف شد.';

  @override
  String get profileDeleteAccountError =>
      'خطا در حذف حساب. دوباره امتحان کنید.';

  @override
  String get paywallPrivacyPolicy => 'سیاست حریم خصوصی';

  @override
  String get paywallTermsOfUse => 'شرایط استفاده';

  @override
  String get paywallLegalDisclaimer =>
      'با اشتراک، شرایط استفاده و سیاست حریم خصوصی ما را می‌پذیرید.';

  @override
  String get tutorialSkip => 'رد کردن';

  @override
  String get tutorialTapToContinue => 'برای ادامه هر جایی را لمس کنید';

  @override
  String get tutorialStep1Title => 'پیشرفت کلی شما';

  @override
  String get tutorialStep1Body =>
      'اینجا تعداد برچسب‌های جمع‌آوری‌شده را می‌بینید. ادامه دهید!';

  @override
  String get tutorialStep2Title => 'جستجوی تیم‌ها';

  @override
  String get tutorialStep2Body =>
      'نام کشور یا تیمی را بنویسید تا فهرست فیلتر شود.';

  @override
  String get tutorialStep3Title => 'منوی اصلی';

  @override
  String get tutorialStep3Body =>
      'به پروفایل دسترسی پیدا کنید و نوع آلبوم را تغییر دهید.';

  @override
  String get tutorialStep4Title => 'اسکن برچسب‌ها';

  @override
  String get tutorialStep4Body =>
      'از دوربین برای اسکن و اضافه کردن خودکار برچسب‌ها استفاده کنید.';

  @override
  String get tutorialStep5Title => 'اشتراک‌گذاری فهرست';

  @override
  String get tutorialStep5Body =>
      'فهرست برچسب‌های ناقص یا تکراری را برای تبادل خروجی بگیرید.';

  @override
  String get globalTutorialStep1Title => 'فیلتر مجموعه';

  @override
  String get globalTutorialStep1Body =>
      'از این دکمه‌ها برای نمایش همه برچسب‌ها، فقط ناقص‌ها یا فقط تکراری‌ها استفاده کنید. ایده‌آل برای سازماندهی تبادل!';

  @override
  String get globalTutorialStep2Title => 'جستجوی برچسب';

  @override
  String get globalTutorialStep2Body =>
      'نام کشور، کد یا شماره برچسب را بنویسید تا سریع پیدا شود.';

  @override
  String get globalTutorialStep3Title => 'برای علامت‌گذاری لمس کنید';

  @override
  String get globalTutorialStep3Body =>
      'یک لمس روی برچسب خاکستری آن را به آلبوم اضافه می‌کند (طلایی می‌شود). لمس مجدد تأیید حذف خواسته می‌شود.';

  @override
  String get globalTutorialStep4Title => 'فشار طولانی برای گزینه‌های بیشتر';

  @override
  String get globalTutorialStep4Body =>
      'برچسب را نگه دارید تا تعداد نسخه‌های هر نوع (Normal, Gold, Legend...) را مدیریت کنید.';

  @override
  String get tutorialStep6Title => 'دسته‌بندی را کاوش کنید';

  @override
  String get tutorialStep6Body =>
      'روی هر کشور یا تیمی ضربه بزنید تا برچسب‌هایش را ببینید. آنجا می‌توانید آنچه دارید را علامت بزنید و تکراری‌ها را مدیریت کنید.';

  @override
  String get categoryTutorialStep1Title => 'برچسب‌ها را فیلتر کنید';

  @override
  String get categoryTutorialStep1Body =>
      'از این دکمه‌ها برای دیدن همه برچسب‌ها، فقط گم‌شده‌ها یا فقط تکراری‌ها استفاده کنید.';

  @override
  String get categoryTutorialStep2Title => 'برچسب را جستجو کنید';

  @override
  String get categoryTutorialStep2Body =>
      'نام کشور، کد یا شماره برچسب را تایپ کنید تا سریعاً پیدا شود.';

  @override
  String get categoryTutorialStep3Title => 'برای علامت‌گذاری ضربه بزنید';

  @override
  String get categoryTutorialStep3Body =>
      'ضربه زدن به یک برچسب خاکستری آن را به آلبوم اضافه می‌کند (طلایی می‌شود). اگر قبلاً آن را دارید، تأیید حذف درخواست می‌شود.';

  @override
  String get categoryTutorialStep4Title => 'نگه دارید برای گزینه‌های بیشتر';

  @override
  String get categoryTutorialStep4Body =>
      'نگه داشتن برچسب به شما امکان می‌دهد تعداد نسخه‌های هر نوع (Normal, Gold, Legend) را مدیریت کنید.';

  @override
  String get drawerReplayTutorial => 'مرور آموزش مجدد';

  @override
  String get variantTutorialTitle => 'منطقه خود را انتخاب کنید';

  @override
  String get variantTutorialBody =>
      'نسخه آلبوم مربوط به کشور یا منطقه خود را انتخاب کنید. این تعیین می‌کند کدام برچسب‌ها و نوع‌ها (Normal, Gold, Legend) در مجموعه شما نمایش داده می‌شوند.';

  @override
  String get drawerLegalNotice => 'اطلاعیه حقوقی';

  @override
  String get legalNoticeTitle => 'اطلاعیه حقوقی';

  @override
  String get legalNoticeBody =>
      'این اپلیکیشن یک اثر غیررسمی از طرفداران است و با هیچ سازمان رسمی فوتبال، سازنده برچسب، یا شریک رسمی مسابقات فوتبال وابستگی، تأیید یا ارتباطی ندارد. تمام علائم تجاری متعلق به صاحبان مربوطه آنها است.';

  @override
  String get statsTitle => 'آمار';

  @override
  String get statsTotalLabel => 'کل';

  @override
  String get statsCollectedLabel => 'جمع‌آوری شده';

  @override
  String get statsDuplicateCopiesLabel => 'تکراری‌ها';

  @override
  String get statsCategoriesTitle => 'بر اساس دسته‌بندی';

  @override
  String get statsAllCategories => 'همه';

  @override
  String get statsNoStatsYet =>
      'هنوز داده‌ای وجود ندارد. شروع به جمع‌آوری کنید!';

  @override
  String get statsBestCategory => 'بیشترین پیشرفت';

  @override
  String get statsWorstCategory => 'کمترین پیشرفت';

  @override
  String get statsCompletedCategories => 'کامل شده';

  @override
  String get drawerStats => 'آمار';

  @override
  String get statsCategoryPickerSearch => 'جستجوی دسته‌بندی...';

  @override
  String statsCategoryPickerSelected(Object count) {
    return '$count انتخاب شده';
  }

  @override
  String get statsCategoryPickerAll => 'همه دسته‌بندی‌ها';

  @override
  String get statsCategoryPickerClear => 'پاک کردن';

  @override
  String get statsSortTooltip => 'مرتب‌سازی';

  @override
  String get statsSortByName => 'دسته‌بندی';

  @override
  String get statsSortByProgressDesc => 'بیشترین پیشرفت اول';

  @override
  String get statsSortByProgressAsc => 'کمترین پیشرفت اول';

  @override
  String get statsSortByMissing => 'بیشترین کمبود اول';

  @override
  String get statsSortByDuplicates => 'بیشترین تکرار اول';

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
  String get drawerLookup => 'جستجوی استیکر';

  @override
  String get lookupScreenTitle => 'جستجوی استیکر';

  @override
  String get lookupTabManual => 'دستی';

  @override
  String get lookupTabScanner => 'اسکنر';

  @override
  String get lookupSearchHint => 'مثلاً: ECU 10، ARG 5، FRA 1...';

  @override
  String get lookupSearchButton => 'جستجو';

  @override
  String get lookupStickerNotFound => 'هیچ استیکری با این کد یافت نشد.';

  @override
  String get lookupStatusMissing => 'ندارید';

  @override
  String get lookupStatusCollected => 'دارید ✓';

  @override
  String lookupStatusDuplicates(Object count) {
    return '$count تکراری 🔁';
  }

  @override
  String get lookupQtyLabel => 'تعداد در موجودی شما';

  @override
  String get lookupScannerHint => 'استیکر را در مرکز قرار دهید تا شناسایی شود';

  @override
  String get lookupTutorialStep1Title => 'دو روش جستجو';

  @override
  String get lookupTutorialStep1Body =>
      'از تب دستی برای وارد کردن کد، یا از تب اسکنر برای استفاده استفاده کنید.';

  @override
  String get lookupTutorialStep2Title => 'کد را وارد کنید';

  @override
  String get lookupTutorialStep2Body =>
      'کد استیکر را مثل ECU 10 وارد کنید و جستجو را بزنید.';

  @override
  String get lookupTutorialStep3Title => 'بررسی و مدیریت';

  @override
  String get lookupTutorialStep3Body =>
      'میبینید این استیکر کم دارید یا نه. با دکمه‌های + و – موجودی را به‌روز کنید.';
}
