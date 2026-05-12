// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get appTitle => 'Sticker Album 2026';

  @override
  String get authWelcomeTitle => 'ברוך הבא ל-Sticker Album 2026';

  @override
  String get authEmailLabel => 'דוא\"ל';

  @override
  String get authPasswordLabel => 'סיסמה';

  @override
  String get authLoginButton => 'התחברות';

  @override
  String get authContinueWith => 'או המשך עם';

  @override
  String get authContinueGoogle => 'המשך עם Google';

  @override
  String get authContinueApple => 'המשך עם Apple';

  @override
  String get authContinueGuest => 'המשך כאורח';

  @override
  String get authNoAccountRegister => 'אין לך חשבון? הירשם';

  @override
  String get authForgotPassword => 'שכחת את הסיסמה?';

  @override
  String get authResetPasswordEnterEmail =>
      'הזן את הדוא\"ל שלך כדי לשחזר את הסיסמה.';

  @override
  String get authResetPasswordEmailSent => 'שלחנו לך דוא\"ל לאיפוס הסיסמה.';

  @override
  String get authGuestMigratedSuccess =>
      'ההתקדמות שלך כאורח הועברה בהצלחה לחשבון החדש שלך! 🏆';

  @override
  String get authGuestRemotePreserved =>
      'ברוך שובך! האוסף שלך מהענן שוחזר וההתקדמות המקומית נמחקה.';

  @override
  String commonErrorWithMessage(Object message) {
    return 'שגיאה: $message';
  }

  @override
  String get authErrorInvalidCredentials =>
      'דוא\"ל או סיסמה שגויים. בדוק את הפרטים ונסה שוב.';

  @override
  String get authErrorEmailNotConfirmed =>
      'הדוא\"ל שלך טרם אושר. בדוק את תיבת הדואר הנכנס.';

  @override
  String get authErrorUserAlreadyRegistered => 'כבר קיים חשבון עם דוא\"ל זה.';

  @override
  String get authErrorWeakPassword => 'הסיסמה חלשה מדי. השתמש לפחות ב-6 תווים.';

  @override
  String get authErrorInvalidEmail => 'פורמט כתובת הדוא\"ל אינו חוקי.';

  @override
  String get authErrorTokenExpired =>
      'הקוד פג תוקף או אינו חוקי. אנא בקש קוד חדש.';

  @override
  String get authErrorRateLimit =>
      'יותר מדי ניסיונות. המתן רגע לפני שתנסה שוב.';

  @override
  String get authErrorNetworkError => 'אין חיבור. בדוק את הרשת שלך ונסה שוב.';

  @override
  String get authErrorSessionExpired => 'פג תוקף הפגישה שלך. אנא התחבר מחדש.';

  @override
  String get authErrorUnknown => 'אירעה שגיאה בלתי צפויה. אנא נסה שוב.';

  @override
  String get registerTitle => 'יצירת חשבון';

  @override
  String get registerFillAllFields => 'אנא מלא את כל השדות.';

  @override
  String get registerEmailsDontMatch => 'כתובות הדוא\"ל אינן תואמות.';

  @override
  String get registerPasswordsDontMatch => 'הסיסמאות אינן תואמות.';

  @override
  String get registerPasswordMinLength => 'הסיסמה חייבת להכיל לפחות 6 תווים.';

  @override
  String get registerAccountCreated => 'החשבון נוצר בהצלחה! ⚽ אנא התחבר.';

  @override
  String get registerConfirmEmailLabel => 'אישור דוא\"ל';

  @override
  String get registerConfirmPasswordLabel => 'אישור סיסמה';

  @override
  String get registerSubmitButton => 'הרשמה';

  @override
  String get profileTitle => 'הפרופיל שלי';

  @override
  String get profileOfficialCollector => 'אספן רשמי 🌟';

  @override
  String get profileChangePasswordButton => 'עדכון סיסמה';

  @override
  String get profileChangePasswordTitle => 'עדכון סיסמה';

  @override
  String get profileNewPasswordLabel => 'סיסמה חדשה';

  @override
  String get profileConfirmNewPasswordLabel => 'אישור סיסמה חדשה';

  @override
  String get profilePasswordUpdatedSuccess => 'הסיסמה עודכנה בהצלחה.';

  @override
  String get profileLogoutButton => 'התנתקות';

  @override
  String get profileLogoutSuccess => 'התנתקת בהצלחה.';

  @override
  String get profileUnknownUser => 'משתמש לא ידוע';

  @override
  String profileLogoutError(Object message) {
    return 'שגיאה בהתנתקות: $message';
  }

  @override
  String get homeTitle => 'Sticker Album 2026';

  @override
  String get homeProfileTooltip => 'הפרופיל שלי';

  @override
  String get drawerSignIn => 'התחבר';

  @override
  String get homeShareAll => 'שתף רשימה מלאה';

  @override
  String get homeShareMissingOnly => 'חסרים בלבד';

  @override
  String get homeShareDuplicatesOnly => 'כפולות בלבד';

  @override
  String get homeGlobalProgressTitle => 'התקדמות כללית';

  @override
  String homeCollectedCount(Object collected, Object total) {
    return '$collected מתוך $total נאספו';
  }

  @override
  String get homeViewFullCollection => 'הצג אוסף מלא';

  @override
  String get homeTeamsTitle => 'קבוצות';

  @override
  String get homeSearchTeamsHint => 'חפש לפי מדינה או קבוצה...';

  @override
  String get homeNoResults => 'לא נמצאו קבוצות';

  @override
  String get homeScanButton => 'סרוק מדבקה';

  @override
  String homeObtainedCount(Object collected, Object total) {
    return '$collected מתוך $total התקבלו';
  }

  @override
  String get homeProgressError => 'שגיאה';

  @override
  String get globalCollectionTitle => 'אוסף מלא';

  @override
  String get filterAll => 'הכל';

  @override
  String get filterMissing => 'חסרים';

  @override
  String get filterDuplicates => 'כפולות';

  @override
  String get filterSearchHint => 'חפש לפי מדינה, קוד או מספר...';

  @override
  String get stickerRemoveTitle => 'להסיר מדבקה?';

  @override
  String stickerRemoveConfirm(Object stickerLabel) {
    return 'האם אתה בטוח שברצונך להסיר את המדבקה $stickerLabel מהאלבום שלך?';
  }

  @override
  String get commonCancel => 'ביטול';

  @override
  String get commonRemove => 'הסרה';

  @override
  String get commonDone => 'סיום';

  @override
  String get gridNoResults => 'לא נמצאו מדבקות.';

  @override
  String scannerViewScannedButton(Object count) {
    return 'סקור $count מדבקות שנסרקו';
  }

  @override
  String get scannerOverlayHint => 'מקם את גב המדבקה כאן במרכז';

  @override
  String get pendingScansTitle => 'מדבקות שנסרקו';

  @override
  String get pendingScansEmpty => 'עדיין לא סרקת אף מדבקה';

  @override
  String pendingScansItemLabel(Object code) {
    return 'מדבקה: $code';
  }

  @override
  String pendingScansSavedSuccess(Object count) {
    return '$count מדבקות נוספו לאלבום שלך! 🏆';
  }

  @override
  String pendingScansSaveError(Object message) {
    return 'שגיאה בשמירה: $message';
  }

  @override
  String get shareHeader => '⚽ *רשימת החלפות Sticker Album 2026* 🏆';

  @override
  String get shareMissingSectionTitle => '❌ *חסרים:*';

  @override
  String get shareDuplicatesSectionTitle => '🔁 *כפולות:*';

  @override
  String get shareNoneMissing => 'אין! 😎';

  @override
  String get shareNoDuplicates => 'אין כפולות 😅';

  @override
  String get shareLetsTrade => 'רוצה להחליף? 👀🔥';

  @override
  String shareDownloadLink(String appName) {
    return '📲 הורד את האפליקציה של $appName\nhttps://onelink.to/5adrft?olbm=1';
  }

  @override
  String get shareSeparator => '--------------------------';

  @override
  String get forgotPasswordTitle => 'שחזור חשבון';

  @override
  String get forgotPasswordDescription =>
      'הזן את כתובת הדוא\"ל שלך ונשלח לך קוד בן 6 ספרות לאיפוס הסיסמה.';

  @override
  String get forgotPasswordEmailLabel => 'דוא\"ל';

  @override
  String get forgotPasswordEmptyEmailError => 'אנא הזן את כתובת הדוא\"ל שלך.';

  @override
  String get forgotPasswordCodeSentSuccess =>
      'קוד נשלח. בדוק את תיבת הדואר הנכנס.';

  @override
  String get forgotPasswordSendCodeButton => 'שלח קוד';

  @override
  String forgotPasswordStep2Description(Object email) {
    return 'הזן את הקוד ששלחנו ל-$email והסיסמה החדשה שלך.';
  }

  @override
  String get forgotPasswordCodeInputLabel => 'קוד בן 8 ספרות';

  @override
  String get forgotPasswordInvalidCodeError => 'הקוד חייב להכיל בדיוק 6 ספרות.';

  @override
  String get forgotPasswordNewPasswordLabel => 'סיסמה חדשה';

  @override
  String get forgotPasswordShortPasswordError =>
      'הסיסמה חייבת להכיל לפחות 6 תווים.';

  @override
  String get forgotPasswordSavePasswordButton => 'שמור סיסמה';

  @override
  String get forgotPasswordPasswordUpdatedSuccess => 'הסיסמה עודכנה בהצלחה! 🏆';

  @override
  String get validationEmailInvalid => 'כתובת האימייל אינה תקינה.';

  @override
  String get paywallTitle => 'תהנה ללא פרסומות';

  @override
  String get paywallSubtitle =>
      'כל התכונות זמינות בחינם. עם Pro תהנה מהכל ללא הפרעות.';

  @override
  String get paywallBenefitScanner => 'סורק ללא מודעות interstitial';

  @override
  String get paywallBenefitNoAds => 'ללא פרסומות';

  @override
  String get paywallBenefitSync => 'סנכרון ענן כלול';

  @override
  String paywallSubscribeButton(Object price) {
    return 'הירשם · $price';
  }

  @override
  String get paywallPackageMonthly => 'חודשי';

  @override
  String get paywallPackageAnnual => 'שנתי';

  @override
  String get paywallPackageWeekly => 'שבועי';

  @override
  String get paywallPackageLifetime => 'לכל החיים';

  @override
  String get paywallPackageTwoMonth => 'כל חודשיים';

  @override
  String get paywallPackageThreeMonth => 'כל 3 חודשים';

  @override
  String get paywallPackageSixMonth => 'כל 6 חודשים';

  @override
  String get paywallBestOption => 'Mejor opción';

  @override
  String get paywallStartFreeTrial => 'Comenzar prueba gratis';

  @override
  String get paywallRestorePurchases => 'שחזור רכישות';

  @override
  String get paywallCancelAnytime => 'בטל בכל עת. ללא התחייבות.';

  @override
  String get paywallLoadError =>
      'לא ניתן לטעון את התוכניות. בדוק את החיבור שלך.';

  @override
  String get paywallRetry => 'נסה שוב';

  @override
  String get paywallPurchaseError => 'הרכישה נכשלה. אנא נסה שוב.';

  @override
  String get paywallRestoreError => 'לא ניתן לשחזר את הרכישות. אנא נסה שוב.';

  @override
  String get paywallGuestTitle => 'התחבר כדי להירשם';

  @override
  String get paywallGuestBody =>
      'Pro מקושר לחשבון שלך. התחבר או צור חשבון כדי לפתוח את כל התכונות.';

  @override
  String get paywallGuestSignInButton => 'התחברות';

  @override
  String scannerDemoRemaining(Object count) {
    return '$count סריקות חינמיות נותרו';
  }

  @override
  String get scannerDemoFinishedTitle => 'השתמשת ב-5 הסריקות החינמיות שלך';

  @override
  String get scannerDemoFinishedSubtitle =>
      'הירשם לסריקת מדבקות ללא הגבלה ולחוויה ללא פרסומות.';

  @override
  String get scannerDemoUnlockButton => 'הצג תוכניות Pro';

  @override
  String get adDialogTitle => 'תוכן חינמי';

  @override
  String get adDialogBody =>
      'כדי להמשיך, צפה במודעה קצרה או הירשם ל-Pro ושכח מפרסומות לנצח.';

  @override
  String get adDialogWatchAd => 'צפה במודעה';

  @override
  String get adDialogGetPro => 'קבל Pro';

  @override
  String get adDialogNotNow => 'לא עכשיו';

  @override
  String get scannerCameraInitError =>
      'לא ניתן לאתחל את המצלמה. ודא שלאפליקציה יש הרשאת גישה למצלמה.';

  @override
  String get variantSheetTitle => 'גרסת האלבום';

  @override
  String get variantSheetInventoryNote =>
      'המלאי שלך נשמר בעת החלפת גרסה. המדבקות שכבר יש לך נשארות רשומות.';

  @override
  String variantSheetLoadError(Object error) {
    return 'שגיאה בטעינת הגרסאות: $error';
  }

  @override
  String get variantSheetEmpty => 'אין גרסאות זמינות לאלבום זה.';

  @override
  String get variantSheetDefaultLabel => 'גרסת ברירת מחדל';

  @override
  String get variantMandatoryTitle => 'בחר את האזור שלך';

  @override
  String get variantMandatorySubtitle => 'בחר את גרסת האלבום לאזורך.';

  @override
  String variantChangedSuccess(Object name) {
    return 'הגרסה שונתה ל-$name ✅';
  }

  @override
  String get profileDeleteAccountButton => 'מחק חשבון';

  @override
  String get profileDeleteAccountTitle => 'למחוק את החשבון שלך?';

  @override
  String get profileDeleteAccountMessage =>
      'פעולה זו היא קבועה. כל הנתונים שלך יימחקו ולא תוכל לשחזר את האוסף שלך.';

  @override
  String get profileDeleteAccountConfirmButton => 'מחק לצמיתות';

  @override
  String get profileDeleteAccountSuccess => 'החשבון שלך נמחק.';

  @override
  String get profileDeleteAccountError => 'שגיאה במחיקת החשבון. נסה שוב.';

  @override
  String get paywallPrivacyPolicy => 'מדיניות פרטיות';

  @override
  String get paywallTermsOfUse => 'תנאי שימוש';

  @override
  String get paywallLegalDisclaimer =>
      'על ידי מנוי, אתה מסכים לתנאי השימוש ולמדיניות הפרטיות שלנו.';

  @override
  String get tutorialSkip => 'דלג';

  @override
  String get tutorialTapToContinue => 'הקש בכל מקום כדי להמשיך';

  @override
  String get tutorialStep1Title => 'ההתקדמות הכוללת שלך';

  @override
  String get tutorialStep1Body => 'ראה כמה מדבקות אספת. המשך לאסוף!';

  @override
  String get tutorialStep2Title => 'חפש קבוצות';

  @override
  String get tutorialStep2Body => 'הקלד שם מדינה או קבוצה לסינון הרשימה.';

  @override
  String get tutorialStep3Title => 'תפריט ראשי';

  @override
  String get tutorialStep3Body => 'גש לפרופיל שלך ושנה גרסת אלבום.';

  @override
  String get tutorialStep4Title => 'סרוק מדבקות';

  @override
  String get tutorialStep4Body =>
      'השתמש במצלמה לסריקת מדבקות והוספתן אוטומטית.';

  @override
  String get tutorialStep5Title => 'שתף רשימה';

  @override
  String get tutorialStep5Body =>
      'ייצא את רשימת המדבקות החסרות או הכפולות להחלפה.';

  @override
  String get globalTutorialStep1Title => 'סנן את האוסף';

  @override
  String get globalTutorialStep1Body =>
      'השתמש בכפתורים כדי לראות את כל המדבקות, רק החסרות או רק הכפולות. מושלם לארגון החלפות!';

  @override
  String get globalTutorialStep2Title => 'חפש מדבקה';

  @override
  String get globalTutorialStep2Body =>
      'הקלד שם מדינה, קוד או מספר מדבקה כדי למצוא אותה במהירות.';

  @override
  String get globalTutorialStep3Title => 'הקש כדי לסמן';

  @override
  String get globalTutorialStep3Body =>
      'הקשה אחת על מדבקה אפורה מוסיפה אותה לאלבום (הופכת לזהובה). הקשה נוספת תדרוש אישור הסרה.';

  @override
  String get globalTutorialStep4Title => 'לחיצה ארוכה לאפשרויות נוספות';

  @override
  String get globalTutorialStep4Body =>
      'החזק מדבקה לחוצה כדי לנהל כמה עותקים יש לך מכל גרסה (Normal, Gold, Legend...).';

  @override
  String get tutorialStep6Title => 'חקור קטגוריה';

  @override
  String get tutorialStep6Body =>
      'הקש על כל מדינה או קבוצה כדי לראות את המדבקות שלה. שם תוכל לסמן מה שכבר יש לך ולנהל כפולים.';

  @override
  String get categoryTutorialStep1Title => 'סנן מדבקות';

  @override
  String get categoryTutorialStep1Body =>
      'השתמש בכפתורים האלה כדי לראות את כל המדבקות, רק את החסרות או רק את הכפולות.';

  @override
  String get categoryTutorialStep2Title => 'חפש מדבקה';

  @override
  String get categoryTutorialStep2Body =>
      'הקלד שם מדינה, קוד או מספר מדבקה כדי למצוא אותה במהירות.';

  @override
  String get categoryTutorialStep3Title => 'הקש לסימון';

  @override
  String get categoryTutorialStep3Body =>
      'הקשה על מדבקה אפורה מוסיפה אותה לאלבום (הופכת לזהב). אם כבר יש לך ותקיש שוב, תתבקש לאשר הסרה.';

  @override
  String get categoryTutorialStep4Title => 'לחץ לחיצה ארוכה לאפשרויות נוספות';

  @override
  String get categoryTutorialStep4Body =>
      'לחיצה ארוכה מאפשרת לנהל כמה עותקים יש לך מכל גרסה (Normal, Gold, Legend).';

  @override
  String get drawerReplayTutorial => 'לצפות בהדרכה מחדש';

  @override
  String get variantTutorialTitle => 'בחר את האזור שלך';

  @override
  String get variantTutorialBody =>
      'בחר את גרסת האלבום המתאימה למדינה או לאזור שלך. זה קובע אילו מדבקות וגרסאות (Normal, Gold, Legend) יופיעו באוסף שלך.';

  @override
  String get drawerLegalNotice => 'הודעה משפטית';

  @override
  String get legalNoticeTitle => 'הודעה משפטית';

  @override
  String get legalNoticeBody =>
      'אפליקציה זו היא יצירה לא רשמית של מעריצים ואינה קשורה, נתמכת או מחוברת לאף ארגון כדורגל רשמי, יצרן מדבקות או שותף רשמי של הטורניר. כל הסימנים המסחריים הם רכושם של בעליהם המתאימים.';

  @override
  String get statsTitle => 'סטטיסטיקות';

  @override
  String get statsTotalLabel => 'סה\"כ';

  @override
  String get statsCollectedLabel => 'נאספו';

  @override
  String get statsDuplicateCopiesLabel => 'כפולים';

  @override
  String get statsCategoriesTitle => 'לפי קטגוריה';

  @override
  String get statsAllCategories => 'הכל';

  @override
  String get statsNoStatsYet => 'אין נתונים עדיין. התחל לאסוף!';

  @override
  String get statsBestCategory => 'הכי מתקדמת';

  @override
  String get statsWorstCategory => 'הכי פחות מתקדמת';

  @override
  String get statsCompletedCategories => 'הושלמו';

  @override
  String get drawerStats => 'סטטיסטיקות';

  @override
  String get statsCategoryPickerSearch => 'חפש קטגוריה...';

  @override
  String statsCategoryPickerSelected(Object count) {
    return '$count נבחרו';
  }

  @override
  String get statsCategoryPickerAll => 'כל הקטגוריות';

  @override
  String get statsCategoryPickerClear => 'נקה';

  @override
  String get statsSortTooltip => 'מיין';

  @override
  String get statsSortByName => 'קטגוריה';

  @override
  String get statsSortByProgressDesc => 'הכי מתקדמת קודם';

  @override
  String get statsSortByProgressAsc => 'הכי פחות מתקדמת קודם';

  @override
  String get statsSortByMissing => 'הכי חסרה קודם';

  @override
  String get statsSortByDuplicates => 'הכי כפולה קודם';

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
  String get drawerLookup => 'בדיקת מדבקה';

  @override
  String get physicalExchangeVirtualBtn => 'Intercambio Virtual';

  @override
  String get lookupScreenTitle => 'בדיקת מדבקה';

  @override
  String get lookupTabManual => 'ידני';

  @override
  String get lookupTabScanner => 'סורק';

  @override
  String get lookupSearchHint => 'לדוגמה: ECU 10, ARG 5, FRA 1...';

  @override
  String get lookupSearchButton => 'חיפוש';

  @override
  String get lookupStickerNotFound => 'לא נמצאה מדבקה עם הקוד הזה.';

  @override
  String get lookupStatusMissing => 'חסר';

  @override
  String get lookupStatusCollected => 'כבר יש לך ✓';

  @override
  String lookupStatusDuplicates(Object count) {
    return '$count כפול/ים 🔁';
  }

  @override
  String get lookupQtyLabel => 'כמות במלאי שלך';

  @override
  String get lookupScannerHint => 'מרכז את המדבקה לזיהוי';

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
  String get lookupTutorialStep1Title => 'שתי דרכי חיפוש';

  @override
  String get lookupTutorialStep1Body =>
      'השתמש בכרטייה ידנית להקלדת קוד או בכרטיית הסורק לסריקה ישירה.';

  @override
  String get lookupTutorialStep2Title => 'הכנס את הקוד';

  @override
  String get lookupTutorialStep2Body =>
      'הקלד את קוד המדבקה כפי שמופיע באלבום, לדוגמה ECU 10 או ARG 5.';

  @override
  String get lookupTutorialStep3Title => 'בדוק ונהל';

  @override
  String get lookupTutorialStep3Body =>
      'תראה אם המדבקה חסרה או קיימת. בלחצני + ו– תוכל לעדכן את המלאי מיד.';

  @override
  String get scanBadgeNew => 'חדש';

  @override
  String get scanBadgeRepeated => 'כפול';

  @override
  String get scannerModeAdd => 'הוסף מדבקות';

  @override
  String get scannerModeRemoveDuplicates => 'הסר כפולים';

  @override
  String get scannerRemoveModeHint => 'מרכז את המדבקה הכפולה להסרה';

  @override
  String get removeDuplicatesTitle => 'כפולים להסרה';

  @override
  String get removeDuplicatesEmpty => 'טרם נסרקו כפולים';

  @override
  String removeDuplicatesSavedSuccess(Object count) {
    return 'הוסרו $count כפולים מהמלאי 🗑️';
  }

  @override
  String removeDuplicatesSaveError(Object message) {
    return 'שגיאה בשמירה: $message';
  }

  @override
  String removeDuplicatesLimitWarning(Object label) {
    return 'ל$label אין מדבקות כפולות';
  }

  @override
  String removeDuplicatesReviewButton(Object count) {
    return 'סקור $count להסרה';
  }

  @override
  String get navAlbum => 'אלבום';

  @override
  String get navScanner => 'סורק';
}
