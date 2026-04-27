// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get appTitle => 'אלבום 26';

  @override
  String get authWelcomeTitle => 'ברוך הבא לאלבום 26';

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
  String get homeTitle => 'האלבום שלי 26';

  @override
  String get homeProfileTooltip => 'הפרופיל שלי';

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
  String get shareHeader => '⚽ *רשימת החלפות אלבום 26* 🏆';

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
}
