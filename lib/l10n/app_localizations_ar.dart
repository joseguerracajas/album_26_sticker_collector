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

  @override
  String get profileDeleteAccountButton => 'حذف الحساب';

  @override
  String get profileDeleteAccountTitle => 'حذف حسابك؟';

  @override
  String get profileDeleteAccountMessage =>
      'هذا الإجراء دائم. سيتم حذف جميع بياناتك ولن تتمكن من استعادة مجموعتك.';

  @override
  String get profileDeleteAccountConfirmButton => 'حذف نهائياً';

  @override
  String get profileDeleteAccountSuccess => 'تم حذف حسابك.';

  @override
  String get profileDeleteAccountError => 'خطأ في حذف الحساب. حاول مرة أخرى.';

  @override
  String get paywallPrivacyPolicy => 'سياسة الخصوصية';

  @override
  String get paywallTermsOfUse => 'شروط الاستخدام';

  @override
  String get paywallLegalDisclaimer =>
      'بالاشتراك، فإنك توافق على شروط الاستخدام وسياسة الخصوصية.';

  @override
  String get tutorialSkip => 'تخطَّ';

  @override
  String get tutorialTapToContinue => 'اضغط في أي مكان للمتابعة';

  @override
  String get tutorialStep1Title => 'تقدمك العام';

  @override
  String get tutorialStep1Body => 'هنا ترى عدد الملصقات التي جمعتها. استمر!';

  @override
  String get tutorialStep2Title => 'ابحث عن الفرق';

  @override
  String get tutorialStep2Body => 'اكتب اسم بلد أو فريق لتصفية القائمة.';

  @override
  String get tutorialStep3Title => 'القائمة الرئيسية';

  @override
  String get tutorialStep3Body => 'ادخل إلى ملفك الشخصي وغيّر نسخة الألبوم.';

  @override
  String get tutorialStep4Title => 'مسح الملصقات';

  @override
  String get tutorialStep4Body =>
      'استخدم الكاميرا لمسح الملصقات وإضافتها تلقائيًا.';

  @override
  String get tutorialStep5Title => 'مشاركة القائمة';

  @override
  String get tutorialStep5Body =>
      'صدّر قائمة الملصقات الناقصة أو المكررة لمبادلتها.';

  @override
  String get globalTutorialStep1Title => 'تصفية المجموعة';

  @override
  String get globalTutorialStep1Body =>
      'استخدم هذه الأزرار لرؤية جميع ملصقاتك أو الناقصة فقط أو المكررة فقط. مثالي لتنظيم التبادل!';

  @override
  String get globalTutorialStep2Title => 'ابحث عن ملصق';

  @override
  String get globalTutorialStep2Body =>
      'اكتب اسم البلد أو الرمز أو رقم الملصق للعثور عليه بسرعة.';

  @override
  String get globalTutorialStep3Title => 'اضغط للتحديد';

  @override
  String get globalTutorialStep3Body =>
      'ضغطة واحدة على ملصق رمادي تضيفه إلى ألبومك (يصبح ذهبياً). إذا ضغطت مرة أخرى ستُطلب منك تأكيد الحذف.';

  @override
  String get globalTutorialStep4Title => 'اضغط مطولاً للمزيد من الخيارات';

  @override
  String get globalTutorialStep4Body =>
      'اضغط مطولاً على ملصق لإدارة عدد النسخ لكل نوع (Normal, Gold, Legend...).';

  @override
  String get tutorialStep6Title => 'استكشف فئة';

  @override
  String get tutorialStep6Body =>
      'اضغط على أي دولة أو فريق لعرض ملصقاته. هناك يمكنك تحديد ما لديك وإدارة المكرر.';

  @override
  String get categoryTutorialStep1Title => 'تصفية الملصقات';

  @override
  String get categoryTutorialStep1Body =>
      'استخدم هذه الأزرار لعرض جميع الملصقات أو الناقصة فقط أو المكررة فقط.';

  @override
  String get categoryTutorialStep2Title => 'ابحث عن ملصق';

  @override
  String get categoryTutorialStep2Body =>
      'اكتب اسم الدولة أو الرمز أو رقم الملصق للعثور عليه بسرعة.';

  @override
  String get categoryTutorialStep3Title => 'اضغط للتحديد';

  @override
  String get categoryTutorialStep3Body =>
      'الضغط على ملصق رمادي يضيفه للبومك (يصبح ذهبياً). إذا كان لديك بالفعل وضغطت مجدداً، ستُطلب منك تأكيد الحذف.';

  @override
  String get categoryTutorialStep4Title => 'اضغط مطولاً لمزيد من الخيارات';

  @override
  String get categoryTutorialStep4Body =>
      'الضغط المطول يتيح لك إدارة عدد نسخك من كل نسخة (Normal, Gold, Legend).';

  @override
  String get drawerReplayTutorial => 'إعادة مشاهدة الدليل';

  @override
  String get variantTutorialTitle => 'اختر منطقتك';

  @override
  String get variantTutorialBody =>
      'اختر نسخة الألبوم التي تتوافق مع بلدك أو منطقتك. هذا يحدد الملصقات والنسخ (Normal, Gold, Legend) التي ستظهر في مجموعتك.';

  @override
  String get drawerLegalNotice => 'إشعار قانوني';

  @override
  String get legalNoticeTitle => 'إشعار قانوني';

  @override
  String get legalNoticeBody =>
      'هذا التطبيق هو إنشاء غير رسمي من قبل المعجبين وليس مرتبطًا أو مدعومًا أو متصلاً بأي منظمة كرة قدم رسمية أو صانع ملصقات أو أي شريك رسمي في بطولة كرة القدم. جميع العلامات التجارية هي ملك لأصحابها المعنيين.';

  @override
  String get statsTitle => 'إحصائيات';

  @override
  String get statsTotalLabel => 'الإجمالي';

  @override
  String get statsCollectedLabel => 'المجمّعة';

  @override
  String get statsDuplicateCopiesLabel => 'مكررة';

  @override
  String get statsCategoriesTitle => 'حسب الفئة';

  @override
  String get statsAllCategories => 'الكل';

  @override
  String get statsNoStatsYet => 'لا توجد بيانات بعد. ابدأ بالتجميع!';

  @override
  String get statsBestCategory => 'أعلى تقدم';

  @override
  String get statsWorstCategory => 'أدنى تقدم';

  @override
  String get statsCompletedCategories => 'مكتملة';

  @override
  String get drawerStats => 'إحصائيات';

  @override
  String get statsCategoryPickerSearch => 'ابحث عن فئة...';

  @override
  String statsCategoryPickerSelected(Object count) {
    return '$count محددة';
  }

  @override
  String get statsCategoryPickerAll => 'جميع الفئات';

  @override
  String get statsCategoryPickerClear => 'مسح';

  @override
  String get statsSortTooltip => 'ترتيب';

  @override
  String get statsSortByName => 'الفئة';

  @override
  String get statsSortByProgressDesc => 'الأعلى تقدماً أولاً';

  @override
  String get statsSortByProgressAsc => 'الأدنى تقدماً أولاً';

  @override
  String get statsSortByMissing => 'الأكثر نقصاً أولاً';

  @override
  String get statsSortByDuplicates => 'الأكثر تكراراً أولاً';

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
  String get drawerLookup => 'البحث عن ملصق';

  @override
  String get lookupScreenTitle => 'البحث عن ملصق';

  @override
  String get lookupTabManual => 'يدوي';

  @override
  String get lookupTabScanner => 'ماسح ضوئي';

  @override
  String get lookupSearchHint => 'مثال: ECU 10، ARG 5، FRA 1...';

  @override
  String get lookupSearchButton => 'بحث';

  @override
  String get lookupStickerNotFound => 'لم يُعثر على أي ملصق بهذا الرمز.';

  @override
  String get lookupStatusMissing => 'مفقود';

  @override
  String get lookupStatusCollected => 'لديك بالفعل ✓';

  @override
  String lookupStatusDuplicates(Object count) {
    return '$count مكرر(ات) 🔁';
  }

  @override
  String get lookupQtyLabel => 'الكمية في مخزونك';

  @override
  String get lookupScannerHint => 'ضع الملصق في المنتصف للتعرف عليه';

  @override
  String get lookupTutorialStep1Title => 'طريقتان للبحث';

  @override
  String get lookupTutorialStep1Body =>
      'استخدم تبويب يدوي لإدخال رمز الملصق، أو تبويب الماسح لتوجيه الكاميرا.';

  @override
  String get lookupTutorialStep2Title => 'أدخل الرمز';

  @override
  String get lookupTutorialStep2Body =>
      'اكتب رمز الملصق كما يظهر في الألبوم، مثل ECU 10 أو ARG 5.';

  @override
  String get lookupTutorialStep3Title => 'استعرض وأدر';

  @override
  String get lookupTutorialStep3Body =>
      'سترى إذا كان الملصق مفقوداً أو موجوداً. استخدم زري + و – لتحديث مخزونك.';
}
