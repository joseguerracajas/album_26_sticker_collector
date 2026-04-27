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
}
