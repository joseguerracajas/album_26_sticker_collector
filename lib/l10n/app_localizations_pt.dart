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
}
