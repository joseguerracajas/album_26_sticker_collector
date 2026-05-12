// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Album 2026';

  @override
  String get authWelcomeTitle => 'Welcome to Album 2026';

  @override
  String get authEmailLabel => 'Email';

  @override
  String get authPasswordLabel => 'Password';

  @override
  String get authLoginButton => 'SIGN IN';

  @override
  String get authContinueWith => 'Or continue with';

  @override
  String get authContinueGoogle => 'Continue with Google';

  @override
  String get authContinueApple => 'Continue with Apple';

  @override
  String get authContinueGuest => 'Continue as Guest';

  @override
  String get authNoAccountRegister => 'Don\'t have an account? Sign up';

  @override
  String get authForgotPassword => 'Forgot your password?';

  @override
  String get authResetPasswordEnterEmail =>
      'Enter your email to recover your password.';

  @override
  String get authResetPasswordEmailSent =>
      'We sent you an email to reset your password.';

  @override
  String get authGuestMigratedSuccess =>
      'Your guest progress was successfully transferred to your new account! 🏆';

  @override
  String get authGuestRemotePreserved =>
      'Welcome back! Your cloud collection has been restored, and local guest progress was discarded.';

  @override
  String commonErrorWithMessage(Object message) {
    return 'Error: $message';
  }

  @override
  String get authErrorInvalidCredentials =>
      'Incorrect email or password. Please check your details and try again.';

  @override
  String get authErrorEmailNotConfirmed =>
      'Your email has not been confirmed yet. Please check your inbox.';

  @override
  String get authErrorUserAlreadyRegistered =>
      'An account with that email already exists.';

  @override
  String get authErrorWeakPassword =>
      'Password is too weak. Use at least 6 characters.';

  @override
  String get authErrorInvalidEmail => 'The email address format is not valid.';

  @override
  String get authErrorTokenExpired =>
      'The code has expired or is invalid. Please request a new one.';

  @override
  String get authErrorRateLimit =>
      'Too many attempts. Please wait a moment before trying again.';

  @override
  String get authErrorNetworkError =>
      'No connection. Check your network and try again.';

  @override
  String get authErrorSessionExpired =>
      'Your session has expired. Please sign in again.';

  @override
  String get authErrorUnknown =>
      'An unexpected error occurred. Please try again.';

  @override
  String get registerTitle => 'Create Account';

  @override
  String get registerFillAllFields => 'Please fill in all fields.';

  @override
  String get registerEmailsDontMatch => 'Emails do not match.';

  @override
  String get registerPasswordsDontMatch => 'Passwords do not match.';

  @override
  String get registerPasswordMinLength =>
      'Password must be at least 6 characters.';

  @override
  String get registerAccountCreated =>
      'Account created successfully! ⚽ Please sign in.';

  @override
  String get registerConfirmEmailLabel => 'Confirm email';

  @override
  String get registerConfirmPasswordLabel => 'Confirm password';

  @override
  String get registerSubmitButton => 'SIGN UP';

  @override
  String get profileTitle => 'My Profile';

  @override
  String get profileOfficialCollector => 'Official Collector 🌟';

  @override
  String get profileChangePasswordButton => 'Update password';

  @override
  String get profileChangePasswordTitle => 'Update password';

  @override
  String get profileNewPasswordLabel => 'New password';

  @override
  String get profileConfirmNewPasswordLabel => 'Confirm new password';

  @override
  String get profilePasswordUpdatedSuccess => 'Password updated successfully.';

  @override
  String get profileLogoutButton => 'Sign out';

  @override
  String get profileLogoutSuccess => 'You have been signed out.';

  @override
  String get profileUnknownUser => 'Unknown user';

  @override
  String profileLogoutError(Object message) {
    return 'Error signing out: $message';
  }

  @override
  String get homeTitle => 'My Album 2026';

  @override
  String get homeProfileTooltip => 'My Profile';

  @override
  String get drawerSignIn => 'Sign In';

  @override
  String get homeShareAll => 'Share Full List';

  @override
  String get homeShareMissingOnly => 'Missing Only';

  @override
  String get homeShareDuplicatesOnly => 'Duplicates Only';

  @override
  String get homeGlobalProgressTitle => 'Global Progress';

  @override
  String homeCollectedCount(Object collected, Object total) {
    return '$collected of $total collected';
  }

  @override
  String get homeViewFullCollection => 'View Full Collection';

  @override
  String get homeTeamsTitle => 'Teams';

  @override
  String get homeSearchTeamsHint => 'Search by country or team...';

  @override
  String get homeNoResults => 'No teams found';

  @override
  String get homeScanButton => 'Scan Sticker';

  @override
  String homeObtainedCount(Object collected, Object total) {
    return '$collected of $total collected';
  }

  @override
  String get homeProgressError => 'Error';

  @override
  String get globalCollectionTitle => 'Full Collection';

  @override
  String get filterAll => 'All';

  @override
  String get filterMissing => 'Missing';

  @override
  String get filterDuplicates => 'Duplicates';

  @override
  String get filterSearchHint => 'Search by country, code or number...';

  @override
  String get stickerRemoveTitle => 'Remove sticker?';

  @override
  String stickerRemoveConfirm(Object stickerLabel) {
    return 'Are you sure you want to remove sticker $stickerLabel from your album?';
  }

  @override
  String get commonCancel => 'Cancel';

  @override
  String get commonRemove => 'Remove';

  @override
  String get commonDone => 'DONE';

  @override
  String get gridNoResults => 'No stickers found.';

  @override
  String scannerViewScannedButton(Object count) {
    return 'Review $count scanned stickers';
  }

  @override
  String get scannerOverlayHint => 'Center the back of the sticker here';

  @override
  String get pendingScansTitle => 'Scanned Stickers';

  @override
  String get pendingScansEmpty => 'You haven\'t scanned any stickers yet';

  @override
  String pendingScansItemLabel(Object code) {
    return 'Sticker: $code';
  }

  @override
  String pendingScansSavedSuccess(Object count) {
    return '$count stickers added to your album! 🏆';
  }

  @override
  String pendingScansSaveError(Object message) {
    return 'Error while saving: $message';
  }

  @override
  String get shareHeader => '⚽ *Album 2026 SWAP LIST* 🏆';

  @override
  String get shareMissingSectionTitle => '❌ *MISSING:*';

  @override
  String get shareDuplicatesSectionTitle => '🔁 *DUPLICATES:*';

  @override
  String get shareNoneMissing => 'None! 😎';

  @override
  String get shareNoDuplicates => 'No duplicates 😅';

  @override
  String get shareLetsTrade => 'Want to trade? 👀🔥';

  @override
  String get shareSeparator => '--------------------------';

  @override
  String get forgotPasswordTitle => 'Recover Account';

  @override
  String get forgotPasswordDescription =>
      'Enter your email and we\'ll send you a 6-digit code to reset your password.';

  @override
  String get forgotPasswordEmailLabel => 'Email';

  @override
  String get forgotPasswordEmptyEmailError => 'Please enter your email.';

  @override
  String get forgotPasswordCodeSentSuccess => 'Code sent. Check your inbox.';

  @override
  String get forgotPasswordSendCodeButton => 'SEND CODE';

  @override
  String forgotPasswordStep2Description(Object email) {
    return 'Enter the code we sent to $email and your new password.';
  }

  @override
  String get forgotPasswordCodeInputLabel => '8-digit code';

  @override
  String get forgotPasswordInvalidCodeError =>
      'The code must have exactly 6 digits.';

  @override
  String get forgotPasswordNewPasswordLabel => 'New Password';

  @override
  String get forgotPasswordShortPasswordError =>
      'Password must be at least 6 characters.';

  @override
  String get forgotPasswordSavePasswordButton => 'SAVE PASSWORD';

  @override
  String get forgotPasswordPasswordUpdatedSuccess =>
      'Password updated successfully! 🏆';

  @override
  String get validationEmailInvalid => 'The email address is not valid.';

  @override
  String get paywallTitle => 'Enjoy without ads';

  @override
  String get paywallSubtitle =>
      'All features are available for free. With Pro you enjoy everything without interruptions.';

  @override
  String get paywallBenefitScanner => 'Scanner without interstitial ads';

  @override
  String get paywallBenefitNoAds => 'No ads';

  @override
  String get paywallBenefitSync => 'Cloud sync included';

  @override
  String paywallSubscribeButton(Object price) {
    return 'Subscribe · $price';
  }

  @override
  String get paywallPackageMonthly => 'Monthly';

  @override
  String get paywallPackageAnnual => 'Annual';

  @override
  String get paywallPackageWeekly => 'Weekly';

  @override
  String get paywallPackageLifetime => 'Lifetime';

  @override
  String get paywallPackageTwoMonth => 'Every 2 months';

  @override
  String get paywallPackageThreeMonth => 'Every 3 months';

  @override
  String get paywallPackageSixMonth => 'Every 6 months';

  @override
  String get paywallRestorePurchases => 'Restore purchases';

  @override
  String get paywallCancelAnytime => 'Cancel anytime. No commitments.';

  @override
  String get paywallLoadError => 'Could not load plans. Check your connection.';

  @override
  String get paywallRetry => 'Retry';

  @override
  String get paywallPurchaseError => 'Purchase failed. Please try again.';

  @override
  String get paywallRestoreError =>
      'Could not restore purchases. Please try again.';

  @override
  String get paywallGuestTitle => 'Sign in to subscribe';

  @override
  String get paywallGuestBody =>
      'Pro is linked to your account. Sign in or create an account to unlock all features.';

  @override
  String get paywallGuestSignInButton => 'SIGN IN';

  @override
  String scannerDemoRemaining(Object count) {
    return '$count free scans remaining';
  }

  @override
  String get scannerDemoFinishedTitle => 'You\'ve used your 5 free scans';

  @override
  String get scannerDemoFinishedSubtitle =>
      'Subscribe to scan unlimited stickers and enjoy an ad-free experience.';

  @override
  String get scannerDemoUnlockButton => 'View Pro Plans';

  @override
  String get adDialogTitle => 'Free content';

  @override
  String get adDialogBody =>
      'To continue, watch a short ad or subscribe to Pro and forget about ads forever.';

  @override
  String get adDialogWatchAd => 'Watch ad';

  @override
  String get adDialogGetPro => 'Get Pro';

  @override
  String get adDialogNotNow => 'Not now';

  @override
  String get scannerCameraInitError =>
      'Could not initialize the camera. Make sure the app has camera permission.';

  @override
  String get variantSheetTitle => 'Album variant';

  @override
  String get variantSheetInventoryNote =>
      'Your inventory is preserved when you change variant. The stickers you already have remain registered.';

  @override
  String variantSheetLoadError(Object error) {
    return 'Error loading variants: $error';
  }

  @override
  String get variantSheetEmpty => 'No variants available for this album.';

  @override
  String get variantSheetDefaultLabel => 'Default variant';

  @override
  String get variantMandatoryTitle => 'Choose your region';

  @override
  String get variantMandatorySubtitle =>
      'Select your album version to see the right stickers for your region.';

  @override
  String variantChangedSuccess(Object name) {
    return 'Variant changed to $name ✅';
  }

  @override
  String get profileDeleteAccountButton => 'Delete account';

  @override
  String get profileDeleteAccountTitle => 'Delete your account?';

  @override
  String get profileDeleteAccountMessage =>
      'This action is permanent. All your data will be deleted and you won\'t be able to recover your collection.';

  @override
  String get profileDeleteAccountConfirmButton => 'Delete permanently';

  @override
  String get profileDeleteAccountSuccess => 'Your account has been deleted.';

  @override
  String get profileDeleteAccountError =>
      'Error deleting account. Please try again.';

  @override
  String get paywallPrivacyPolicy => 'Privacy Policy';

  @override
  String get paywallTermsOfUse => 'Terms of Use';

  @override
  String get paywallLegalDisclaimer =>
      'By subscribing you agree to our Terms of Use and Privacy Policy.';

  @override
  String get tutorialSkip => 'Skip';

  @override
  String get tutorialTapToContinue => 'Tap anywhere to continue';

  @override
  String get tutorialStep1Title => 'Your global progress';

  @override
  String get tutorialStep1Body =>
      'Here you can see how many stickers you have collected and your completion percentage. Keep collecting!';

  @override
  String get tutorialStep2Title => 'Search teams';

  @override
  String get tutorialStep2Body =>
      'Type a country or team name to filter the list instantly.';

  @override
  String get tutorialStep3Title => 'Main menu';

  @override
  String get tutorialStep3Body =>
      'Access your profile, switch album variants, and explore more options here.';

  @override
  String get tutorialStep4Title => 'Scan stickers';

  @override
  String get tutorialStep4Body =>
      'Use the camera to scan the back of your physical stickers and add them automatically to your album.';

  @override
  String get tutorialStep5Title => 'Share your list';

  @override
  String get tutorialStep5Body =>
      'Export your missing or duplicate sticker list to trade with friends.';

  @override
  String get globalTutorialStep1Title => 'Filter your collection';

  @override
  String get globalTutorialStep1Body =>
      'Use these buttons to see all your stickers, only the missing ones, or only your duplicates. Perfect for organising trades!';

  @override
  String get globalTutorialStep2Title => 'Search for a sticker';

  @override
  String get globalTutorialStep2Body =>
      'Type the country name, code, or sticker number to find it quickly.';

  @override
  String get globalTutorialStep3Title => 'Tap to mark';

  @override
  String get globalTutorialStep3Body =>
      'A single tap on a grey sticker adds it to your album (turns golden). If you already have it and tap again, you\'ll be asked to confirm removal.';

  @override
  String get globalTutorialStep4Title => 'Long press for more options';

  @override
  String get globalTutorialStep4Body =>
      'Long press a sticker to manage how many copies you have of each variant (Normal, Gold, Legend…) and update your duplicate inventory.';

  @override
  String get tutorialStep6Title => 'Explore a category';

  @override
  String get tutorialStep6Body =>
      'Tap any country or team to see its stickers. There you can mark the ones you already have and manage your duplicates.';

  @override
  String get categoryTutorialStep1Title => 'Filter stickers';

  @override
  String get categoryTutorialStep1Body =>
      'Use these buttons to see all stickers in this category, only the missing ones, or only duplicates.';

  @override
  String get categoryTutorialStep2Title => 'Search for a sticker';

  @override
  String get categoryTutorialStep2Body =>
      'Type the country name, code, or sticker number to find it quickly.';

  @override
  String get categoryTutorialStep3Title => 'Tap to mark';

  @override
  String get categoryTutorialStep3Body =>
      'Tapping a grey sticker adds it to your album (turns gold). If you already have it and tap again, you will be asked to confirm removing it.';

  @override
  String get categoryTutorialStep4Title => 'Long press for more options';

  @override
  String get categoryTutorialStep4Body =>
      'Long pressing a sticker lets you manage how many copies you have of each variant (Normal, Gold, Legend) and update your duplicates inventory.';

  @override
  String get drawerReplayTutorial => 'Replay tutorial';

  @override
  String get variantTutorialTitle => 'Select your region';

  @override
  String get variantTutorialBody =>
      'Choose the album variant that matches your country or region. This defines which stickers and variants (Normal, Gold, Legend) will appear in your collection.';

  @override
  String get drawerLegalNotice => 'Legal Notice';

  @override
  String get legalNoticeTitle => 'Legal Notice';

  @override
  String get legalNoticeBody =>
      'This application is an unofficial fan creation and is not affiliated with, endorsed by, or connected to any official football organization, sticker manufacturer, or any official partner of the football tournament. All trademarks are the property of their respective owners.';

  @override
  String get statsTitle => 'Statistics';

  @override
  String get statsTotalLabel => 'Total';

  @override
  String get statsCollectedLabel => 'Collected';

  @override
  String get statsDuplicateCopiesLabel => 'Duplicates';

  @override
  String get statsCategoriesTitle => 'By Category';

  @override
  String get statsAllCategories => 'All';

  @override
  String get statsNoStatsYet => 'No data yet. Start collecting!';

  @override
  String get statsBestCategory => 'Most progress';

  @override
  String get statsWorstCategory => 'Least progress';

  @override
  String get statsCompletedCategories => 'Completed';

  @override
  String get drawerStats => 'Statistics';

  @override
  String get statsCategoryPickerSearch => 'Search category...';

  @override
  String statsCategoryPickerSelected(Object count) {
    return '$count selected';
  }

  @override
  String get statsCategoryPickerAll => 'All categories';

  @override
  String get statsCategoryPickerClear => 'Clear';

  @override
  String get statsSortTooltip => 'Sort';

  @override
  String get statsSortByName => 'Category';

  @override
  String get statsSortByProgressDesc => 'Most progress first';

  @override
  String get statsSortByProgressAsc => 'Least progress first';

  @override
  String get statsSortByMissing => 'Most missing first';

  @override
  String get statsSortByDuplicates => 'Most duplicates first';

  @override
  String get tradeHubTitle => 'Sticker Trading';

  @override
  String get tradeHubMyCode => 'My trade code';

  @override
  String get tradeHubCodeCopied => 'Code copied to clipboard';

  @override
  String get tradeHubShareHint =>
      'Share this code or scan the other user\'s QR';

  @override
  String get tradeHubNoActive => 'No active trade';

  @override
  String get tradeHubNoActiveDesc =>
      'Start a trade by entering another collector\'s code.';

  @override
  String get tradeHubStartBtn => 'Start trade';

  @override
  String get tradeHubHistory => 'History';

  @override
  String get tradeHubCancel => 'Cancel trade';

  @override
  String get tradeHubCancelTitle => 'Cancel trade?';

  @override
  String get tradeHubCancelMsg =>
      'The trade will be cancelled and stickers will return to your inventory.';

  @override
  String get tradeHubCancelYes => 'Yes, cancel';

  @override
  String get tradeHubActiveLabel => 'Active trade';

  @override
  String get tradeStatusPending => 'Waiting for response';

  @override
  String get tradeStatusPendingDesc =>
      'The other user must accept your trade request.';

  @override
  String get tradeStatusIncoming => 'You have a request!';

  @override
  String get tradeStatusIncomingDesc =>
      'Someone wants to trade stickers with you.';

  @override
  String get tradeStatusSelecting => 'Selecting stickers';

  @override
  String get tradeStatusSelectingDesc =>
      'Both of you are choosing what stickers to offer.';

  @override
  String get tradeStatusMyConfirmed => 'Your offer is ready';

  @override
  String get tradeStatusMyConfirmedDesc =>
      'Waiting for the other user to confirm their offer.';

  @override
  String get tradeStatusOtherConfirmed => 'The other confirmed';

  @override
  String get tradeStatusOtherConfirmedDesc =>
      'Confirm your sticker selection to continue.';

  @override
  String get tradeStatusReservedLabel => 'Stickers reserved';

  @override
  String get tradeStatusReservedDesc =>
      'Trade agreed. Confirm when you have received your stickers.';

  @override
  String get tradeAcceptBtn => 'Accept trade';

  @override
  String get tradeSeeOfferBtn => 'View trade';

  @override
  String get tradeSelectBtn => 'Select my stickers';

  @override
  String get tradeConfirmDeliveryBtn => 'Confirm receipt';

  @override
  String get tradeFindTitle => 'Find collector';

  @override
  String get tradeFindCodeTab => 'Code';

  @override
  String get tradeFindScanTab => 'Scan QR';

  @override
  String get tradeFindInstruction => 'Enter the collector\'s 6-digit code';

  @override
  String get tradeFindHint => 'You can find the code on their trading screen.';

  @override
  String get tradeFindSearchBtn => 'Search';

  @override
  String get tradeFindSearching => 'Searching…';

  @override
  String get tradeFindScanHint => 'Point at the other collector\'s QR code';

  @override
  String get tradeFindPartnerFound => 'User found!';

  @override
  String tradeFindPartnerCode(Object code) {
    return 'Code: $code';
  }

  @override
  String get tradeFindSendBtn => 'Send trade request';

  @override
  String get tradeFindSending => 'Sending…';

  @override
  String tradeFindRequestSent(Object name) {
    return 'Request sent to $name! Wait for their response.';
  }

  @override
  String get tradeNegTitle => 'Negotiation';

  @override
  String get tradeNegMyOfferTab => 'My offer';

  @override
  String get tradeNegReceivingTab => 'I\'ll receive';

  @override
  String get tradeNegAutoMode => 'Auto';

  @override
  String get tradeNegManualMode => 'Manual';

  @override
  String get tradeNegAutoHint =>
      'Auto mode: shows your duplicates. Switch to Manual to customise.';

  @override
  String tradeNegSelectedCount(Object count) {
    return '$count sticker(s) selected';
  }

  @override
  String get tradeNegNoStickers => 'You have no stickers to offer.';

  @override
  String get tradeNegPartnerWaiting =>
      'The other collector hasn\'t selected their stickers yet.';

  @override
  String tradeNegOfferLabel(Object count) {
    return 'You\'ll offer $count sticker(s)';
  }

  @override
  String get tradeNegConfirmBtn => 'Confirm my offer';

  @override
  String get tradeNegSaving => 'Saving…';

  @override
  String get tradeNegAtLeastOne => 'Select at least one sticker to offer.';

  @override
  String get tradeNegOfferConfirmed =>
      'Offer confirmed! Waiting for the other collector.';

  @override
  String get tradeNegAlreadyConfirmedBanner =>
      'Your offer is confirmed. Waiting for the other collector.';

  @override
  String get tradeNegModifyOffer => 'Modify my offer';

  @override
  String get tradeNegModifyOfferWarning =>
      'You can change the stickers you want to give. The other collector will have to wait.';

  @override
  String get tradeNegQtyPickerTitle => 'How many to offer?';

  @override
  String tradeNegQtyPickerHint(Object total, Object max) {
    return 'You have $total copies. Max to offer: $max.';
  }

  @override
  String tradeNegOfferedQtyBadge(Object qty) {
    return 'Offering $qty';
  }

  @override
  String get tradeNegPartnerOfferUpdated =>
      'The other collector updated their sticker offer.';

  @override
  String tradeNegTotalItems(Object count) {
    return '$count item(s) total';
  }

  @override
  String tradeNegReceivingCount(Object count) {
    return '$count sticker(s) you\'ll receive';
  }

  @override
  String get tradeDeliveryTitle => 'Confirm receipt';

  @override
  String get tradeDeliveryInstruction =>
      'Mark the stickers you physically received';

  @override
  String get tradeDeliveryDesc =>
      'Marked stickers will be added to your album. Unmarked ones will return to the other collector.';

  @override
  String get tradeDeliveryNoOffer =>
      'The other collector didn\'t offer any stickers.';

  @override
  String get tradeDeliveryNotReceived => 'Not received';

  @override
  String tradeDeliveryAllReceived(Object received, Object total) {
    return 'You received all stickers ($received/$total)';
  }

  @override
  String tradeDeliveryPartial(Object received, Object total, Object pending) {
    return '$received of $total marked · $pending will return to the other collector.';
  }

  @override
  String get tradeDeliveryConfirmTitle => 'Confirm receipt';

  @override
  String tradeDeliveryConfirmMsg(Object received, Object pending) {
    return '$received sticker(s) will be added to your album.\n$pending unmarked sticker(s) will return to the other collector.';
  }

  @override
  String tradeDeliverySuccess(Object count) {
    return '$count sticker(s) added to your album! 🏆';
  }

  @override
  String get tradeHistoryTitle => 'Trade history';

  @override
  String get tradeHistoryEmpty => 'No trades yet';

  @override
  String get tradeHistoryEmptyDesc =>
      'Completed and cancelled trades will appear here.';

  @override
  String get tradeHistoryCompleted => 'Completed';

  @override
  String get tradeHistoryCancelled => 'Cancelled';

  @override
  String get tradeHistoryStartedByMe => 'You started';

  @override
  String get tradeHistoryReceivedRequest => 'You received';

  @override
  String get tradeHistorySent => 'Sent';

  @override
  String get tradeHistoryReceivedLabel => 'Received';

  @override
  String tradeHistoryDelivered(Object count) {
    return '$count delivered';
  }

  @override
  String tradeHistoryStickerCount(Object count) {
    return '$count sticker(s)';
  }

  @override
  String get tradeDrawerTitle => 'Trade stickers';

  @override
  String get tradeDrawerActiveBadge => 'ACTIVE';

  @override
  String get tradeErrorGeneric =>
      'An error occurred in the trade. Please try again.';

  @override
  String get tradeErrorNotLoggedIn =>
      'You must be signed in to trade stickers.';

  @override
  String get tradeErrorSelf => 'You cannot trade stickers with yourself.';

  @override
  String get tradeErrorCodeNotFound => 'No user was found with that code.';

  @override
  String get tradeErrorCodeLength => 'The code must be exactly 6 digits.';

  @override
  String get tradeErrorActiveExists =>
      'You already have an active trade. Complete or cancel it first.';

  @override
  String get tradeErrorNoConnection =>
      'This feature requires an internet connection.';

  @override
  String get tradeRejectBtn => 'Reject request';

  @override
  String get tradeDrawerRequestBadge => 'REQUEST';

  @override
  String get drawerPhysicalExchange => 'Exchange';

  @override
  String get physicalExchangeScreenTitle => 'Physical Exchange';

  @override
  String get drawerLookup => 'Search';

  @override
  String get physicalExchangeVirtualBtn => 'Virtual Exchange';

  @override
  String get lookupScreenTitle => 'Sticker Lookup';

  @override
  String get lookupTabManual => 'Manual';

  @override
  String get lookupTabScanner => 'Scanner';

  @override
  String get lookupSearchHint => 'E.g.: ECU 10, ARG 5, FRA 1...';

  @override
  String get lookupSearchButton => 'Search';

  @override
  String get lookupStickerNotFound => 'No sticker found with that code.';

  @override
  String get lookupStatusMissing => 'Missing';

  @override
  String get lookupStatusCollected => 'You have it ✓';

  @override
  String lookupStatusDuplicates(Object count) {
    return '$count duplicate(s) 🔁';
  }

  @override
  String get lookupQtyLabel => 'Quantity in your inventory';

  @override
  String get lookupScannerHint => 'Center the sticker to identify it';

  @override
  String get lookupScannerOpenTooltip => 'Open scanner';

  @override
  String get lookupScannerOpenCamera => 'Scan stickers';

  @override
  String get lookupScannerViewResults => 'View results';

  @override
  String lookupScannerSaveSuccess(Object count) {
    return '$count sticker(s) added to inventory';
  }

  @override
  String lookupScannerScannedCount(Object count) {
    return '$count scanned';
  }

  @override
  String get lookupScannerNewLabel => 'new';

  @override
  String get lookupScannerDuplicatesLabel => 'duplicates';

  @override
  String get lookupScannerResetTooltip => 'Reset session';

  @override
  String get lookupScannerResetConfirmTitle => 'Reset session?';

  @override
  String get lookupScannerResetConfirmMsg =>
      'All scanned stickers will be cleared. This action cannot be undone.';

  @override
  String get lookupScannerResetConfirmBtn => 'Reset';

  @override
  String get lookupScannerEmptyHint => 'Point the camera at the stickers';

  @override
  String lookupScannerMissingSection(Object count) {
    return 'Missing ($count)';
  }

  @override
  String lookupScannerAddSelected(Object count) {
    return 'Add $count';
  }

  @override
  String lookupScannerDuplicatesSection(Object count) {
    return 'Duplicates ($count)';
  }

  @override
  String get lookupTutorialStep1Title => 'Two ways to search';

  @override
  String get lookupTutorialStep1Body =>
      'Use the Manual tab to type the sticker code (e.g. ECU 10), or the Scanner tab to point the camera directly.';

  @override
  String get lookupTutorialStep2Title => 'Enter the code';

  @override
  String get lookupTutorialStep2Body =>
      'Type the sticker code as it appears in the album, e.g. ECU 10 or ARG 5, then tap Search.';

  @override
  String get lookupTutorialStep3Title => 'Check and manage';

  @override
  String get lookupTutorialStep3Body =>
      'You\'ll see if the sticker is missing, collected, or how many duplicates you have. Use the + and – buttons to update your inventory instantly.';
}
