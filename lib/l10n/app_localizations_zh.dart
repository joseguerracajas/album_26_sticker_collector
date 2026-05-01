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
      '选择与您的国家或地区对应的专辑版本。这将决定您的收藏中显示哪些贴纸和变体(Normal, Gold, Legend)。';
}
