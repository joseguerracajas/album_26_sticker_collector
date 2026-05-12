// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => '球星贴纸册 26';

  @override
  String get authWelcomeTitle => '欢迎来到球星贴纸册 26';

  @override
  String get authEmailLabel => '电子邮件';

  @override
  String get authPasswordLabel => '密码';

  @override
  String get authLoginButton => '登录';

  @override
  String get authContinueWith => '或使用以下方式继续';

  @override
  String get authContinueGoogle => '使用 Google 继续';

  @override
  String get authContinueApple => '使用 Apple 继续';

  @override
  String get authContinueGuest => '以访客身份继续';

  @override
  String get authNoAccountRegister => '没有账号？立即注册';

  @override
  String get authForgotPassword => '忘记密码？';

  @override
  String get authResetPasswordEnterEmail => '请输入您的电子邮件以恢复密码。';

  @override
  String get authResetPasswordEmailSent => '我们已向您发送重置密码的电子邮件。';

  @override
  String get authGuestMigratedSuccess => '您的访客进度已成功转移到新账号！🏆';

  @override
  String get authGuestRemotePreserved => '欢迎回来！您的云端收藏已恢复，本地访客进度已丢弃。';

  @override
  String commonErrorWithMessage(Object message) {
    return '错误：$message';
  }

  @override
  String get authErrorInvalidCredentials => '电子邮件或密码不正确。请检查您的信息并重试。';

  @override
  String get authErrorEmailNotConfirmed => '您的电子邮件尚未确认。请检查您的收件箱。';

  @override
  String get authErrorUserAlreadyRegistered => '该电子邮件地址已存在账号。';

  @override
  String get authErrorWeakPassword => '密码太弱。请使用至少 6 个字符。';

  @override
  String get authErrorInvalidEmail => '电子邮件地址格式无效。';

  @override
  String get authErrorTokenExpired => '验证码已过期或无效。请重新申请。';

  @override
  String get authErrorRateLimit => '尝试次数过多。请稍候再试。';

  @override
  String get authErrorNetworkError => '无网络连接。请检查您的网络并重试。';

  @override
  String get authErrorSessionExpired => '您的会话已过期。请重新登录。';

  @override
  String get authErrorUnknown => '发生了意外错误。请重试。';

  @override
  String get registerTitle => '创建账号';

  @override
  String get registerFillAllFields => '请填写所有字段。';

  @override
  String get registerEmailsDontMatch => '电子邮件地址不匹配。';

  @override
  String get registerPasswordsDontMatch => '密码不匹配。';

  @override
  String get registerPasswordMinLength => '密码必须至少包含 6 个字符。';

  @override
  String get registerAccountCreated => '账号创建成功！⚽ 请登录。';

  @override
  String get registerConfirmEmailLabel => '确认电子邮件';

  @override
  String get registerConfirmPasswordLabel => '确认密码';

  @override
  String get registerSubmitButton => '注册';

  @override
  String get profileTitle => '我的个人资料';

  @override
  String get profileOfficialCollector => '官方收藏家 🌟';

  @override
  String get profileChangePasswordButton => '更新密码';

  @override
  String get profileChangePasswordTitle => '更新密码';

  @override
  String get profileNewPasswordLabel => '新密码';

  @override
  String get profileConfirmNewPasswordLabel => '确认新密码';

  @override
  String get profilePasswordUpdatedSuccess => '密码更新成功。';

  @override
  String get profileLogoutButton => '退出登录';

  @override
  String get profileLogoutSuccess => '已成功退出登录。';

  @override
  String get profileUnknownUser => '未知用户';

  @override
  String profileLogoutError(Object message) {
    return '退出登录时出错：$message';
  }

  @override
  String get homeTitle => '我的贴纸册 26';

  @override
  String get homeProfileTooltip => '我的个人资料';

  @override
  String get drawerSignIn => '登录';

  @override
  String get homeShareAll => '分享完整列表';

  @override
  String get homeShareMissingOnly => '仅显示缺少的';

  @override
  String get homeShareDuplicatesOnly => '仅显示重复的';

  @override
  String get homeGlobalProgressTitle => '总体进度';

  @override
  String homeCollectedCount(Object collected, Object total) {
    return '已收集 $total 中的 $collected';
  }

  @override
  String get homeViewFullCollection => '查看完整收藏';

  @override
  String get homeTeamsTitle => '球队';

  @override
  String get homeSearchTeamsHint => '按国家或球队搜索...';

  @override
  String get homeNoResults => '未找到球队';

  @override
  String get homeScanButton => '扫描贴纸';

  @override
  String homeObtainedCount(Object collected, Object total) {
    return '已获得 $total 中的 $collected';
  }

  @override
  String get homeProgressError => '错误';

  @override
  String get globalCollectionTitle => '完整收藏';

  @override
  String get filterAll => '全部';

  @override
  String get filterMissing => '缺少的';

  @override
  String get filterDuplicates => '重复的';

  @override
  String get filterSearchHint => '按国家、代码或编号搜索...';

  @override
  String get stickerRemoveTitle => '移除贴纸？';

  @override
  String stickerRemoveConfirm(Object stickerLabel) {
    return '您确定要从册子中移除贴纸 $stickerLabel 吗？';
  }

  @override
  String get commonCancel => '取消';

  @override
  String get commonRemove => '移除';

  @override
  String get commonDone => '完成';

  @override
  String get gridNoResults => '未找到贴纸。';

  @override
  String scannerViewScannedButton(Object count) {
    return '查看 $count 张已扫描贴纸';
  }

  @override
  String get scannerOverlayHint => '将贴纸背面居中放置于此';

  @override
  String get pendingScansTitle => '已扫描的贴纸';

  @override
  String get pendingScansEmpty => '您尚未扫描任何贴纸';

  @override
  String pendingScansItemLabel(Object code) {
    return '贴纸：$code';
  }

  @override
  String pendingScansSavedSuccess(Object count) {
    return '已成功将 $count 张贴纸添加到您的册子！🏆';
  }

  @override
  String pendingScansSaveError(Object message) {
    return '保存时出错：$message';
  }

  @override
  String get shareHeader => '⚽ *球星贴纸册 26 交换列表* 🏆';

  @override
  String get shareMissingSectionTitle => '❌ *缺少的：*';

  @override
  String get shareDuplicatesSectionTitle => '🔁 *重复的：*';

  @override
  String get shareNoneMissing => '一张不缺！😎';

  @override
  String get shareNoDuplicates => '没有重复 😅';

  @override
  String get shareLetsTrade => '想要交换吗？👀🔥';

  @override
  String get shareSeparator => '--------------------------';

  @override
  String get forgotPasswordTitle => '恢复账号';

  @override
  String get forgotPasswordDescription => '请输入您的电子邮件，我们将发送 6 位数验证码以重置密码。';

  @override
  String get forgotPasswordEmailLabel => '电子邮件';

  @override
  String get forgotPasswordEmptyEmailError => '请输入您的电子邮件地址。';

  @override
  String get forgotPasswordCodeSentSuccess => '验证码已发送。请检查您的收件箱。';

  @override
  String get forgotPasswordSendCodeButton => '发送验证码';

  @override
  String forgotPasswordStep2Description(Object email) {
    return '请输入我们发送到 $email 的验证码和您的新密码。';
  }

  @override
  String get forgotPasswordCodeInputLabel => '8 位数验证码';

  @override
  String get forgotPasswordInvalidCodeError => '验证码必须恰好为 6 位数字。';

  @override
  String get forgotPasswordNewPasswordLabel => '新密码';

  @override
  String get forgotPasswordShortPasswordError => '密码必须至少包含 6 个字符。';

  @override
  String get forgotPasswordSavePasswordButton => '保存密码';

  @override
  String get forgotPasswordPasswordUpdatedSuccess => '密码更新成功！🏆';

  @override
  String get validationEmailInvalid => '电子邮件地址无效。';

  @override
  String get paywallTitle => '无广告体验';

  @override
  String get paywallSubtitle => '所有功能均可免费使用。购买 Pro 享受无中断体验。';

  @override
  String get paywallBenefitScanner => '扫描器无插屏广告';

  @override
  String get paywallBenefitNoAds => '无广告';

  @override
  String get paywallBenefitSync => '包含云端同步';

  @override
  String paywallSubscribeButton(Object price) {
    return '订阅 · $price';
  }

  @override
  String get paywallPackageMonthly => '月度';

  @override
  String get paywallPackageAnnual => '年度';

  @override
  String get paywallPackageWeekly => '每周';

  @override
  String get paywallPackageLifetime => '终身';

  @override
  String get paywallPackageTwoMonth => '每 2 个月';

  @override
  String get paywallPackageThreeMonth => '每 3 个月';

  @override
  String get paywallPackageSixMonth => '每 6 个月';

  @override
  String get paywallBestOption => 'Mejor opción';

  @override
  String get paywallStartFreeTrial => 'Comenzar prueba gratis';

  @override
  String get paywallRestorePurchases => '恢复购买';

  @override
  String get paywallCancelAnytime => '随时取消。无需承诺。';

  @override
  String get paywallLoadError => '无法加载计划。请检查您的连接。';

  @override
  String get paywallRetry => '重试';

  @override
  String get paywallPurchaseError => '购买失败。请重试。';

  @override
  String get paywallRestoreError => '无法恢复购买。请重试。';

  @override
  String get paywallGuestTitle => '登录以订阅';

  @override
  String get paywallGuestBody => 'Pro 与您的账号绑定。请登录或创建账号以解锁所有功能。';

  @override
  String get paywallGuestSignInButton => '登录';

  @override
  String scannerDemoRemaining(Object count) {
    return '剩余 $count 次免费扫描';
  }

  @override
  String get scannerDemoFinishedTitle => '您已使用完 5 次免费扫描';

  @override
  String get scannerDemoFinishedSubtitle => '订阅以无限扫描贴纸并享受无广告体验。';

  @override
  String get scannerDemoUnlockButton => '查看 Pro 计划';

  @override
  String get adDialogTitle => '免费内容';

  @override
  String get adDialogBody => '若要继续，请观看一则短广告，或订阅 Pro 永远告别广告。';

  @override
  String get adDialogWatchAd => '观看广告';

  @override
  String get adDialogGetPro => '获取 Pro';

  @override
  String get adDialogNotNow => '暂不';

  @override
  String get scannerCameraInitError => '无法初始化摄像头。请确保应用拥有摄像头权限。';

  @override
  String get variantSheetTitle => '相册版本';

  @override
  String get variantSheetInventoryNote => '更换版本时，您的收藏将被保留。您已有的贴纸仍会保持记录。';

  @override
  String variantSheetLoadError(Object error) {
    return '加载版本时出错：$error';
  }

  @override
  String get variantSheetEmpty => '此相册没有可用的版本。';

  @override
  String get variantSheetDefaultLabel => '默认版本';

  @override
  String get variantMandatoryTitle => '选择您的地区';

  @override
  String get variantMandatorySubtitle => '选择您所在地区的相册版本。';

  @override
  String variantChangedSuccess(Object name) {
    return '已切换到 $name ✅';
  }

  @override
  String get profileDeleteAccountButton => '删除账户';

  @override
  String get profileDeleteAccountTitle => '删除您的账户？';

  @override
  String get profileDeleteAccountMessage => '此操作是永久性的。您的所有数据将被删除，您将无法恢复您的收藏。';

  @override
  String get profileDeleteAccountConfirmButton => '永久删除';

  @override
  String get profileDeleteAccountSuccess => '您的账户已被删除。';

  @override
  String get profileDeleteAccountError => '删除账户时出错。请重试。';

  @override
  String get paywallPrivacyPolicy => '隐私政策';

  @override
  String get paywallTermsOfUse => '使用条款';

  @override
  String get paywallLegalDisclaimer => '订阅即表示您同意我们的使用条款和隐私政策。';

  @override
  String get tutorialSkip => '跳过';

  @override
  String get tutorialTapToContinue => '点击任意位置继续';

  @override
  String get tutorialStep1Title => '你的整体进度';

  @override
  String get tutorialStep1Body => '在这里查看你收集了多少贴纸。继续收集吧！';

  @override
  String get tutorialStep2Title => '搜索队伍';

  @override
  String get tutorialStep2Body => '输入国家或队伍名称，即时筛选列表。';

  @override
  String get tutorialStep3Title => '主菜单';

  @override
  String get tutorialStep3Body => '访问你的个人资料，切换专辑版本。';

  @override
  String get tutorialStep4Title => '扫描贴纸';

  @override
  String get tutorialStep4Body => '使用相机扫描实体贴纸并自动添加到你的专辑中。';

  @override
  String get tutorialStep5Title => '分享列表';

  @override
  String get tutorialStep5Body => '导出你缺少或重复的贴纸列表，与朋友交换。';

  @override
  String get globalTutorialStep1Title => '筛选收藏';

  @override
  String get globalTutorialStep1Body => '使用这些按钮查看所有贴纸、仅缺少的或仅重复的。非常适合组织交换！';

  @override
  String get globalTutorialStep2Title => '搜索贴纸';

  @override
  String get globalTutorialStep2Body => '输入国家名称、代码或贴纸编号快速找到它。';

  @override
  String get globalTutorialStep3Title => '点击标记';

  @override
  String get globalTutorialStep3Body => '单击灰色贴纸将其添加到您的相册（变成金色）。再次点击将要求确认删除。';

  @override
  String get globalTutorialStep4Title => '长按查看更多选项';

  @override
  String get globalTutorialStep4Body =>
      '长按贴纸可以管理每种变体（Normal、Gold、Legend...）的副本数量。';

  @override
  String get tutorialStep6Title => '探索分类';

  @override
  String get tutorialStep6Body => '点击任意国家或球队查看贴纸。在那里可以标记已有的，并管理重复贴纸。';

  @override
  String get categoryTutorialStep1Title => '筛选贴纸';

  @override
  String get categoryTutorialStep1Body => '使用这些按钮查看所有贴纸、仅缺少的或仅重复的。';

  @override
  String get categoryTutorialStep2Title => '搜索贴纸';

  @override
  String get categoryTutorialStep2Body => '输入国家名称、代码或贴纸编号以快速找到它。';

  @override
  String get categoryTutorialStep3Title => '点击标记';

  @override
  String get categoryTutorialStep3Body =>
      '点击灰色贴纸将其添加到相册（变为金色）。如果已有并再次点击，将要求确认删除。';

  @override
  String get categoryTutorialStep4Title => '长按获取更多选项';

  @override
  String get categoryTutorialStep4Body =>
      '长按贴纸可以管理每种变体（Normal, Gold, Legend）的副本数量。';

  @override
  String get drawerReplayTutorial => '重新查看教程';

  @override
  String get variantTutorialTitle => '选择您的地区';

  @override
  String get variantTutorialBody =>
      '选择与您的国家或地区对应的专辑版本。这将决定您的收藏中显示哪些贴纸和变体（Normal、Gold、Legend）。';

  @override
  String get drawerLegalNotice => '法律声明';

  @override
  String get legalNoticeTitle => '法律声明';

  @override
  String get legalNoticeBody =>
      '此应用程序是非官方的球迷创作，与任何官方足球组织、贴纸制造商或足球锦标赛的官方合作伙伴均无关联、认可或连接。所有商标均为其各自所有者的财产。';

  @override
  String get statsTitle => '统计';

  @override
  String get statsTotalLabel => '总计';

  @override
  String get statsCollectedLabel => '已收集';

  @override
  String get statsDuplicateCopiesLabel => '重复贴纸';

  @override
  String get statsCategoriesTitle => '按类别';

  @override
  String get statsAllCategories => '全部';

  @override
  String get statsNoStatsYet => '暂无数据。开始收集吧！';

  @override
  String get statsBestCategory => '进度最多';

  @override
  String get statsWorstCategory => '进度最少';

  @override
  String get statsCompletedCategories => '已完成';

  @override
  String get drawerStats => '统计';

  @override
  String get statsCategoryPickerSearch => '搜索类别...';

  @override
  String statsCategoryPickerSelected(Object count) {
    return '已选$count项';
  }

  @override
  String get statsCategoryPickerAll => '所有类别';

  @override
  String get statsCategoryPickerClear => '清除';

  @override
  String get statsSortTooltip => '排序';

  @override
  String get statsSortByName => '分类';

  @override
  String get statsSortByProgressDesc => '进度最多优先';

  @override
  String get statsSortByProgressAsc => '进度最少优先';

  @override
  String get statsSortByMissing => '缺少最多优先';

  @override
  String get statsSortByDuplicates => '重复最多优先';

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
  String get drawerLookup => '贴纸查询';

  @override
  String get physicalExchangeVirtualBtn => 'Intercambio Virtual';

  @override
  String get lookupScreenTitle => '贴纸查询';

  @override
  String get lookupTabManual => '手动';

  @override
  String get lookupTabScanner => '扫描仪';

  @override
  String get lookupSearchHint => '例如: ECU 10, ARG 5, FRA 1...';

  @override
  String get lookupSearchButton => '搜索';

  @override
  String get lookupStickerNotFound => '未找到该代码的贴纸。';

  @override
  String get lookupStatusMissing => '未收集';

  @override
  String get lookupStatusCollected => '已拥有 ✓';

  @override
  String lookupStatusDuplicates(Object count) {
    return '$count 张重复 🔁';
  }

  @override
  String get lookupQtyLabel => '您库存中的数量';

  @override
  String get lookupScannerHint => '将贴纸居中以识别';

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
  String get lookupTutorialStep1Title => '两种搜索方式';

  @override
  String get lookupTutorialStep1Body => '使用“手动”选项卡输入贴纸代码，或使用“扫描仪”选项卡直接指向摄像头。';

  @override
  String get lookupTutorialStep2Title => '输入代码';

  @override
  String get lookupTutorialStep2Body =>
      '按相册中显示的格式输入贴纸代码，如 ECU 10 或 ARG 5，然后点击搜索。';

  @override
  String get lookupTutorialStep3Title => '查询并管理';

  @override
  String get lookupTutorialStep3Body => '您可以看到贴纸是否缺少或已收集。使用 + 和 – 按钮即刻更新库存。';

  @override
  String get scanBadgeNew => '新增';

  @override
  String get scanBadgeRepeated => '重复';

  @override
  String get navAlbum => '相册';

  @override
  String get navScanner => '扫描仪';
}
