// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Sticker Album 2026';

  @override
  String get authWelcomeTitle => 'Bienvenue sur Sticker Album 2026';

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
  String get homeTitle => 'Sticker Album 2026';

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
  String get shareHeader => '⚽ *LISTE D\'ÉCHANGE Sticker Album 2026* 🏆';

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
  String shareDownloadLink(String appName) {
    return '📲 Télécharger l\'app $appName\nhttps://onelink.to/5adrft?olbm=1';
  }

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
  String get paywallBestOption => 'Meilleure option';

  @override
  String get paywallStartFreeTrial => 'Commencer l\'essai gratuit';

  @override
  String paywallFreeTrial(int days) {
    return 'Essai gratuit de $days jours';
  }

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

  @override
  String get tutorialSkip => 'Passer';

  @override
  String get tutorialTapToContinue => 'Appuie n\'importe où pour continuer';

  @override
  String get tutorialStep1Title => 'Ta progression globale';

  @override
  String get tutorialStep1Body =>
      'Ici tu vois combien de stickers tu as collectés. Continue !';

  @override
  String get tutorialStep2Title => 'Rechercher des équipes';

  @override
  String get tutorialStep2Body =>
      'Tape un nom de pays ou d\'équipe pour filtrer la liste.';

  @override
  String get tutorialStep3Title => 'Menu principal';

  @override
  String get tutorialStep3Body =>
      'Accède à ton profil et change la variante de l\'album.';

  @override
  String get tutorialStep4Title => 'Scanner des stickers';

  @override
  String get tutorialStep4Body =>
      'Utilise la caméra pour scanner et ajouter des stickers automatiquement.';

  @override
  String get tutorialStep5Title => 'Partager ta liste';

  @override
  String get tutorialStep5Body =>
      'Exporte ta liste de stickers manquants ou en double pour échanger.';

  @override
  String get globalTutorialStep1Title => 'Filtrer ta collection';

  @override
  String get globalTutorialStep1Body =>
      'Utilise ces boutons pour voir tous tes stickers, seulement les manquants ou seulement les doublons. Parfait pour organiser tes échanges !';

  @override
  String get globalTutorialStep2Title => 'Rechercher un sticker';

  @override
  String get globalTutorialStep2Body =>
      'Tape le nom du pays, le code ou le numéro du sticker pour le trouver rapidement.';

  @override
  String get globalTutorialStep3Title => 'Toucher pour marquer';

  @override
  String get globalTutorialStep3Body =>
      'Un simple toucher sur un sticker gris l\'ajoute à ton album (il devient doré). Si tu le retouches, une confirmation te sera demandée pour le retirer.';

  @override
  String get globalTutorialStep4Title => 'Appui long pour plus d\'options';

  @override
  String get globalTutorialStep4Body =>
      'Maintiens un sticker appuyé pour gérer combien d\'exemplaires tu possèdes de chaque variante (Normal, Gold, Legend...).';

  @override
  String get tutorialStep6Title => 'Explorer une categorie';

  @override
  String get tutorialStep6Body =>
      'Appuyez sur un pays ou une equipe pour voir ses stickers. Vous pourrez y marquer ceux que vous avez et gerer vos doubles.';

  @override
  String get tutorialNavAlbumTitle => 'Álbum';

  @override
  String get tutorialNavAlbumBody =>
      'Tu álbum principal. Aquí ves todos los países y equipos, marcas tus stickers y ves tu progreso global.';

  @override
  String get tutorialNavScannerTitle => 'Escáner';

  @override
  String get tutorialNavScannerBody =>
      'Escanea el dorso de tus stickers físicos con la cámara. La app los reconoce automáticamente y los añade a tu colección. ¡También puedes quitar repetidos!';

  @override
  String get tutorialNavExchangeTitle => 'Intercambio';

  @override
  String get tutorialNavExchangeBody =>
      'Escanea los stickers de otro coleccionista para saber cuáles te faltan y cuáles puedes ofrecerle a cambio. Perfecto para intercambios cara a cara.';

  @override
  String get tutorialNavLookupTitle => 'Buscar';

  @override
  String get tutorialNavLookupBody =>
      'Consulta cualquier sticker por su código o número. Puedes buscarlo escribiéndolo o escaneándolo directamente.';

  @override
  String get tutorialNavStatsTitle => 'Estadísticas';

  @override
  String get tutorialNavStatsBody =>
      'Analiza tu progreso por categoría: porcentaje completado, faltantes y repetidos. Ordena y filtra como quieras.';

  @override
  String get categoryTutorialStep1Title => 'Filtrer les stickers';

  @override
  String get categoryTutorialStep1Body =>
      'Utilisez ces boutons pour voir tous les stickers, uniquement ceux qu il vous manque ou uniquement les doubles.';

  @override
  String get categoryTutorialStep2Title => 'Rechercher un sticker';

  @override
  String get categoryTutorialStep2Body =>
      'Tapez le nom du pays, le code ou le numero du sticker pour le trouver rapidement.';

  @override
  String get categoryTutorialStep3Title => 'Appuyer pour marquer';

  @override
  String get categoryTutorialStep3Body =>
      'Appuyer sur un sticker gris l ajoute a votre album (devient dore). Si vous l avez deja et appuyez a nouveau, il vous sera demande de confirmer la suppression.';

  @override
  String get categoryTutorialStep4Title => 'Appui long pour plus d options';

  @override
  String get categoryTutorialStep4Body =>
      'Un appui long vous permet de gerer le nombre d exemplaires de chaque variante (Normal, Gold, Legend).';

  @override
  String get drawerReplayTutorial => 'Revoir le tutoriel';

  @override
  String get drawerRateApp => 'Évaluez notre application';

  @override
  String get scannerTutorialStep1Title => 'Modo de escaneo';

  @override
  String get scannerTutorialStep1Body =>
      'Elige Agregar para registrar stickers nuevos, o Quitar repetidos para eliminar del inventario los que ya tienes de más.';

  @override
  String get scannerTutorialStep2Title => 'Apunta al sticker';

  @override
  String get scannerTutorialStep2Body =>
      'Coloca el dorso del sticker dentro del marco. La app detecta el código automáticamente y lo añade a tu álbum. Verás una notificación en pantalla con el resultado.';

  @override
  String get exchangeTutorialStep1Title => 'Escanea los stickers de tu amigo';

  @override
  String get exchangeTutorialStep1Body =>
      'Apunta la cámara al dorso de los stickers de otro coleccionista. La app clasifica cuáles te faltan y cuáles ya tienes repetidos.';

  @override
  String get exchangeTutorialStep2Title => 'Faltantes y repetidos';

  @override
  String get exchangeTutorialStep2Body =>
      'Aquí verás en tiempo real cuántos stickers nuevos encontraste y cuántos ya tenías. Toca Ver resultados para ver la lista completa y guardar los que te faltan.';

  @override
  String get statsTutorialStep1Title => 'Tu progreso global';

  @override
  String get statsTutorialStep1Body =>
      'Esta tarjeta muestra cuántos stickers únicos tienes del total del álbum. ¡Apunta al 100%! Desliza hacia abajo para actualizar.';

  @override
  String get statsTutorialStep2Title => 'Filtra por categoría';

  @override
  String get statsTutorialStep2Body =>
      'Toca estos chips para ver las estadísticas de un país o equipo concreto. Puedes seleccionar varios a la vez para comparar.';

  @override
  String get variantTutorialTitle => 'Sélectionnez votre région';

  @override
  String get variantTutorialBody =>
      'Choisissez la variante d\'album correspondant à votre pays ou région. Cela définit quels stickers et variantes (Normal, Gold, Legend) apparaîtront dans votre collection.';

  @override
  String get drawerLegalNotice => 'Mentions Légales';

  @override
  String get legalNoticeTitle => 'Mentions Légales';

  @override
  String get legalNoticeBody =>
      'Cette application est une création non officielle de fans et n\'est pas affiliée, approuvée ou connectée à toute organisation officielle de football, fabricant de vignettes ou partenaire officiel du tournoi de football. Toutes les marques déposées sont la propriété de leurs propriétaires respectifs.';

  @override
  String get statsTitle => 'Statistiques';

  @override
  String get statsTotalLabel => 'Total';

  @override
  String get statsCollectedLabel => 'Collectées';

  @override
  String get statsDuplicateCopiesLabel => 'Doublons';

  @override
  String get statsCategoriesTitle => 'Par Catégorie';

  @override
  String get statsAllCategories => 'Toutes';

  @override
  String get statsNoStatsYet =>
      'Pas encore de données. Commencez à collectionner !';

  @override
  String get statsBestCategory => 'Plus avancée';

  @override
  String get statsWorstCategory => 'Moins avancée';

  @override
  String get statsCompletedCategories => 'Complètes';

  @override
  String get drawerStats => 'Statistiques';

  @override
  String get statsCategoryPickerSearch => 'Rechercher une catégorie...';

  @override
  String statsCategoryPickerSelected(Object count) {
    return '$count sélectionnées';
  }

  @override
  String get statsCategoryPickerAll => 'Toutes les catégories';

  @override
  String get statsCategoryPickerClear => 'Effacer';

  @override
  String get statsSortTooltip => 'Trier';

  @override
  String get statsSortByName => 'Catégorie';

  @override
  String get statsSortByProgressDesc => 'Plus avancée d’abord';

  @override
  String get statsSortByProgressAsc => 'Moins avancée d’abord';

  @override
  String get statsSortByMissing => 'Plus manquantes d’abord';

  @override
  String get statsSortByDuplicates => 'Plus de doublons d\'abord';

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
  String get drawerLookup => 'Consulter un sticker';

  @override
  String get physicalExchangeVirtualBtn => 'Intercambio Virtual';

  @override
  String get lookupScreenTitle => 'Consulter un sticker';

  @override
  String get lookupTabManual => 'Manuel';

  @override
  String get lookupTabScanner => 'Scanner';

  @override
  String get lookupSearchHint => 'Ex. : ECU 10, ARG 5, FRA 1...';

  @override
  String get lookupSearchButton => 'Rechercher';

  @override
  String get lookupStickerNotFound => 'Aucun sticker trouvé avec ce code.';

  @override
  String get lookupStatusMissing => 'Manquant';

  @override
  String get lookupStatusCollected => 'Déjà en ta possession ✓';

  @override
  String lookupStatusDuplicates(Object count) {
    return '$count doublon(s) 🔁';
  }

  @override
  String get lookupQtyLabel => 'Quantité dans ton inventaire';

  @override
  String get lookupScannerHint => 'Centre le sticker pour l\'identifier';

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
  String get lookupTutorialStep1Title => 'Deux façons de chercher';

  @override
  String get lookupTutorialStep1Body =>
      'Utilise l\'onglet Manuel pour saisir le code du sticker ou l\'onglet Scanner pour pointer la caméra directement.';

  @override
  String get lookupTutorialStep2Title => 'Saisis le code';

  @override
  String get lookupTutorialStep2Body =>
      'Tape le code du sticker tel qu\'il apparaît dans l\'album, par ex. ECU 10 ou ARG 5, puis appuie sur Rechercher.';

  @override
  String get lookupTutorialStep3Title => 'Consulte et gère';

  @override
  String get lookupTutorialStep3Body =>
      'Tu verras si le sticker manque ou est déjà collecté. Avec les boutons + et – tu peux mettre à jour ton inventaire instantanément.';

  @override
  String get scanBadgeNew => 'Nouveau';

  @override
  String get scanBadgeRepeated => 'Doublon';

  @override
  String get scannerModeAdd => 'Ajouter des stickers';

  @override
  String get scannerModeRemoveDuplicates => 'Retirer les doublons';

  @override
  String get scannerRemoveModeHint => 'Centre le sticker doublon à retirer';

  @override
  String get removeDuplicatesTitle => 'Doublons à retirer';

  @override
  String get removeDuplicatesEmpty => 'Aucun doublon scanné pour l\'instant';

  @override
  String removeDuplicatesSavedSuccess(Object count) {
    return '$count doublons retirés de l\'inventaire 🗑️';
  }

  @override
  String removeDuplicatesSaveError(Object message) {
    return 'Erreur lors de la sauvegarde : $message';
  }

  @override
  String removeDuplicatesLimitWarning(Object label) {
    return '$label n\'a pas de stickers en double';
  }

  @override
  String removeDuplicatesReviewButton(Object count) {
    return 'Revoir $count à retirer';
  }

  @override
  String get navAlbum => 'Album';

  @override
  String get navScanner => 'Scanner';
}
