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
  String get authContinueGuest => 'Continue as guest';

  @override
  String get authNoAccountRegister => 'No account? Sign up';

  @override
  String get authGuestMigratedSuccess =>
      'Your guest progress was copied to your new account.';

  @override
  String get authGuestRemotePreserved =>
      'This account already existed: cloud data was kept and local guest progress was discarded.';

  @override
  String commonErrorWithMessage(Object message) {
    return 'Error: $message';
  }

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
      'Account created successfully. Please sign in.';

  @override
  String get registerConfirmEmailLabel => 'Confirm email';

  @override
  String get registerConfirmPasswordLabel => 'Confirm password';

  @override
  String get registerSubmitButton => 'SIGN UP';

  @override
  String get profileTitle => 'My Profile';

  @override
  String get profileOfficialCollector => 'Official Collector';

  @override
  String get profileLogoutButton => 'Sign out';

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
  String get homeShareAll => 'Share All';

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
  String get homeSearchTeamsHint => 'Search country or team...';

  @override
  String get homeNoResults => 'No results';

  @override
  String get homeScanButton => 'Scan';

  @override
  String homeObtainedCount(Object collected, Object total) {
    return '$collected of $total obtained';
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
  String get filterSearchHint => 'Search country, code or number...';

  @override
  String get stickerRemoveTitle => 'Remove sticker?';

  @override
  String stickerRemoveConfirm(Object stickerLabel) {
    return 'Are you sure you want to remove sticker $stickerLabel?';
  }

  @override
  String get commonCancel => 'Cancel';

  @override
  String get commonRemove => 'Remove';

  @override
  String get commonDone => 'DONE';

  @override
  String get gridNoResults => 'No results.';

  @override
  String scannerViewScannedButton(Object count) {
    return 'View $count scanned stickers';
  }

  @override
  String get scannerOverlayHint => 'Center the back side of the sticker here';

  @override
  String get pendingScansTitle => 'Scanned Stickers';

  @override
  String get pendingScansEmpty => 'You have not scanned anything yet';

  @override
  String pendingScansItemLabel(Object code) {
    return 'Sticker: $code';
  }

  @override
  String pendingScansSavedSuccess(Object count) {
    return '$count stickers saved successfully!';
  }

  @override
  String pendingScansSaveError(Object message) {
    return 'Error while saving: $message';
  }

  @override
  String get shareHeader => '⚽ *ALBUM 26 TRADING* 🏆';

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
}
