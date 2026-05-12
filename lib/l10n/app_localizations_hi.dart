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
  String get drawerSignIn => 'साइन इन';

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
  String get paywallBestOption => 'Mejor opción';

  @override
  String get paywallStartFreeTrial => 'Comenzar prueba gratis';

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

  @override
  String get variantSheetTitle => 'एल्बम वेरिएंट';

  @override
  String get variantSheetInventoryNote =>
      'वेरिएंट बदलने पर आपकी इन्वेंटरी सुरक्षित रहती है। जो स्टिकर आपके पास पहले से हैं वे दर्ज रहते हैं।';

  @override
  String variantSheetLoadError(Object error) {
    return 'वेरिएंट लोड करने में त्रुटि: $error';
  }

  @override
  String get variantSheetEmpty => 'इस एल्बम के लिए कोई वेरिएंट उपलब्ध नहीं है।';

  @override
  String get variantSheetDefaultLabel => 'डिफ़ॉल्ट वेरिएंट';

  @override
  String get variantMandatoryTitle => 'अपना क्षेत्र चुनें';

  @override
  String get variantMandatorySubtitle =>
      'अपने क्षेत्र के लिए एल्बम संस्करण चुनें।';

  @override
  String variantChangedSuccess(Object name) {
    return 'वेरिएंट $name में बदल गया ✅';
  }

  @override
  String get profileDeleteAccountButton => 'खाता हटाएं';

  @override
  String get profileDeleteAccountTitle => 'अपना खाता हटाएं?';

  @override
  String get profileDeleteAccountMessage =>
      'यह क्रिया स्थायी है. आपका सारा डेटा हटा दिया जाएगा और आप अपना संग्रह वापस नहीं पा सकेंगे.';

  @override
  String get profileDeleteAccountConfirmButton => 'स्थायी रूप से हटाएं';

  @override
  String get profileDeleteAccountSuccess => 'आपका खाता हटा दिया गया है.';

  @override
  String get profileDeleteAccountError =>
      'खाता हटाने में त्रुटि. कृपया पुनः प्रयास करें.';

  @override
  String get paywallPrivacyPolicy => 'गोपनीयता नीति';

  @override
  String get paywallTermsOfUse => 'उपयोग की शर्तें';

  @override
  String get paywallLegalDisclaimer =>
      'सदस्यता लेकर आप हमारी उपयोग की शर्तों और गोपनीयता नीति से सहमत होते हैं.';

  @override
  String get tutorialSkip => 'छोड़ें';

  @override
  String get tutorialTapToContinue => 'जारी रखने के लिए कहीं भी टैप करें';

  @override
  String get tutorialStep1Title => 'आपकी वैश्विक प्रगति';

  @override
  String get tutorialStep1Body =>
      'यहाँ देखें आपने कितने स्टिकर इकट्ठे किए हैं। इकट्ठा करते रहें!';

  @override
  String get tutorialStep2Title => 'टीमें खोजें';

  @override
  String get tutorialStep2Body =>
      'सूची फ़िल्टर करने के लिए देश या टीम का नाम टाइप करें।';

  @override
  String get tutorialStep3Title => 'मुख्य मेनू';

  @override
  String get tutorialStep3Body =>
      'अपनी प्रोफ़ाइल तक पहुँचें और एल्बम वेरिएंट बदलें।';

  @override
  String get tutorialStep4Title => 'स्टिकर स्कैन करें';

  @override
  String get tutorialStep4Body =>
      'स्टिकर स्कैन करने और जोड़ने के लिए कैमरा उपयोग करें।';

  @override
  String get tutorialStep5Title => 'सूची साझा करें';

  @override
  String get tutorialStep5Body =>
      'गुम या डुप्लीकेट स्टिकर सूची एक्सचेंज के लिए निर्यात करें।';

  @override
  String get globalTutorialStep1Title => 'कलेक्शन फ़िल्टर करें';

  @override
  String get globalTutorialStep1Body =>
      'सभी स्टिकर, केवल गुम या केवल डुप्लीकेट देखने के लिए इन बटन का उपयोग करें। ट्रेड के लिए बिल्कुल सही!';

  @override
  String get globalTutorialStep2Title => 'स्टिकर खोजें';

  @override
  String get globalTutorialStep2Body =>
      'देश का नाम, कोड या स्टिकर नंबर टाइप करें और इसे जल्दी खोजें।';

  @override
  String get globalTutorialStep3Title => 'मार्क करने के लिए टैप करें';

  @override
  String get globalTutorialStep3Body =>
      'ग्रे स्टिकर पर एक टैप उसे एल्बम में जोड़ता है (सुनहरा)। दोबारा टैप करने पर हटाने की पुष्टि मांगी जाएगी।';

  @override
  String get globalTutorialStep4Title => 'अधिक विकल्पों के लिए देर तक दबाएँ';

  @override
  String get globalTutorialStep4Body =>
      'प्रत्येक वेरिएंट (Normal, Gold, Legend...) की प्रतियाँ प्रबंधित करने के लिए स्टिकर को देर तक दबाएँ।';

  @override
  String get tutorialStep6Title => 'श्रेणी एक्सप्लोर करें';

  @override
  String get tutorialStep6Body =>
      'स्टिकर देखने के लिए किसी भी देश या टीम पर टैप करें। वहाँ आप जो पहले से हैं उन्हें चिह्नित कर सकते हैं और डुप्लीकेट प्रबंधित कर सकते हैं।';

  @override
  String get categoryTutorialStep1Title => 'स्टिकर फ़िल्टर करें';

  @override
  String get categoryTutorialStep1Body =>
      'सभी स्टिकर, केवल गायब या केवल डुप्लीकेट देखने के लिए इन बटन का उपयोग करें।';

  @override
  String get categoryTutorialStep2Title => 'स्टिकर खोजें';

  @override
  String get categoryTutorialStep2Body =>
      'देश का नाम, कोड या स्टिकर नंबर टाइप करें ताकि इसे जल्दी से ढूंढा जा सके।';

  @override
  String get categoryTutorialStep3Title => 'चिह्नित करने के लिए टैप करें';

  @override
  String get categoryTutorialStep3Body =>
      'ग्रे स्टिकर पर टैप करने से वह एल्बम में जुड़ जाता है (सुनहरा हो जाता है)। यदि पहले से है और फिर टैप करते हैं, हटाने की पुष्टि माँगी जाएगी।';

  @override
  String get categoryTutorialStep4Title => 'अधिक विकल्पों के लिए दबाए रखें';

  @override
  String get categoryTutorialStep4Body =>
      'स्टिकर को देर तक दबाने पर प्रत्येक वेरिएंट (Normal, Gold, Legend) की कितनी प्रतियाँ हैं, यह प्रबंधित कर सकते हैं।';

  @override
  String get drawerReplayTutorial => 'ट्यूटोरियल फिर से देखें';

  @override
  String get variantTutorialTitle => 'अपना क्षेत्र चुनें';

  @override
  String get variantTutorialBody =>
      'वह एल्बम वेरिएंट चुनें जो आपके देश या क्षेत्र से मेल खाता हो। यह तय करता है कि आपकी कलेक्शन में कौन से स्टिकर और वेरिएंट (Normal, Gold, Legend) दिखाई देंगे।';

  @override
  String get drawerLegalNotice => 'कानूनी सूचना';

  @override
  String get legalNoticeTitle => 'कानूनी सूचना';

  @override
  String get legalNoticeBody =>
      'यह ऐप एक अनौपचारिक प्रशंसक रचना है और किसी भी आधिकारिक फुटबॉल संगठन, स्टिकर निर्माता या फुटबॉल टूर्नामेंट के किसी आधिकारिक भागीदार से संबद्ध, समर्थित या जुड़ी नहीं है। सभी ट्रेडमार्क उनके संबंधित स्वामियों की संपत्ति हैं।';

  @override
  String get statsTitle => 'आँकड़े';

  @override
  String get statsTotalLabel => 'कुल';

  @override
  String get statsCollectedLabel => 'संग्रहित';

  @override
  String get statsDuplicateCopiesLabel => 'डुप्लीकेट';

  @override
  String get statsCategoriesTitle => 'श्रेणी के अनुसार';

  @override
  String get statsAllCategories => 'सभी';

  @override
  String get statsNoStatsYet => 'अभी कोई डेटा नहीं। एकत्र करना शुरू करें!';

  @override
  String get statsBestCategory => 'सबसे अधिक प्रगति';

  @override
  String get statsWorstCategory => 'सबसे कम प्रगति';

  @override
  String get statsCompletedCategories => 'पूर्ण';

  @override
  String get drawerStats => 'आँकड़े';

  @override
  String get statsCategoryPickerSearch => 'श्रेणी खोजें...';

  @override
  String statsCategoryPickerSelected(Object count) {
    return '$count चुनी गई';
  }

  @override
  String get statsCategoryPickerAll => 'सभी श्रेणियाँ';

  @override
  String get statsCategoryPickerClear => 'साफ करें';

  @override
  String get statsSortTooltip => 'क्रमबद्ध';

  @override
  String get statsSortByName => 'श्रेणी';

  @override
  String get statsSortByProgressDesc => 'अधिक प्रगति पहले';

  @override
  String get statsSortByProgressAsc => 'कम प्रगति पहले';

  @override
  String get statsSortByMissing => 'अधिक लापता पहले';

  @override
  String get statsSortByDuplicates => 'अधिक दोहराव पहले';

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
  String get drawerLookup => 'स्टिकर खोजें';

  @override
  String get physicalExchangeVirtualBtn => 'Intercambio Virtual';

  @override
  String get lookupScreenTitle => 'स्टिकर खोजें';

  @override
  String get lookupTabManual => 'मैन्युअल';

  @override
  String get lookupTabScanner => 'स्कैनर';

  @override
  String get lookupSearchHint => 'जैसे: ECU 10, ARG 5, FRA 1...';

  @override
  String get lookupSearchButton => 'खोजें';

  @override
  String get lookupStickerNotFound => 'उस कोड से कोई स्टिकर नहीं मिला।';

  @override
  String get lookupStatusMissing => 'नहीं है';

  @override
  String get lookupStatusCollected => 'आपके पास है ✓';

  @override
  String lookupStatusDuplicates(Object count) {
    return '$count डुप्लीकेट 🔁';
  }

  @override
  String get lookupQtyLabel => 'आपके इन्वेंट्री में मात्रा';

  @override
  String get lookupScannerHint => 'स्टिकर को पहचानने के लिए बीच में रखें';

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
  String get lookupTutorialStep1Title => 'दो खोज विधियाँ';

  @override
  String get lookupTutorialStep1Body =>
      'कोड टाइप करने के लिए मैन्युअल टैब या स्कैन करने के लिए स्कैनर टैब का उपयोग करें।';

  @override
  String get lookupTutorialStep2Title => 'कोड दर्ज करें';

  @override
  String get lookupTutorialStep2Body =>
      'आल्बम में दिखने वाला स्टिकर कोड टाइप करें, जैसे ECU 10 या ARG 5, फिर खोजें दबाएं।';

  @override
  String get lookupTutorialStep3Title => 'जांचें और प्रबंधित करें';

  @override
  String get lookupTutorialStep3Body =>
      'आप देखेंगे कि स्टिकर गायब है या संग्रहीत। + और – बटनों से इन्वेंट्री अपडेट करें।';

  @override
  String get scanBadgeNew => 'नया';

  @override
  String get scanBadgeRepeated => 'दोहराया';

  @override
  String get navAlbum => 'एल्बम';

  @override
  String get navScanner => 'स्कैनर';
}
