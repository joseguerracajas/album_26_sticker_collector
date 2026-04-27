// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'ألبوم 26';

  @override
  String get authWelcomeTitle => 'مرحباً بك في ألبوم 26';

  @override
  String get authEmailLabel => 'البريد الإلكتروني';

  @override
  String get authPasswordLabel => 'كلمة المرور';

  @override
  String get authLoginButton => 'تسجيل الدخول';

  @override
  String get authContinueWith => 'أو تابع باستخدام';

  @override
  String get authContinueGoogle => 'المتابعة مع Google';

  @override
  String get authContinueApple => 'المتابعة مع Apple';

  @override
  String get authContinueGuest => 'المتابعة كضيف';

  @override
  String get authNoAccountRegister => 'ليس لديك حساب؟ سجّل الآن';

  @override
  String get authForgotPassword => 'نسيت كلمة المرور؟';

  @override
  String get authResetPasswordEnterEmail =>
      'أدخل بريدك الإلكتروني لاستعادة كلمة المرور.';

  @override
  String get authResetPasswordEmailSent =>
      'لقد أرسلنا لك بريداً إلكترونياً لإعادة تعيين كلمة المرور.';

  @override
  String get authGuestMigratedSuccess =>
      'تم نقل تقدمك كضيف بنجاح إلى حسابك الجديد! 🏆';

  @override
  String get authGuestRemotePreserved =>
      'مرحباً بعودتك! تمت استعادة مجموعتك السحابية وتم تجاهل تقدم الضيف المحلي.';

  @override
  String commonErrorWithMessage(Object message) {
    return 'خطأ: $message';
  }

  @override
  String get authErrorInvalidCredentials =>
      'البريد الإلكتروني أو كلمة المرور غير صحيحة. تحقق من بياناتك وحاول مجدداً.';

  @override
  String get authErrorEmailNotConfirmed =>
      'لم يتم تأكيد بريدك الإلكتروني بعد. تحقق من صندوق الوارد.';

  @override
  String get authErrorUserAlreadyRegistered =>
      'يوجد حساب مرتبط بهذا البريد الإلكتروني بالفعل.';

  @override
  String get authErrorWeakPassword =>
      'كلمة المرور ضعيفة جداً. استخدم 6 أحرف على الأقل.';

  @override
  String get authErrorInvalidEmail => 'تنسيق البريد الإلكتروني غير صالح.';

  @override
  String get authErrorTokenExpired =>
      'انتهت صلاحية الرمز أو أنه غير صالح. يرجى طلب رمز جديد.';

  @override
  String get authErrorRateLimit =>
      'محاولات كثيرة جداً. انتظر لحظة قبل المحاولة مجدداً.';

  @override
  String get authErrorNetworkError =>
      'لا يوجد اتصال. تحقق من شبكتك وحاول مجدداً.';

  @override
  String get authErrorSessionExpired =>
      'انتهت جلستك. يرجى تسجيل الدخول مجدداً.';

  @override
  String get authErrorUnknown => 'حدث خطأ غير متوقع. يرجى المحاولة مجدداً.';

  @override
  String get registerTitle => 'إنشاء حساب';

  @override
  String get registerFillAllFields => 'يرجى ملء جميع الحقول.';

  @override
  String get registerEmailsDontMatch => 'عناوين البريد الإلكتروني غير متطابقة.';

  @override
  String get registerPasswordsDontMatch => 'كلمتا المرور غير متطابقتين.';

  @override
  String get registerPasswordMinLength =>
      'يجب أن تتكون كلمة المرور من 6 أحرف على الأقل.';

  @override
  String get registerAccountCreated =>
      'تم إنشاء الحساب بنجاح! ⚽ يرجى تسجيل الدخول.';

  @override
  String get registerConfirmEmailLabel => 'تأكيد البريد الإلكتروني';

  @override
  String get registerConfirmPasswordLabel => 'تأكيد كلمة المرور';

  @override
  String get registerSubmitButton => 'إنشاء حساب';

  @override
  String get profileTitle => 'ملفي الشخصي';

  @override
  String get profileOfficialCollector => 'جامع رسمي 🌟';

  @override
  String get profileChangePasswordButton => 'تحديث كلمة المرور';

  @override
  String get profileChangePasswordTitle => 'تحديث كلمة المرور';

  @override
  String get profileNewPasswordLabel => 'كلمة المرور الجديدة';

  @override
  String get profileConfirmNewPasswordLabel => 'تأكيد كلمة المرور الجديدة';

  @override
  String get profilePasswordUpdatedSuccess => 'تم تحديث كلمة المرور بنجاح.';

  @override
  String get profileLogoutButton => 'تسجيل الخروج';

  @override
  String get profileLogoutSuccess => 'تم تسجيل خروجك بنجاح.';

  @override
  String get profileUnknownUser => 'مستخدم غير معروف';

  @override
  String profileLogoutError(Object message) {
    return 'خطأ في تسجيل الخروج: $message';
  }

  @override
  String get homeTitle => 'ألبومي 26';

  @override
  String get homeProfileTooltip => 'ملفي الشخصي';

  @override
  String get drawerSignIn => 'تسجيل الدخول';

  @override
  String get homeShareAll => 'مشاركة القائمة الكاملة';

  @override
  String get homeShareMissingOnly => 'المفقودة فقط';

  @override
  String get homeShareDuplicatesOnly => 'المكررة فقط';

  @override
  String get homeGlobalProgressTitle => 'التقدم الإجمالي';

  @override
  String homeCollectedCount(Object collected, Object total) {
    return '$collected من $total تم جمعها';
  }

  @override
  String get homeViewFullCollection => 'عرض المجموعة الكاملة';

  @override
  String get homeTeamsTitle => 'المنتخبات';

  @override
  String get homeSearchTeamsHint => 'ابحث بالدولة أو الفريق...';

  @override
  String get homeNoResults => 'لم يتم العثور على فرق';

  @override
  String get homeScanButton => 'مسح ملصق';

  @override
  String homeObtainedCount(Object collected, Object total) {
    return '$collected من $total تم الحصول عليها';
  }

  @override
  String get homeProgressError => 'خطأ';

  @override
  String get globalCollectionTitle => 'المجموعة الكاملة';

  @override
  String get filterAll => 'الكل';

  @override
  String get filterMissing => 'المفقودة';

  @override
  String get filterDuplicates => 'المكررة';

  @override
  String get filterSearchHint => 'ابحث بالدولة أو الرمز أو الرقم...';

  @override
  String get stickerRemoveTitle => 'إزالة الملصق؟';

  @override
  String stickerRemoveConfirm(Object stickerLabel) {
    return 'هل أنت متأكد أنك تريد إزالة الملصق $stickerLabel من ألبومك؟';
  }

  @override
  String get commonCancel => 'إلغاء';

  @override
  String get commonRemove => 'إزالة';

  @override
  String get commonDone => 'تم';

  @override
  String get gridNoResults => 'لم يتم العثور على ملصقات.';

  @override
  String scannerViewScannedButton(Object count) {
    return 'مراجعة $count ملصقات تم مسحها';
  }

  @override
  String get scannerOverlayHint => 'ضع ظهر الملصق في المنتصف هنا';

  @override
  String get pendingScansTitle => 'الملصقات الممسوحة';

  @override
  String get pendingScansEmpty => 'لم تقم بمسح أي ملصق بعد';

  @override
  String pendingScansItemLabel(Object code) {
    return 'ملصق: $code';
  }

  @override
  String pendingScansSavedSuccess(Object count) {
    return 'تمت إضافة $count ملصقات إلى ألبومك! 🏆';
  }

  @override
  String pendingScansSaveError(Object message) {
    return 'خطأ في الحفظ: $message';
  }

  @override
  String get shareHeader => '⚽ *قائمة تبادل ألبوم 26* 🏆';

  @override
  String get shareMissingSectionTitle => '❌ *المفقودة:*';

  @override
  String get shareDuplicatesSectionTitle => '🔁 *المكررة:*';

  @override
  String get shareNoneMissing => 'لا شيء! 😎';

  @override
  String get shareNoDuplicates => 'لا مكررات 😅';

  @override
  String get shareLetsTrade => 'هل تريد التبادل؟ 👀🔥';

  @override
  String get shareSeparator => '--------------------------';

  @override
  String get forgotPasswordTitle => 'استعادة الحساب';

  @override
  String get forgotPasswordDescription =>
      'أدخل بريدك الإلكتروني وسنرسل لك رمزاً مكوناً من 6 أرقام لإعادة تعيين كلمة المرور.';

  @override
  String get forgotPasswordEmailLabel => 'البريد الإلكتروني';

  @override
  String get forgotPasswordEmptyEmailError => 'يرجى إدخال بريدك الإلكتروني.';

  @override
  String get forgotPasswordCodeSentSuccess =>
      'تم إرسال الرمز. تحقق من صندوق الوارد.';

  @override
  String get forgotPasswordSendCodeButton => 'إرسال الرمز';

  @override
  String forgotPasswordStep2Description(Object email) {
    return 'أدخل الرمز الذي أرسلناه إلى $email وكلمة مرورك الجديدة.';
  }

  @override
  String get forgotPasswordCodeInputLabel => 'رمز مكون من 8 أرقام';

  @override
  String get forgotPasswordInvalidCodeError =>
      'يجب أن يتكون الرمز من 6 أرقام بالضبط.';

  @override
  String get forgotPasswordNewPasswordLabel => 'كلمة المرور الجديدة';

  @override
  String get forgotPasswordShortPasswordError =>
      'يجب أن تتكون كلمة المرور من 6 أحرف على الأقل.';

  @override
  String get forgotPasswordSavePasswordButton => 'حفظ كلمة المرور';

  @override
  String get forgotPasswordPasswordUpdatedSuccess =>
      'تم تحديث كلمة المرور بنجاح! 🏆';

  @override
  String get validationEmailInvalid => 'عنوان البريد الإلكتروني غير صالح.';

  @override
  String get paywallTitle => 'استمتع بدون إعلانات';

  @override
  String get paywallSubtitle =>
      'جميع الميزات متاحة مجاناً. مع Pro تستمتع بكل شيء دون انقطاع.';

  @override
  String get paywallBenefitScanner => 'ماسح بدون إعلانات بينية';

  @override
  String get paywallBenefitNoAds => 'بدون إعلانات';

  @override
  String get paywallBenefitSync => 'مزامنة سحابية مضمّنة';

  @override
  String paywallSubscribeButton(Object price) {
    return 'اشترك · $price';
  }

  @override
  String get paywallPackageMonthly => 'شهري';

  @override
  String get paywallPackageAnnual => 'سنوي';

  @override
  String get paywallPackageWeekly => 'أسبوعي';

  @override
  String get paywallPackageLifetime => 'مدى الحياة';

  @override
  String get paywallPackageTwoMonth => 'كل شهرين';

  @override
  String get paywallPackageThreeMonth => 'كل 3 أشهر';

  @override
  String get paywallPackageSixMonth => 'كل 6 أشهر';

  @override
  String get paywallRestorePurchases => 'استعادة المشتريات';

  @override
  String get paywallCancelAnytime => 'إلغاء في أي وقت. بدون التزامات.';

  @override
  String get paywallLoadError => 'تعذّر تحميل الخطط. تحقق من اتصالك.';

  @override
  String get paywallRetry => 'إعادة المحاولة';

  @override
  String get paywallPurchaseError => 'فشل الشراء. يرجى المحاولة مجدداً.';

  @override
  String get paywallRestoreError =>
      'تعذّر استعادة المشتريات. يرجى المحاولة مجدداً.';

  @override
  String get paywallGuestTitle => 'سجّل الدخول للاشتراك';

  @override
  String get paywallGuestBody =>
      'Pro مرتبط بحسابك. سجّل الدخول أو أنشئ حساباً لفتح جميع الميزات.';

  @override
  String get paywallGuestSignInButton => 'تسجيل الدخول';

  @override
  String scannerDemoRemaining(Object count) {
    return '$count مسح مجاني متبقٍ';
  }

  @override
  String get scannerDemoFinishedTitle => 'لقد استخدمت مسحاتك الخمس المجانية';

  @override
  String get scannerDemoFinishedSubtitle =>
      'اشترك لمسح ملصقات غير محدودة والاستمتاع بتجربة خالية من الإعلانات.';

  @override
  String get scannerDemoUnlockButton => 'عرض خطط Pro';

  @override
  String get adDialogTitle => 'محتوى مجاني';

  @override
  String get adDialogBody =>
      'للمتابعة، شاهد إعلاناً قصيراً أو اشترك في Pro وانسَ الإعلانات للأبد.';

  @override
  String get adDialogWatchAd => 'مشاهدة إعلان';

  @override
  String get adDialogGetPro => 'الحصول على Pro';

  @override
  String get adDialogNotNow => 'ليس الآن';

  @override
  String get scannerCameraInitError =>
      'تعذّر تهيئة الكاميرا. تأكد من أن التطبيق يمتلك إذن الوصول إلى الكاميرا.';

  @override
  String get variantSheetTitle => 'نوع الألبوم';

  @override
  String get variantSheetInventoryNote =>
      'تظل مجموعتك محفوظة عند تغيير النوع. الملصقات التي لديك بالفعل تبقى مسجّلة.';

  @override
  String variantSheetLoadError(Object error) {
    return 'خطأ في تحميل الأنواع: $error';
  }

  @override
  String get variantSheetEmpty => 'لا توجد أنواع متاحة لهذا الألبوم.';

  @override
  String get variantSheetDefaultLabel => 'النوع الافتراضي';

  @override
  String get variantMandatoryTitle => 'اختر منطقتك';

  @override
  String get variantMandatorySubtitle => 'اختر إصدار الألبوم المناسب لمنطقتك.';

  @override
  String variantChangedSuccess(Object name) {
    return 'تم التغيير إلى $name ✅';
  }
}
