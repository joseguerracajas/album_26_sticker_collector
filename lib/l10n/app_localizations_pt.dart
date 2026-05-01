// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Álbum 26';

  @override
  String get authWelcomeTitle => 'Bem-vindo ao Álbum 26';

  @override
  String get authEmailLabel => 'E-mail';

  @override
  String get authPasswordLabel => 'Senha';

  @override
  String get authLoginButton => 'ENTRAR';

  @override
  String get authContinueWith => 'Ou continue com';

  @override
  String get authContinueGoogle => 'Continuar com Google';

  @override
  String get authContinueApple => 'Continuar com Apple';

  @override
  String get authContinueGuest => 'Continuar como convidado';

  @override
  String get authNoAccountRegister => 'Não tem conta? Cadastre-se';

  @override
  String get authForgotPassword => 'Esqueceu sua senha?';

  @override
  String get authResetPasswordEnterEmail =>
      'Digite seu e-mail para recuperar a senha.';

  @override
  String get authResetPasswordEmailSent =>
      'Enviamos um e-mail para redefinir sua senha.';

  @override
  String get authGuestMigratedSuccess =>
      'Seu progresso como convidado foi transferido com sucesso para sua nova conta! 🏆';

  @override
  String get authGuestRemotePreserved =>
      'Bem-vindo de volta! Sua coleção da nuvem foi restaurada e o progresso local foi descartado.';

  @override
  String commonErrorWithMessage(Object message) {
    return 'Erro: $message';
  }

  @override
  String get authErrorInvalidCredentials =>
      'E-mail ou senha incorretos. Verifique seus dados e tente novamente.';

  @override
  String get authErrorEmailNotConfirmed =>
      'Seu e-mail ainda não foi confirmado. Verifique sua caixa de entrada.';

  @override
  String get authErrorUserAlreadyRegistered =>
      'Já existe uma conta com esse e-mail.';

  @override
  String get authErrorWeakPassword =>
      'A senha é muito fraca. Use pelo menos 6 caracteres.';

  @override
  String get authErrorInvalidEmail => 'O formato do e-mail não é válido.';

  @override
  String get authErrorTokenExpired =>
      'O código expirou ou é inválido. Solicite um novo.';

  @override
  String get authErrorRateLimit =>
      'Muitas tentativas. Aguarde um momento antes de tentar novamente.';

  @override
  String get authErrorNetworkError =>
      'Sem conexão. Verifique sua rede e tente novamente.';

  @override
  String get authErrorSessionExpired =>
      'Sua sessão expirou. Faça login novamente.';

  @override
  String get authErrorUnknown => 'Ocorreu um erro inesperado. Tente novamente.';

  @override
  String get registerTitle => 'Criar Conta';

  @override
  String get registerFillAllFields => 'Por favor, preencha todos os campos.';

  @override
  String get registerEmailsDontMatch => 'Os e-mails não coincidem.';

  @override
  String get registerPasswordsDontMatch => 'As senhas não coincidem.';

  @override
  String get registerPasswordMinLength =>
      'A senha deve ter pelo menos 6 caracteres.';

  @override
  String get registerAccountCreated =>
      'Conta criada com sucesso! ⚽ Faça login agora.';

  @override
  String get registerConfirmEmailLabel => 'Confirmar e-mail';

  @override
  String get registerConfirmPasswordLabel => 'Confirmar senha';

  @override
  String get registerSubmitButton => 'CADASTRAR';

  @override
  String get profileTitle => 'Meu Perfil';

  @override
  String get profileOfficialCollector => 'Colecionador Oficial 🌟';

  @override
  String get profileChangePasswordButton => 'Atualizar senha';

  @override
  String get profileChangePasswordTitle => 'Atualizar senha';

  @override
  String get profileNewPasswordLabel => 'Nova senha';

  @override
  String get profileConfirmNewPasswordLabel => 'Confirmar nova senha';

  @override
  String get profilePasswordUpdatedSuccess => 'Senha atualizada com sucesso.';

  @override
  String get profileLogoutButton => 'Sair';

  @override
  String get profileLogoutSuccess => 'Você saiu com sucesso.';

  @override
  String get profileUnknownUser => 'Usuário desconhecido';

  @override
  String profileLogoutError(Object message) {
    return 'Erro ao sair: $message';
  }

  @override
  String get homeTitle => 'Meu Álbum 26';

  @override
  String get homeProfileTooltip => 'Meu Perfil';

  @override
  String get drawerSignIn => 'Entrar';

  @override
  String get homeShareAll => 'Compartilhar Lista Completa';

  @override
  String get homeShareMissingOnly => 'Só Faltantes';

  @override
  String get homeShareDuplicatesOnly => 'Só Repetidas';

  @override
  String get homeGlobalProgressTitle => 'Progresso Global';

  @override
  String homeCollectedCount(Object collected, Object total) {
    return '$collected de $total coletadas';
  }

  @override
  String get homeViewFullCollection => 'Ver Coleção Completa';

  @override
  String get homeTeamsTitle => 'Seleções';

  @override
  String get homeSearchTeamsHint => 'Buscar por país ou time...';

  @override
  String get homeNoResults => 'Nenhum time encontrado';

  @override
  String get homeScanButton => 'Escanear Figurinha';

  @override
  String homeObtainedCount(Object collected, Object total) {
    return '$collected de $total obtidas';
  }

  @override
  String get homeProgressError => 'Erro';

  @override
  String get globalCollectionTitle => 'Coleção Completa';

  @override
  String get filterAll => 'Todas';

  @override
  String get filterMissing => 'Faltantes';

  @override
  String get filterDuplicates => 'Repetidas';

  @override
  String get filterSearchHint => 'Buscar por país, código ou número...';

  @override
  String get stickerRemoveTitle => 'Remover figurinha?';

  @override
  String stickerRemoveConfirm(Object stickerLabel) {
    return 'Tem certeza que deseja remover a figurinha $stickerLabel do seu álbum?';
  }

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonRemove => 'Remover';

  @override
  String get commonDone => 'PRONTO';

  @override
  String get gridNoResults => 'Nenhuma figurinha encontrada.';

  @override
  String scannerViewScannedButton(Object count) {
    return 'Revisar $count figurinhas escaneadas';
  }

  @override
  String get scannerOverlayHint => 'Centre o verso da figurinha aqui';

  @override
  String get pendingScansTitle => 'Figurinhas Escaneadas';

  @override
  String get pendingScansEmpty => 'Você ainda não escaneou nenhuma figurinha';

  @override
  String pendingScansItemLabel(Object code) {
    return 'Figurinha: $code';
  }

  @override
  String pendingScansSavedSuccess(Object count) {
    return '$count figurinhas adicionadas ao seu álbum! 🏆';
  }

  @override
  String pendingScansSaveError(Object message) {
    return 'Erro ao salvar: $message';
  }

  @override
  String get shareHeader => '⚽ *LISTA DE TROCA ÁLBUM 26* 🏆';

  @override
  String get shareMissingSectionTitle => '❌ *FALTAM:*';

  @override
  String get shareDuplicatesSectionTitle => '🔁 *REPETIDAS:*';

  @override
  String get shareNoneMissing => 'Nenhuma! 😎';

  @override
  String get shareNoDuplicates => 'Sem repetidas 😅';

  @override
  String get shareLetsTrade => 'Quer trocar? 👀🔥';

  @override
  String get shareSeparator => '--------------------------';

  @override
  String get forgotPasswordTitle => 'Recuperar Conta';

  @override
  String get forgotPasswordDescription =>
      'Digite seu e-mail e enviaremos um código de 6 dígitos para redefinir sua senha.';

  @override
  String get forgotPasswordEmailLabel => 'E-mail';

  @override
  String get forgotPasswordEmptyEmailError => 'Por favor, digite seu e-mail.';

  @override
  String get forgotPasswordCodeSentSuccess =>
      'Código enviado. Verifique sua caixa de entrada.';

  @override
  String get forgotPasswordSendCodeButton => 'ENVIAR CÓDIGO';

  @override
  String forgotPasswordStep2Description(Object email) {
    return 'Digite o código que enviamos para $email e sua nova senha.';
  }

  @override
  String get forgotPasswordCodeInputLabel => 'Código de 8 dígitos';

  @override
  String get forgotPasswordInvalidCodeError =>
      'O código deve ter exatamente 6 dígitos.';

  @override
  String get forgotPasswordNewPasswordLabel => 'Nova Senha';

  @override
  String get forgotPasswordShortPasswordError =>
      'A senha deve ter pelo menos 6 caracteres.';

  @override
  String get forgotPasswordSavePasswordButton => 'SALVAR SENHA';

  @override
  String get forgotPasswordPasswordUpdatedSuccess =>
      'Senha atualizada com sucesso! 🏆';

  @override
  String get validationEmailInvalid => 'O endereço de e-mail não é válido.';

  @override
  String get paywallTitle => 'Aproveite sem anúncios';

  @override
  String get paywallSubtitle =>
      'Todos os recursos são gratuitos. Com o Pro você aproveita tudo sem interrupções.';

  @override
  String get paywallBenefitScanner => 'Scanner sem anúncios intersticiais';

  @override
  String get paywallBenefitNoAds => 'Sem anúncios';

  @override
  String get paywallBenefitSync => 'Sincronização na nuvem incluída';

  @override
  String paywallSubscribeButton(Object price) {
    return 'Assinar · $price';
  }

  @override
  String get paywallPackageMonthly => 'Mensal';

  @override
  String get paywallPackageAnnual => 'Anual';

  @override
  String get paywallPackageWeekly => 'Semanal';

  @override
  String get paywallPackageLifetime => 'Vitalício';

  @override
  String get paywallPackageTwoMonth => 'A cada 2 meses';

  @override
  String get paywallPackageThreeMonth => 'A cada 3 meses';

  @override
  String get paywallPackageSixMonth => 'A cada 6 meses';

  @override
  String get paywallRestorePurchases => 'Restaurar compras';

  @override
  String get paywallCancelAnytime => 'Cancele quando quiser. Sem compromisso.';

  @override
  String get paywallLoadError =>
      'Não foi possível carregar os planos. Verifique sua conexão.';

  @override
  String get paywallRetry => 'Tentar novamente';

  @override
  String get paywallPurchaseError => 'Falha na compra. Tente novamente.';

  @override
  String get paywallRestoreError =>
      'Não foi possível restaurar as compras. Tente novamente.';

  @override
  String get paywallGuestTitle => 'Entre para assinar';

  @override
  String get paywallGuestBody =>
      'O Pro está vinculado à sua conta. Entre ou crie uma conta para desbloquear todos os recursos.';

  @override
  String get paywallGuestSignInButton => 'ENTRAR';

  @override
  String scannerDemoRemaining(Object count) {
    return '$count escaneamentos gratuitos restantes';
  }

  @override
  String get scannerDemoFinishedTitle =>
      'Você usou seus 5 escaneamentos gratuitos';

  @override
  String get scannerDemoFinishedSubtitle =>
      'Assine para escanear figurinhas ilimitadas e ter uma experiência sem anúncios.';

  @override
  String get scannerDemoUnlockButton => 'Ver Planos Pro';

  @override
  String get adDialogTitle => 'Conteúdo gratuito';

  @override
  String get adDialogBody =>
      'Para continuar, assista a um breve anúncio ou assine o Pro e esqueça os anúncios para sempre.';

  @override
  String get adDialogWatchAd => 'Assistir anúncio';

  @override
  String get adDialogGetPro => 'Obter Pro';

  @override
  String get adDialogNotNow => 'Agora não';

  @override
  String get scannerCameraInitError =>
      'Não foi possível inicializar a câmera. Verifique se o app tem permissão de câmera.';

  @override
  String get variantSheetTitle => 'Variante do álbum';

  @override
  String get variantSheetInventoryNote =>
      'Seu inventário é preservado ao mudar de variante. As figurinhas que você já tem continuam registradas.';

  @override
  String variantSheetLoadError(Object error) {
    return 'Erro ao carregar variantes: $error';
  }

  @override
  String get variantSheetEmpty =>
      'Nenhuma variante disponível para este álbum.';

  @override
  String get variantSheetDefaultLabel => 'Variante padrão';

  @override
  String get variantMandatoryTitle => 'Escolha a sua região';

  @override
  String get variantMandatorySubtitle =>
      'Selecione a versão do álbum para a sua região.';

  @override
  String variantChangedSuccess(Object name) {
    return 'Variante alterada para $name ✅';
  }

  @override
  String get profileDeleteAccountButton => 'Eliminar conta';

  @override
  String get profileDeleteAccountTitle => 'Eliminar a sua conta?';

  @override
  String get profileDeleteAccountMessage =>
      'Esta ação é permanente. Todos os seus dados serão eliminados e não poderá recuperar a sua coleção.';

  @override
  String get profileDeleteAccountConfirmButton => 'Eliminar definitivamente';

  @override
  String get profileDeleteAccountSuccess => 'A sua conta foi eliminada.';

  @override
  String get profileDeleteAccountError =>
      'Erro ao eliminar a conta. Tente novamente.';

  @override
  String get paywallPrivacyPolicy => 'Política de Privacidade';

  @override
  String get paywallTermsOfUse => 'Termos de Utilização';

  @override
  String get paywallLegalDisclaimer =>
      'Ao subscrever, aceita os nossos Termos de Utilização e a nossa Política de Privacidade.';

  @override
  String get tutorialSkip => 'Pular';

  @override
  String get tutorialTapToContinue => 'Toque em qualquer lugar para continuar';

  @override
  String get tutorialStep1Title => 'Seu progresso global';

  @override
  String get tutorialStep1Body =>
      'Veja quantas figurinhas coletou. Continue colecionando!';

  @override
  String get tutorialStep2Title => 'Buscar times';

  @override
  String get tutorialStep2Body =>
      'Digite o nome de um país ou time para filtrar a lista.';

  @override
  String get tutorialStep3Title => 'Menu principal';

  @override
  String get tutorialStep3Body =>
      'Acesse seu perfil e mude a variante do álbum.';

  @override
  String get tutorialStep4Title => 'Escanear figurinhas';

  @override
  String get tutorialStep4Body =>
      'Use a câmera para escanear figurinhas físicas e adicioná-las automaticamente.';

  @override
  String get tutorialStep5Title => 'Compartilhar lista';

  @override
  String get tutorialStep5Body =>
      'Exporte sua lista de figurinhas faltantes ou repetidas para trocar.';

  @override
  String get globalTutorialStep1Title => 'Filtrar a coleção';

  @override
  String get globalTutorialStep1Body =>
      'Use esses botões para ver todas as suas figurinhas, apenas as que faltam ou apenas as repetidas. Ideal para organizar trocas!';

  @override
  String get globalTutorialStep2Title => 'Buscar uma figurinha';

  @override
  String get globalTutorialStep2Body =>
      'Digite o nome do país, o código ou o número da figurinha para encontrá-la rapidamente.';

  @override
  String get globalTutorialStep3Title => 'Toque para marcar';

  @override
  String get globalTutorialStep3Body =>
      'Um toque numa figurinha cinza a adiciona ao seu álbum (fica dourada). Se tocar novamente, será pedida confirmação para removê-la.';

  @override
  String get globalTutorialStep4Title => 'Toque longo para mais opções';

  @override
  String get globalTutorialStep4Body =>
      'Mantenha uma figurinha pressionada para gerenciar quantas cópias você tem de cada variante (Normal, Gold, Legend...).';

  @override
  String get tutorialStep6Title => 'Explorar uma categoria';

  @override
  String get tutorialStep6Body =>
      'Toque em qualquer pais ou equipa para ver as suas cromos. La pode marcar os que ja tem e gerir os repetidos.';

  @override
  String get categoryTutorialStep1Title => 'Filtrar cromos';

  @override
  String get categoryTutorialStep1Body =>
      'Use estes botoes para ver todos os cromos desta categoria, apenas os que faltam ou apenas os repetidos.';

  @override
  String get categoryTutorialStep2Title => 'Procurar um cromo';

  @override
  String get categoryTutorialStep2Body =>
      'Escreva o nome do pais, o codigo ou o numero do cromo para o encontrar rapidamente.';

  @override
  String get categoryTutorialStep3Title => 'Toque para marcar';

  @override
  String get categoryTutorialStep3Body =>
      'Tocar num cromo cinza adiciona-o ao album (fica dourado). Se ja o tem e tocar novamente, sera pedida confirmacao para o remover.';

  @override
  String get categoryTutorialStep4Title => 'Pressione para mais opcoes';

  @override
  String get categoryTutorialStep4Body =>
      'Pressionar prolongadamente um cromo permite gerir quantas copias tem de cada variante (Normal, Gold, Legend).';

  @override
  String get drawerReplayTutorial => 'Ver tutorial novamente';
}
