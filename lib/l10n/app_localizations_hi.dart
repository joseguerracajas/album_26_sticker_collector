// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'एल्बम 26';

  @override
  String get authWelcomeTitle => 'एल्बम 26 में आपका स्वागत है';

  @override
  String get authEmailLabel => 'ईमेल';

  @override
  String get authPasswordLabel => 'पासवर्ड';

  @override
  String get authLoginButton => 'साइन इन करें';

  @override
  String get authContinueWith => 'या इसके साथ जारी रखें';

  @override
  String get authContinueGoogle => 'Google के साथ जारी रखें';

  @override
  String get authContinueApple => 'Apple के साथ जारी रखें';

  @override
  String get authContinueGuest => 'अतिथि के रूप में जारी रखें';

  @override
  String get authNoAccountRegister => 'खाता नहीं है? साइन अप करें';

  @override
  String get authForgotPassword => 'पासवर्ड भूल गए?';

  @override
  String get authResetPasswordEnterEmail =>
      'पासवर्ड पुनः प्राप्त करने के लिए अपना ईमेल दर्ज करें।';

  @override
  String get authResetPasswordEmailSent =>
      'हमने आपके पासवर्ड को रीसेट करने के लिए एक ईमेल भेजा है।';

  @override
  String get authGuestMigratedSuccess =>
      'आपकी अतिथि प्रगति सफलतापूर्वक आपके नए खाते में स्थानांतरित कर दी गई! 🏆';

  @override
  String get authGuestRemotePreserved =>
      'वापस स्वागत है! आपका क्लाउड संग्रह पुनर्स्थापित कर दिया गया है और स्थानीय अतिथि प्रगति हटा दी गई है।';

  @override
  String commonErrorWithMessage(Object message) {
    return 'त्रुटि: $message';
  }

  @override
  String get authErrorInvalidCredentials =>
      'गलत ईमेल या पासवर्ड। अपनी जानकारी जांचें और पुनः प्रयास करें।';

  @override
  String get authErrorEmailNotConfirmed =>
      'आपका ईमेल अभी तक पुष्टि नहीं हुआ है। अपना इनबॉक्स जांचें।';

  @override
  String get authErrorUserAlreadyRegistered =>
      'उस ईमेल से पहले से एक खाता मौजूद है।';

  @override
  String get authErrorWeakPassword =>
      'पासवर्ड बहुत कमजोर है। कम से कम 6 अक्षरों का उपयोग करें।';

  @override
  String get authErrorInvalidEmail => 'ईमेल पते का प्रारूप मान्य नहीं है।';

  @override
  String get authErrorTokenExpired =>
      'कोड समाप्त हो गया है या अमान्य है। कृपया नया कोड मांगें।';

  @override
  String get authErrorRateLimit =>
      'बहुत अधिक प्रयास। पुनः प्रयास करने से पहले थोड़ी प्रतीक्षा करें।';

  @override
  String get authErrorNetworkError =>
      'कोई कनेक्शन नहीं। अपना नेटवर्क जांचें और पुनः प्रयास करें।';

  @override
  String get authErrorSessionExpired =>
      'आपका सत्र समाप्त हो गया है। कृपया फिर से साइन इन करें।';

  @override
  String get authErrorUnknown =>
      'एक अप्रत्याशित त्रुटि हुई। कृपया पुनः प्रयास करें।';

  @override
  String get registerTitle => 'खाता बनाएं';

  @override
  String get registerFillAllFields => 'कृपया सभी फ़ील्ड भरें।';

  @override
  String get registerEmailsDontMatch => 'ईमेल मेल नहीं खाते।';

  @override
  String get registerPasswordsDontMatch => 'पासवर्ड मेल नहीं खाते।';

  @override
  String get registerPasswordMinLength =>
      'पासवर्ड कम से कम 6 अक्षरों का होना चाहिए।';

  @override
  String get registerAccountCreated =>
      'खाता सफलतापूर्वक बनाया गया! ⚽ कृपया साइन इन करें।';

  @override
  String get registerConfirmEmailLabel => 'ईमेल की पुष्टि करें';

  @override
  String get registerConfirmPasswordLabel => 'पासवर्ड की पुष्टि करें';

  @override
  String get registerSubmitButton => 'साइन अप करें';

  @override
  String get profileTitle => 'मेरी प्रोफ़ाइल';

  @override
  String get profileOfficialCollector => 'आधिकारिक संग्रहकर्ता 🌟';

  @override
  String get profileChangePasswordButton => 'पासवर्ड अपडेट करें';

  @override
  String get profileChangePasswordTitle => 'पासवर्ड अपडेट करें';

  @override
  String get profileNewPasswordLabel => 'नया पासवर्ड';

  @override
  String get profileConfirmNewPasswordLabel => 'नए पासवर्ड की पुष्टि करें';

  @override
  String get profilePasswordUpdatedSuccess =>
      'पासवर्ड सफलतापूर्वक अपडेट किया गया।';

  @override
  String get profileLogoutButton => 'साइन आउट करें';

  @override
  String get profileLogoutSuccess => 'आप सफलतापूर्वक साइन आउट हो गए।';

  @override
  String get profileUnknownUser => 'अज्ञात उपयोगकर्ता';

  @override
  String profileLogoutError(Object message) {
    return 'साइन आउट करने में त्रुटि: $message';
  }

  @override
  String get homeTitle => 'मेरा एल्बम 26';

  @override
  String get homeProfileTooltip => 'मेरी प्रोफ़ाइल';

  @override
  String get homeShareAll => 'पूरी सूची शेयर करें';

  @override
  String get homeShareMissingOnly => 'केवल गायब';

  @override
  String get homeShareDuplicatesOnly => 'केवल डुप्लिकेट';

  @override
  String get homeGlobalProgressTitle => 'समग्र प्रगति';

  @override
  String homeCollectedCount(Object collected, Object total) {
    return '$total में से $collected एकत्रित';
  }

  @override
  String get homeViewFullCollection => 'पूरा संग्रह देखें';

  @override
  String get homeTeamsTitle => 'टीमें';

  @override
  String get homeSearchTeamsHint => 'देश या टीम से खोजें...';

  @override
  String get homeNoResults => 'कोई टीम नहीं मिली';

  @override
  String get homeScanButton => 'स्टिकर स्कैन करें';

  @override
  String homeObtainedCount(Object collected, Object total) {
    return '$total में से $collected प्राप्त';
  }

  @override
  String get homeProgressError => 'त्रुटि';

  @override
  String get globalCollectionTitle => 'पूरा संग्रह';

  @override
  String get filterAll => 'सभी';

  @override
  String get filterMissing => 'गायब';

  @override
  String get filterDuplicates => 'डुप्लिकेट';

  @override
  String get filterSearchHint => 'देश, कोड या नंबर से खोजें...';

  @override
  String get stickerRemoveTitle => 'स्टिकर हटाएं?';

  @override
  String stickerRemoveConfirm(Object stickerLabel) {
    return 'क्या आप अपने एल्बम से स्टिकर $stickerLabel हटाना चाहते हैं?';
  }

  @override
  String get commonCancel => 'रद्द करें';

  @override
  String get commonRemove => 'हटाएं';

  @override
  String get commonDone => 'हो गया';

  @override
  String get gridNoResults => 'कोई स्टिकर नहीं मिला।';

  @override
  String scannerViewScannedButton(Object count) {
    return 'स्कैन किए गए $count स्टिकर देखें';
  }

  @override
  String get scannerOverlayHint =>
      'यहाँ स्टिकर का पिछला हिस्सा केंद्र में रखें';

  @override
  String get pendingScansTitle => 'स्कैन किए गए स्टिकर';

  @override
  String get pendingScansEmpty => 'आपने अभी तक कोई स्टिकर स्कैन नहीं किया';

  @override
  String pendingScansItemLabel(Object code) {
    return 'स्टिकर: $code';
  }

  @override
  String pendingScansSavedSuccess(Object count) {
    return '$count स्टिकर आपके एल्बम में जोड़े गए! 🏆';
  }

  @override
  String pendingScansSaveError(Object message) {
    return 'सहेजने में त्रुटि: $message';
  }

  @override
  String get shareHeader => '⚽ *एल्बम 26 अदला-बदली सूची* 🏆';

  @override
  String get shareMissingSectionTitle => '❌ *गायब:*';

  @override
  String get shareDuplicatesSectionTitle => '🔁 *डुप्लिकेट:*';

  @override
  String get shareNoneMissing => 'कुछ नहीं! 😎';

  @override
  String get shareNoDuplicates => 'कोई डुप्लिकेट नहीं 😅';

  @override
  String get shareLetsTrade => 'अदला-बदली करना चाहते हैं? 👀🔥';

  @override
  String get shareSeparator => '--------------------------';

  @override
  String get forgotPasswordTitle => 'खाता पुनर्प्राप्त करें';

  @override
  String get forgotPasswordDescription =>
      'अपना ईमेल दर्ज करें और हम आपको पासवर्ड रीसेट करने के लिए 6 अंकों का कोड भेजेंगे।';

  @override
  String get forgotPasswordEmailLabel => 'ईमेल';

  @override
  String get forgotPasswordEmptyEmailError => 'कृपया अपना ईमेल पता दर्ज करें।';

  @override
  String get forgotPasswordCodeSentSuccess =>
      'कोड भेजा गया। अपना इनबॉक्स जांचें।';

  @override
  String get forgotPasswordSendCodeButton => 'कोड भेजें';

  @override
  String forgotPasswordStep2Description(Object email) {
    return 'वह कोड दर्ज करें जो हमने $email पर भेजा है और अपना नया पासवर्ड।';
  }

  @override
  String get forgotPasswordCodeInputLabel => '8 अंकों का कोड';

  @override
  String get forgotPasswordInvalidCodeError => 'कोड में ठीक 6 अंक होने चाहिए।';

  @override
  String get forgotPasswordNewPasswordLabel => 'नया पासवर्ड';

  @override
  String get forgotPasswordShortPasswordError =>
      'पासवर्ड कम से कम 6 अक्षरों का होना चाहिए।';

  @override
  String get forgotPasswordSavePasswordButton => 'पासवर्ड सहेजें';

  @override
  String get forgotPasswordPasswordUpdatedSuccess =>
      'पासवर्ड सफलतापूर्वक अपडेट किया गया! 🏆';

  @override
  String get validationEmailInvalid => 'ईमेल पता अमान्य है।';

  @override
  String get paywallTitle => 'विज्ञापन के बिना आनंद लें';

  @override
  String get paywallSubtitle =>
      'सभी सुविधाएं मुफ्त में उपलब्ध हैं। Pro के साथ बिना रुकावट के सब कुछ आनंद लें।';

  @override
  String get paywallBenefitScanner => 'इंटरस्टिशियल विज्ञापनों के बिना स्कैनर';

  @override
  String get paywallBenefitNoAds => 'कोई विज्ञापन नहीं';

  @override
  String get paywallBenefitSync => 'क्लाउड सिंक शामिल';

  @override
  String paywallSubscribeButton(Object price) {
    return 'सदस्यता लें · $price';
  }

  @override
  String get paywallPackageMonthly => 'मासिक';

  @override
  String get paywallPackageAnnual => 'वार्षिक';

  @override
  String get paywallPackageWeekly => 'साप्ताहिक';

  @override
  String get paywallPackageLifetime => 'आजीवन';

  @override
  String get paywallPackageTwoMonth => 'हर 2 महीने';

  @override
  String get paywallPackageThreeMonth => 'हर 3 महीने';

  @override
  String get paywallPackageSixMonth => 'हर 6 महीने';

  @override
  String get paywallRestorePurchases => 'खरीदारी पुनर्स्थापित करें';

  @override
  String get paywallCancelAnytime => 'कभी भी रद्द करें। कोई प्रतिबद्धता नहीं।';

  @override
  String get paywallLoadError => 'प्लान लोड नहीं हो सके। अपना कनेक्शन जांचें।';

  @override
  String get paywallRetry => 'पुनः प्रयास करें';

  @override
  String get paywallPurchaseError => 'खरीदारी विफल। कृपया पुनः प्रयास करें।';

  @override
  String get paywallRestoreError =>
      'खरीदारी पुनर्स्थापित नहीं हो सकी। कृपया पुनः प्रयास करें।';

  @override
  String get paywallGuestTitle => 'सदस्यता लेने के लिए साइन इन करें';

  @override
  String get paywallGuestBody =>
      'Pro आपके खाते से जुड़ा है। सभी सुविधाएं अनलॉक करने के लिए साइन इन करें या खाता बनाएं।';

  @override
  String get paywallGuestSignInButton => 'साइन इन करें';

  @override
  String scannerDemoRemaining(Object count) {
    return '$count मुफ्त स्कैन शेष';
  }

  @override
  String get scannerDemoFinishedTitle => 'आपने अपने 5 मुफ्त स्कैन उपयोग कर लिए';

  @override
  String get scannerDemoFinishedSubtitle =>
      'असीमित स्टिकर स्कैन और विज्ञापन-मुक्त अनुभव के लिए सदस्यता लें।';

  @override
  String get scannerDemoUnlockButton => 'Pro प्लान देखें';

  @override
  String get adDialogTitle => 'मुफ्त सामग्री';

  @override
  String get adDialogBody =>
      'जारी रखने के लिए, एक छोटा विज्ञापन देखें या Pro की सदस्यता लें और विज्ञापनों को हमेशा के लिए भूल जाएं।';

  @override
  String get adDialogWatchAd => 'विज्ञापन देखें';

  @override
  String get adDialogGetPro => 'Pro प्राप्त करें';

  @override
  String get adDialogNotNow => 'अभी नहीं';

  @override
  String get scannerCameraInitError =>
      'कैमरा प्रारंभ नहीं हो सका। सुनिश्चित करें कि ऐप के पास कैमरा अनुमति है।';
}
