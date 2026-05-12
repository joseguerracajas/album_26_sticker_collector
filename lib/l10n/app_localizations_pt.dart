// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Sticker Album 2026';

  @override
  String get authWelcomeTitle => 'Bem-vindo ao Sticker Album 2026';

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
  String get homeTitle => 'Sticker Album 2026';

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
  String get shareHeader => '⚽ *LISTA DE TROCA STICKER ALBUM 2026* 🏆';

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
  String shareDownloadLink(String appName) {
    return '📲 Baixar o app de $appName\nhttps://onelink.to/5adrft?olbm=1';
  }

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
  String get paywallBestOption => 'Mejor opción';

  @override
  String get paywallStartFreeTrial => 'Comenzar prueba gratis';

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
      'Toque em qualquer pais ou equipa para ver as suas figurinhas. La pode marcar as que ja tem e gerir as repetidas.';

  @override
  String get categoryTutorialStep1Title => 'Filtrar figurinhas';

  @override
  String get categoryTutorialStep1Body =>
      'Use estes botoes para ver todas as figurinhas desta categoria, apenas as que faltam ou apenas as repetidas.';

  @override
  String get categoryTutorialStep2Title => 'Procurar uma figurinha';

  @override
  String get categoryTutorialStep2Body =>
      'Escreva o nome do pais, o codigo ou o numero da figurinha para a encontrar rapidamente.';

  @override
  String get categoryTutorialStep3Title => 'Toque para marcar';

  @override
  String get categoryTutorialStep3Body =>
      'Tocar numa figurinha cinza adiciona-a ao album (fica dourada). Se ja a tem e tocar novamente, sera pedida confirmacao para a remover.';

  @override
  String get categoryTutorialStep4Title => 'Pressione para mais opcoes';

  @override
  String get categoryTutorialStep4Body =>
      'Pressionar prolongadamente uma figurinha permite gerir quantas copias tem de cada variante (Normal, Gold, Legend).';

  @override
  String get drawerReplayTutorial => 'Ver tutorial novamente';

  @override
  String get variantTutorialTitle => 'Selecione a sua região';

  @override
  String get variantTutorialBody =>
      'Escolha a variante do álbum que corresponde ao seu país ou região. Isso define quais figurinhas e variantes (Normal, Gold, Legend) aparecerão na sua coleção.';

  @override
  String get drawerLegalNotice => 'Aviso Legal';

  @override
  String get legalNoticeTitle => 'Aviso Legal';

  @override
  String get legalNoticeBody =>
      'Esta aplicação é uma criação não oficial de fãs e não está afiliada, apoiada ou conectada a qualquer organização oficial de futebol, fabricante de figurinhas ou parceiro oficial do torneio de futebol. Todas as marcas registadas são propriedade dos seus respetivos proprietários.';

  @override
  String get statsTitle => 'Estatísticas';

  @override
  String get statsTotalLabel => 'Total';

  @override
  String get statsCollectedLabel => 'Recolhidas';

  @override
  String get statsDuplicateCopiesLabel => 'Repetidos';

  @override
  String get statsCategoriesTitle => 'Por Categoria';

  @override
  String get statsAllCategories => 'Todas';

  @override
  String get statsNoStatsYet => 'Sem dados ainda. Comece a colecionar!';

  @override
  String get statsBestCategory => 'Maior progresso';

  @override
  String get statsWorstCategory => 'Menor progresso';

  @override
  String get statsCompletedCategories => 'Concluídas';

  @override
  String get drawerStats => 'Estatísticas';

  @override
  String get statsCategoryPickerSearch => 'Pesquisar categoria...';

  @override
  String statsCategoryPickerSelected(Object count) {
    return '$count selecionadas';
  }

  @override
  String get statsCategoryPickerAll => 'Todas as categorias';

  @override
  String get statsCategoryPickerClear => 'Limpar';

  @override
  String get statsSortTooltip => 'Ordenar';

  @override
  String get statsSortByName => 'Categoria';

  @override
  String get statsSortByProgressDesc => 'Maior progresso primeiro';

  @override
  String get statsSortByProgressAsc => 'Menor progresso primeiro';

  @override
  String get statsSortByMissing => 'Mais faltantes primeiro';

  @override
  String get statsSortByDuplicates => 'Mais repetidos primeiro';

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
  String get drawerLookup => 'Consultar figurinha';

  @override
  String get physicalExchangeVirtualBtn => 'Intercambio Virtual';

  @override
  String get lookupScreenTitle => 'Consultar figurinha';

  @override
  String get lookupTabManual => 'Manual';

  @override
  String get lookupTabScanner => 'Scanner';

  @override
  String get lookupSearchHint => 'Ex.: ECU 10, ARG 5, FRA 1...';

  @override
  String get lookupSearchButton => 'Buscar';

  @override
  String get lookupStickerNotFound =>
      'Nenhuma figurinha encontrada com esse código.';

  @override
  String get lookupStatusMissing => 'Está faltando';

  @override
  String get lookupStatusCollected => 'Você já tem ✓';

  @override
  String lookupStatusDuplicates(Object count) {
    return '$count repetido(s) 🔁';
  }

  @override
  String get lookupQtyLabel => 'Quantidade no seu inventário';

  @override
  String get lookupScannerHint => 'Centralize a figurinha para identificá-la';

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
  String get lookupTutorialStep1Title => 'Duas formas de buscar';

  @override
  String get lookupTutorialStep1Body =>
      'Use a aba Manual para digitar o código da figurinha ou a aba Scanner para apontar a câmera diretamente.';

  @override
  String get lookupTutorialStep2Title => 'Digite o código';

  @override
  String get lookupTutorialStep2Body =>
      'Escreva o código da figurinha como aparece no álbum, ex. ECU 10 ou ARG 5, e toque em Buscar.';

  @override
  String get lookupTutorialStep3Title => 'Consulte e gerencie';

  @override
  String get lookupTutorialStep3Body =>
      'Você verá se a figurinha está faltando ou já tem. Com + e – você pode atualizar seu inventário na hora.';

  @override
  String get scanBadgeNew => 'Novo';

  @override
  String get scanBadgeRepeated => 'Repetido';

  @override
  String get navAlbum => 'Álbum';

  @override
  String get navScanner => 'Scanner';
}
