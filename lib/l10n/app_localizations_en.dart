// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Album 26';

  @override
  String get authWelcomeTitle => 'Welcome to Album 26';

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
  String get homeTitle => 'My Album 26';

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
  String get shareHeader => '⚽ *ALBUM 26 SWAP LIST* 🏆';

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
}
