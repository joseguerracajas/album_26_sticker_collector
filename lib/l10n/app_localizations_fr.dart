// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Album 26';

  @override
  String get authWelcomeTitle => 'Bienvenue sur Album 26';

  @override
  String get authEmailLabel => 'E-mail';

  @override
  String get authPasswordLabel => 'Mot de passe';

  @override
  String get authLoginButton => 'SE CONNECTER';

  @override
  String get authContinueWith => 'Ou continuer avec';

  @override
  String get authContinueGoogle => 'Continuer avec Google';

  @override
  String get authContinueApple => 'Continuer avec Apple';

  @override
  String get authContinueGuest => 'Continuer en tant qu\'invité';

  @override
  String get authNoAccountRegister => 'Pas de compte ? S\'inscrire';

  @override
  String get authForgotPassword => 'Mot de passe oublié ?';

  @override
  String get authResetPasswordEnterEmail =>
      'Entrez votre e-mail pour récupérer votre mot de passe.';

  @override
  String get authResetPasswordEmailSent =>
      'Nous vous avons envoyé un e-mail pour réinitialiser votre mot de passe.';

  @override
  String get authGuestMigratedSuccess =>
      'Votre progression en tant qu\'invité a été transférée avec succès vers votre nouveau compte ! 🏆';

  @override
  String get authGuestRemotePreserved =>
      'Bienvenue de retour ! Votre collection cloud a été restaurée et la progression locale a été supprimée.';

  @override
  String commonErrorWithMessage(Object message) {
    return 'Erreur : $message';
  }

  @override
  String get authErrorInvalidCredentials =>
      'E-mail ou mot de passe incorrect. Vérifiez vos informations et réessayez.';

  @override
  String get authErrorEmailNotConfirmed =>
      'Votre e-mail n\'a pas encore été confirmé. Vérifiez votre boîte de réception.';

  @override
  String get authErrorUserAlreadyRegistered =>
      'Un compte avec cet e-mail existe déjà.';

  @override
  String get authErrorWeakPassword =>
      'Le mot de passe est trop faible. Utilisez au moins 6 caractères.';

  @override
  String get authErrorInvalidEmail =>
      'Le format de l\'adresse e-mail n\'est pas valide.';

  @override
  String get authErrorTokenExpired =>
      'Le code a expiré ou n\'est pas valide. Veuillez en demander un nouveau.';

  @override
  String get authErrorRateLimit =>
      'Trop de tentatives. Veuillez attendre un moment avant de réessayer.';

  @override
  String get authErrorNetworkError =>
      'Pas de connexion. Vérifiez votre réseau et réessayez.';

  @override
  String get authErrorSessionExpired =>
      'Votre session a expiré. Veuillez vous reconnecter.';

  @override
  String get authErrorUnknown =>
      'Une erreur inattendue s\'est produite. Veuillez réessayer.';

  @override
  String get registerTitle => 'Créer un compte';

  @override
  String get registerFillAllFields => 'Veuillez remplir tous les champs.';

  @override
  String get registerEmailsDontMatch => 'Les e-mails ne correspondent pas.';

  @override
  String get registerPasswordsDontMatch =>
      'Les mots de passe ne correspondent pas.';

  @override
  String get registerPasswordMinLength =>
      'Le mot de passe doit contenir au moins 6 caractères.';

  @override
  String get registerAccountCreated =>
      'Compte créé avec succès ! ⚽ Veuillez vous connecter.';

  @override
  String get registerConfirmEmailLabel => 'Confirmer l\'e-mail';

  @override
  String get registerConfirmPasswordLabel => 'Confirmer le mot de passe';

  @override
  String get registerSubmitButton => 'S\'INSCRIRE';

  @override
  String get profileTitle => 'Mon Profil';

  @override
  String get profileOfficialCollector => 'Collectionneur Officiel 🌟';

  @override
  String get profileChangePasswordButton => 'Mettre à jour le mot de passe';

  @override
  String get profileChangePasswordTitle => 'Mettre à jour le mot de passe';

  @override
  String get profileNewPasswordLabel => 'Nouveau mot de passe';

  @override
  String get profileConfirmNewPasswordLabel =>
      'Confirmer le nouveau mot de passe';

  @override
  String get profilePasswordUpdatedSuccess =>
      'Mot de passe mis à jour avec succès.';

  @override
  String get profileLogoutButton => 'Se déconnecter';

  @override
  String get profileLogoutSuccess => 'Vous avez été déconnecté.';

  @override
  String get profileUnknownUser => 'Utilisateur inconnu';

  @override
  String profileLogoutError(Object message) {
    return 'Erreur lors de la déconnexion : $message';
  }

  @override
  String get homeTitle => 'Mon Album 26';

  @override
  String get homeProfileTooltip => 'Mon Profil';

  @override
  String get drawerSignIn => 'Se connecter';

  @override
  String get homeShareAll => 'Partager la liste complète';

  @override
  String get homeShareMissingOnly => 'Manquants seulement';

  @override
  String get homeShareDuplicatesOnly => 'Doublons seulement';

  @override
  String get homeGlobalProgressTitle => 'Progression globale';

  @override
  String homeCollectedCount(Object collected, Object total) {
    return '$collected sur $total collectés';
  }

  @override
  String get homeViewFullCollection => 'Voir la collection complète';

  @override
  String get homeTeamsTitle => 'Équipes';

  @override
  String get homeSearchTeamsHint => 'Rechercher par pays ou équipe...';

  @override
  String get homeNoResults => 'Aucune équipe trouvée';

  @override
  String get homeScanButton => 'Scanner un sticker';

  @override
  String homeObtainedCount(Object collected, Object total) {
    return '$collected sur $total obtenus';
  }

  @override
  String get homeProgressError => 'Erreur';

  @override
  String get globalCollectionTitle => 'Collection complète';

  @override
  String get filterAll => 'Tous';

  @override
  String get filterMissing => 'Manquants';

  @override
  String get filterDuplicates => 'Doublons';

  @override
  String get filterSearchHint => 'Rechercher par pays, code ou numéro...';

  @override
  String get stickerRemoveTitle => 'Supprimer le sticker ?';

  @override
  String stickerRemoveConfirm(Object stickerLabel) {
    return 'Êtes-vous sûr de vouloir supprimer le sticker $stickerLabel de votre album ?';
  }

  @override
  String get commonCancel => 'Annuler';

  @override
  String get commonRemove => 'Supprimer';

  @override
  String get commonDone => 'TERMINÉ';

  @override
  String get gridNoResults => 'Aucun sticker trouvé.';

  @override
  String scannerViewScannedButton(Object count) {
    return 'Revoir $count stickers scannés';
  }

  @override
  String get scannerOverlayHint => 'Centrez le dos du sticker ici';

  @override
  String get pendingScansTitle => 'Stickers scannés';

  @override
  String get pendingScansEmpty => 'Vous n\'avez encore scanné aucun sticker';

  @override
  String pendingScansItemLabel(Object code) {
    return 'Sticker : $code';
  }

  @override
  String pendingScansSavedSuccess(Object count) {
    return '$count stickers ajoutés à votre album ! 🏆';
  }

  @override
  String pendingScansSaveError(Object message) {
    return 'Erreur lors de la sauvegarde : $message';
  }

  @override
  String get shareHeader => '⚽ *LISTE D\'ÉCHANGE ALBUM 26* 🏆';

  @override
  String get shareMissingSectionTitle => '❌ *MANQUANTS :*';

  @override
  String get shareDuplicatesSectionTitle => '🔁 *DOUBLONS :*';

  @override
  String get shareNoneMissing => 'Aucun ! 😎';

  @override
  String get shareNoDuplicates => 'Aucun doublon 😅';

  @override
  String get shareLetsTrade => 'Vous voulez échanger ? 👀🔥';

  @override
  String get shareSeparator => '--------------------------';

  @override
  String get forgotPasswordTitle => 'Récupérer le compte';

  @override
  String get forgotPasswordDescription =>
      'Entrez votre e-mail et nous vous enverrons un code à 6 chiffres pour réinitialiser votre mot de passe.';

  @override
  String get forgotPasswordEmailLabel => 'E-mail';

  @override
  String get forgotPasswordEmptyEmailError =>
      'Veuillez entrer votre adresse e-mail.';

  @override
  String get forgotPasswordCodeSentSuccess =>
      'Code envoyé. Vérifiez votre boîte de réception.';

  @override
  String get forgotPasswordSendCodeButton => 'ENVOYER LE CODE';

  @override
  String forgotPasswordStep2Description(Object email) {
    return 'Entrez le code que nous avons envoyé à $email et votre nouveau mot de passe.';
  }

  @override
  String get forgotPasswordCodeInputLabel => 'Code à 8 chiffres';

  @override
  String get forgotPasswordInvalidCodeError =>
      'Le code doit avoir exactement 6 chiffres.';

  @override
  String get forgotPasswordNewPasswordLabel => 'Nouveau mot de passe';

  @override
  String get forgotPasswordShortPasswordError =>
      'Le mot de passe doit contenir au moins 6 caractères.';

  @override
  String get forgotPasswordSavePasswordButton => 'ENREGISTRER LE MOT DE PASSE';

  @override
  String get forgotPasswordPasswordUpdatedSuccess =>
      'Mot de passe mis à jour avec succès ! 🏆';

  @override
  String get validationEmailInvalid => 'L\'adresse e-mail n\'est pas valide.';

  @override
  String get paywallTitle => 'Profitez sans publicité';

  @override
  String get paywallSubtitle =>
      'Toutes les fonctionnalités sont disponibles gratuitement. Avec Pro, profitez de tout sans interruptions.';

  @override
  String get paywallBenefitScanner => 'Scanner sans publicités interstitielles';

  @override
  String get paywallBenefitNoAds => 'Sans publicité';

  @override
  String get paywallBenefitSync => 'Synchronisation cloud incluse';

  @override
  String paywallSubscribeButton(Object price) {
    return 'S\'abonner · $price';
  }

  @override
  String get paywallPackageMonthly => 'Mensuel';

  @override
  String get paywallPackageAnnual => 'Annuel';

  @override
  String get paywallPackageWeekly => 'Hebdomadaire';

  @override
  String get paywallPackageLifetime => 'À vie';

  @override
  String get paywallPackageTwoMonth => 'Tous les 2 mois';

  @override
  String get paywallPackageThreeMonth => 'Tous les 3 mois';

  @override
  String get paywallPackageSixMonth => 'Tous les 6 mois';

  @override
  String get paywallRestorePurchases => 'Restaurer les achats';

  @override
  String get paywallCancelAnytime => 'Annulez à tout moment. Sans engagement.';

  @override
  String get paywallLoadError =>
      'Impossible de charger les plans. Vérifiez votre connexion.';

  @override
  String get paywallRetry => 'Réessayer';

  @override
  String get paywallPurchaseError => 'Achat échoué. Veuillez réessayer.';

  @override
  String get paywallRestoreError =>
      'Impossible de restaurer les achats. Veuillez réessayer.';

  @override
  String get paywallGuestTitle => 'Connectez-vous pour vous abonner';

  @override
  String get paywallGuestBody =>
      'Pro est lié à votre compte. Connectez-vous ou créez un compte pour débloquer toutes les fonctionnalités.';

  @override
  String get paywallGuestSignInButton => 'SE CONNECTER';

  @override
  String scannerDemoRemaining(Object count) {
    return '$count scans gratuits restants';
  }

  @override
  String get scannerDemoFinishedTitle =>
      'Vous avez utilisé vos 5 scans gratuits';

  @override
  String get scannerDemoFinishedSubtitle =>
      'Abonnez-vous pour scanner des stickers illimités et profiter d\'une expérience sans publicité.';

  @override
  String get scannerDemoUnlockButton => 'Voir les plans Pro';

  @override
  String get adDialogTitle => 'Contenu gratuit';

  @override
  String get adDialogBody =>
      'Pour continuer, regardez une courte publicité ou abonnez-vous à Pro et oubliez les publicités pour toujours.';

  @override
  String get adDialogWatchAd => 'Regarder la pub';

  @override
  String get adDialogGetPro => 'Obtenir Pro';

  @override
  String get adDialogNotNow => 'Pas maintenant';

  @override
  String get scannerCameraInitError =>
      'Impossible d\'initialiser la caméra. Assurez-vous que l\'application a la permission d\'accéder à la caméra.';

  @override
  String get variantSheetTitle => 'Variante de l\'album';

  @override
  String get variantSheetInventoryNote =>
      'Votre inventaire est conservé lorsque vous changez de variante. Les autocollants que vous avez déjà restent enregistrés.';

  @override
  String variantSheetLoadError(Object error) {
    return 'Erreur lors du chargement des variantes : $error';
  }

  @override
  String get variantSheetEmpty => 'Aucune variante disponible pour cet album.';

  @override
  String get variantSheetDefaultLabel => 'Variante par défaut';

  @override
  String get variantMandatoryTitle => 'Choisissez votre région';

  @override
  String get variantMandatorySubtitle =>
      'Sélectionnez la version de l\'album correspondant à votre région.';

  @override
  String variantChangedSuccess(Object name) {
    return 'Variante changée en $name ✅';
  }

  @override
  String get profileDeleteAccountButton => 'Supprimer le compte';

  @override
  String get profileDeleteAccountTitle => 'Supprimer votre compte ?';

  @override
  String get profileDeleteAccountMessage =>
      'Cette action est permanente. Toutes vos données seront supprimées et vous ne pourrez pas récupérer votre collection.';

  @override
  String get profileDeleteAccountConfirmButton => 'Supprimer définitivement';

  @override
  String get profileDeleteAccountSuccess => 'Votre compte a été supprimé.';

  @override
  String get profileDeleteAccountError =>
      'Erreur lors de la suppression du compte. Réessayez.';

  @override
  String get paywallPrivacyPolicy => 'Politique de confidentialité';

  @override
  String get paywallTermsOfUse => 'Conditions d\'utilisation';

  @override
  String get paywallLegalDisclaimer =>
      'En vous abonnant, vous acceptez nos Conditions d\'utilisation et notre Politique de confidentialité.';
}
