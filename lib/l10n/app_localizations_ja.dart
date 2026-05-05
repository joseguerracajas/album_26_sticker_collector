// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'アルバム26';

  @override
  String get authWelcomeTitle => 'アルバム26へようこそ';

  @override
  String get authEmailLabel => 'メールアドレス';

  @override
  String get authPasswordLabel => 'パスワード';

  @override
  String get authLoginButton => 'ログイン';

  @override
  String get authContinueWith => 'または以下で続行';

  @override
  String get authContinueGoogle => 'Googleで続行';

  @override
  String get authContinueApple => 'Appleで続行';

  @override
  String get authContinueGuest => 'ゲストとして続行';

  @override
  String get authNoAccountRegister => 'アカウントをお持ちでない方は登録';

  @override
  String get authForgotPassword => 'パスワードをお忘れですか？';

  @override
  String get authResetPasswordEnterEmail => 'パスワードを回復するためにメールアドレスを入力してください。';

  @override
  String get authResetPasswordEmailSent => 'パスワードのリセット用メールを送信しました。';

  @override
  String get authGuestMigratedSuccess => 'ゲストの進捗が新しいアカウントに正常に転送されました！🏆';

  @override
  String get authGuestRemotePreserved =>
      'お帰りなさい！クラウドコレクションが復元され、ローカルのゲスト進捗は削除されました。';

  @override
  String commonErrorWithMessage(Object message) {
    return 'エラー: $message';
  }

  @override
  String get authErrorInvalidCredentials =>
      'メールアドレスまたはパスワードが間違っています。詳細を確認して再試行してください。';

  @override
  String get authErrorEmailNotConfirmed =>
      'メールアドレスがまだ確認されていません。受信トレイを確認してください。';

  @override
  String get authErrorUserAlreadyRegistered => 'そのメールアドレスで既にアカウントが存在します。';

  @override
  String get authErrorWeakPassword => 'パスワードが弱すぎます。少なくとも6文字以上を使用してください。';

  @override
  String get authErrorInvalidEmail => 'メールアドレスの形式が無効です。';

  @override
  String get authErrorTokenExpired => 'コードが期限切れまたは無効です。新しいコードをリクエストしてください。';

  @override
  String get authErrorRateLimit => '試行回数が多すぎます。しばらく待ってから再試行してください。';

  @override
  String get authErrorNetworkError => '接続がありません。ネットワークを確認して再試行してください。';

  @override
  String get authErrorSessionExpired => 'セッションが期限切れです。再度ログインしてください。';

  @override
  String get authErrorUnknown => '予期しないエラーが発生しました。再試行してください。';

  @override
  String get registerTitle => 'アカウントを作成';

  @override
  String get registerFillAllFields => 'すべてのフィールドを入力してください。';

  @override
  String get registerEmailsDontMatch => 'メールアドレスが一致しません。';

  @override
  String get registerPasswordsDontMatch => 'パスワードが一致しません。';

  @override
  String get registerPasswordMinLength => 'パスワードは少なくとも6文字以上にしてください。';

  @override
  String get registerAccountCreated => 'アカウントが正常に作成されました！⚽ ログインしてください。';

  @override
  String get registerConfirmEmailLabel => 'メールアドレスを確認';

  @override
  String get registerConfirmPasswordLabel => 'パスワードを確認';

  @override
  String get registerSubmitButton => '登録';

  @override
  String get profileTitle => 'マイプロフィール';

  @override
  String get profileOfficialCollector => '公式コレクター 🌟';

  @override
  String get profileChangePasswordButton => 'パスワードを更新';

  @override
  String get profileChangePasswordTitle => 'パスワードを更新';

  @override
  String get profileNewPasswordLabel => '新しいパスワード';

  @override
  String get profileConfirmNewPasswordLabel => '新しいパスワードを確認';

  @override
  String get profilePasswordUpdatedSuccess => 'パスワードが正常に更新されました。';

  @override
  String get profileLogoutButton => 'ログアウト';

  @override
  String get profileLogoutSuccess => '正常にログアウトしました。';

  @override
  String get profileUnknownUser => '不明なユーザー';

  @override
  String profileLogoutError(Object message) {
    return 'ログアウトエラー: $message';
  }

  @override
  String get homeTitle => 'マイアルバム26';

  @override
  String get homeProfileTooltip => 'マイプロフィール';

  @override
  String get drawerSignIn => 'サインイン';

  @override
  String get homeShareAll => '完全なリストを共有';

  @override
  String get homeShareMissingOnly => '不足のみ';

  @override
  String get homeShareDuplicatesOnly => '重複のみ';

  @override
  String get homeGlobalProgressTitle => '全体の進捗';

  @override
  String homeCollectedCount(Object collected, Object total) {
    return '$total枚中$collected枚収集済み';
  }

  @override
  String get homeViewFullCollection => '完全なコレクションを表示';

  @override
  String get homeTeamsTitle => 'チーム';

  @override
  String get homeSearchTeamsHint => '国またはチームで検索...';

  @override
  String get homeNoResults => 'チームが見つかりません';

  @override
  String get homeScanButton => 'シールをスキャン';

  @override
  String homeObtainedCount(Object collected, Object total) {
    return '$total枚中$collected枚取得済み';
  }

  @override
  String get homeProgressError => 'エラー';

  @override
  String get globalCollectionTitle => '完全なコレクション';

  @override
  String get filterAll => 'すべて';

  @override
  String get filterMissing => '不足';

  @override
  String get filterDuplicates => '重複';

  @override
  String get filterSearchHint => '国、コード、または番号で検索...';

  @override
  String get stickerRemoveTitle => 'シールを削除しますか？';

  @override
  String stickerRemoveConfirm(Object stickerLabel) {
    return 'シール $stickerLabel をアルバムから削除してもよろしいですか？';
  }

  @override
  String get commonCancel => 'キャンセル';

  @override
  String get commonRemove => '削除';

  @override
  String get commonDone => '完了';

  @override
  String get gridNoResults => 'シールが見つかりません。';

  @override
  String scannerViewScannedButton(Object count) {
    return 'スキャンした$count枚のシールを確認';
  }

  @override
  String get scannerOverlayHint => 'シールの裏面をここに中央に合わせてください';

  @override
  String get pendingScansTitle => 'スキャン済みシール';

  @override
  String get pendingScansEmpty => 'まだシールをスキャンしていません';

  @override
  String pendingScansItemLabel(Object code) {
    return 'シール: $code';
  }

  @override
  String pendingScansSavedSuccess(Object count) {
    return '$count枚のシールがアルバムに追加されました！🏆';
  }

  @override
  String pendingScansSaveError(Object message) {
    return '保存エラー: $message';
  }

  @override
  String get shareHeader => '⚽ *アルバム26 交換リスト* 🏆';

  @override
  String get shareMissingSectionTitle => '❌ *不足:*';

  @override
  String get shareDuplicatesSectionTitle => '🔁 *重複:*';

  @override
  String get shareNoneMissing => 'なし！😎';

  @override
  String get shareNoDuplicates => '重複なし 😅';

  @override
  String get shareLetsTrade => '交換しませんか？👀🔥';

  @override
  String get shareSeparator => '--------------------------';

  @override
  String get forgotPasswordTitle => 'アカウントを回復';

  @override
  String get forgotPasswordDescription =>
      'メールアドレスを入力してください。パスワードをリセットするための6桁のコードを送信します。';

  @override
  String get forgotPasswordEmailLabel => 'メールアドレス';

  @override
  String get forgotPasswordEmptyEmailError => 'メールアドレスを入力してください。';

  @override
  String get forgotPasswordCodeSentSuccess => 'コードを送信しました。受信トレイを確認してください。';

  @override
  String get forgotPasswordSendCodeButton => 'コードを送信';

  @override
  String forgotPasswordStep2Description(Object email) {
    return '$email に送信したコードと新しいパスワードを入力してください。';
  }

  @override
  String get forgotPasswordCodeInputLabel => '8桁のコード';

  @override
  String get forgotPasswordInvalidCodeError => 'コードは正確に6桁でなければなりません。';

  @override
  String get forgotPasswordNewPasswordLabel => '新しいパスワード';

  @override
  String get forgotPasswordShortPasswordError => 'パスワードは少なくとも6文字以上にしてください。';

  @override
  String get forgotPasswordSavePasswordButton => 'パスワードを保存';

  @override
  String get forgotPasswordPasswordUpdatedSuccess => 'パスワードが正常に更新されました！🏆';

  @override
  String get validationEmailInvalid => 'メールアドレスが無効です。';

  @override
  String get paywallTitle => '広告なしで楽しむ';

  @override
  String get paywallSubtitle => 'すべての機能は無料でご利用いただけます。Proで中断なく全機能をお楽しみください。';

  @override
  String get paywallBenefitScanner => 'インタースティシャル広告なしのスキャナー';

  @override
  String get paywallBenefitNoAds => '広告なし';

  @override
  String get paywallBenefitSync => 'クラウド同期を含む';

  @override
  String paywallSubscribeButton(Object price) {
    return '購読 · $price';
  }

  @override
  String get paywallPackageMonthly => '月額';

  @override
  String get paywallPackageAnnual => '年額';

  @override
  String get paywallPackageWeekly => '週額';

  @override
  String get paywallPackageLifetime => '永久';

  @override
  String get paywallPackageTwoMonth => '2ヶ月ごと';

  @override
  String get paywallPackageThreeMonth => '3ヶ月ごと';

  @override
  String get paywallPackageSixMonth => '6ヶ月ごと';

  @override
  String get paywallRestorePurchases => '購入を復元';

  @override
  String get paywallCancelAnytime => 'いつでもキャンセル可能。コミットメント不要。';

  @override
  String get paywallLoadError => 'プランを読み込めませんでした。接続を確認してください。';

  @override
  String get paywallRetry => '再試行';

  @override
  String get paywallPurchaseError => '購入に失敗しました。再試行してください。';

  @override
  String get paywallRestoreError => '購入を復元できませんでした。再試行してください。';

  @override
  String get paywallGuestTitle => '購読するにはログイン';

  @override
  String get paywallGuestBody =>
      'Proはアカウントにリンクされています。全機能をアンロックするにはログインまたはアカウント作成してください。';

  @override
  String get paywallGuestSignInButton => 'ログイン';

  @override
  String scannerDemoRemaining(Object count) {
    return '無料スキャン残り$count回';
  }

  @override
  String get scannerDemoFinishedTitle => '5回の無料スキャンを使い切りました';

  @override
  String get scannerDemoFinishedSubtitle => '無制限のシールスキャンと広告なし体験のために購読してください。';

  @override
  String get scannerDemoUnlockButton => 'Proプランを見る';

  @override
  String get adDialogTitle => '無料コンテンツ';

  @override
  String get adDialogBody => '続行するには短い広告を見るか、Proに購読して広告を永遠に忘れてください。';

  @override
  String get adDialogWatchAd => '広告を見る';

  @override
  String get adDialogGetPro => 'Proを取得';

  @override
  String get adDialogNotNow => '今はしない';

  @override
  String get scannerCameraInitError =>
      'カメラを初期化できませんでした。アプリにカメラのア クセス許可があることを確認してください。';

  @override
  String get variantSheetTitle => 'アルバムのバリアント';

  @override
  String get variantSheetInventoryNote =>
      'バリアントを変更してもインベントリは保持されます。すでに持っているステッカーは引き続き記録されます。';

  @override
  String variantSheetLoadError(Object error) {
    return 'バリアントの読み込みエラー: $error';
  }

  @override
  String get variantSheetEmpty => 'このアルバムで利用可能なバリアントはありません。';

  @override
  String get variantSheetDefaultLabel => 'デフォルトバリアント';

  @override
  String get variantMandatoryTitle => '地域を選んでください';

  @override
  String get variantMandatorySubtitle => 'あなたの地域のアルバムバージョンを選択してください。';

  @override
  String variantChangedSuccess(Object name) {
    return '$name に変更しました ✅';
  }

  @override
  String get profileDeleteAccountButton => 'アカウントを削除';

  @override
  String get profileDeleteAccountTitle => 'アカウントを削除しますか？';

  @override
  String get profileDeleteAccountMessage =>
      'この操作は永久的です。すべてのデータが削除され、コレクションを元に戻すことはできません。';

  @override
  String get profileDeleteAccountConfirmButton => '完全に削除する';

  @override
  String get profileDeleteAccountSuccess => 'アカウントが削除されました。';

  @override
  String get profileDeleteAccountError => 'アカウントの削除中にエラーが発生しました。もう一度お試しください。';

  @override
  String get paywallPrivacyPolicy => 'プライバシーポリシー';

  @override
  String get paywallTermsOfUse => '利用規約';

  @override
  String get paywallLegalDisclaimer =>
      'サブスクライブすることで、利用規約とプライバシーポリシーに同意したことになります。';

  @override
  String get tutorialSkip => 'スキップ';

  @override
  String get tutorialTapToContinue => '続けるには画面をタップしてください';

  @override
  String get tutorialStep1Title => '全体の進捗';

  @override
  String get tutorialStep1Body => '集めたシールの数と完成率を確認できます。集め続けましょう！';

  @override
  String get tutorialStep2Title => 'チームを検索';

  @override
  String get tutorialStep2Body => '国名やチーム名を入力してリストを絞り込みます。';

  @override
  String get tutorialStep3Title => 'メインメニュー';

  @override
  String get tutorialStep3Body => 'プロフィールへのアクセスとアルバムのバリエーション変更ができます。';

  @override
  String get tutorialStep4Title => 'シールをスキャン';

  @override
  String get tutorialStep4Body => 'カメラを使ってシールをスキャンし、自動でアルバムに追加します。';

  @override
  String get tutorialStep5Title => 'リストを共有';

  @override
  String get tutorialStep5Body => '不足や重複しているシールのリストをエクスポートして友達と交換しましょう。';

  @override
  String get globalTutorialStep1Title => 'コレクションを絞り込む';

  @override
  String get globalTutorialStep1Body =>
      'このボタンでシール全体、不足しているもの、または重複しているものだけを表示できます。交換の整理に最適です！';

  @override
  String get globalTutorialStep2Title => 'シールを検索';

  @override
  String get globalTutorialStep2Body => '国名、コード、またはシール番号を入力して素早く見つけます。';

  @override
  String get globalTutorialStep3Title => 'タップしてマーク';

  @override
  String get globalTutorialStep3Body =>
      '灰色のシールを1回タップするとアルバムに追加されます（金色になります）。再度タップすると削除の確認が求められます。';

  @override
  String get globalTutorialStep4Title => '長押しで詳細オプション';

  @override
  String get globalTutorialStep4Body =>
      'シールを長押しすると各バリアント（Normal、Gold、Legend...）の所持数を管理できます。';

  @override
  String get tutorialStep6Title => 'カテゴリを探索する';

  @override
  String get tutorialStep6Body =>
      '国やチームをタップしてステッカーを確認しましょう。そこで持っているものをマークし、重複を管理できます。';

  @override
  String get categoryTutorialStep1Title => 'ステッカーを絞り込む';

  @override
  String get categoryTutorialStep1Body => 'このボタンで、全てのステッカー・未収集のみ・重複のみを表示できます。';

  @override
  String get categoryTutorialStep2Title => 'ステッカーを検索する';

  @override
  String get categoryTutorialStep2Body => '国名・コード・番号を入力して素早く見つけましょう。';

  @override
  String get categoryTutorialStep3Title => 'タップしてマーク';

  @override
  String get categoryTutorialStep3Body =>
      'グレーのステッカーをタップするとアルバムに追加されます（ゴールドになります）。既に持っている場合は削除確認が表示されます。';

  @override
  String get categoryTutorialStep4Title => '長押しで詳細オプション';

  @override
  String get categoryTutorialStep4Body =>
      '長押しで各バリアント（Normal, Gold, Legend）の所持数を管理できます。';

  @override
  String get drawerReplayTutorial => 'チュートリアルをもう一度見る';

  @override
  String get variantTutorialTitle => '地域を選択してください';

  @override
  String get variantTutorialBody =>
      'あなたの国や地域に合ったアルバムバリアントを選択してください。これにより、コレクションに表示されるステッカーとバリアント（Normal、Gold、Legend）が決まります。';

  @override
  String get drawerLegalNotice => '法的表示';

  @override
  String get legalNoticeTitle => '法的表示';

  @override
  String get legalNoticeBody =>
      'このアプリはファンによる非公式な作品であり、いかなる公式サッカー組織、ステッカーメーカー、またはサッカートーナメントの公式パートナーとも提携、承認、または接続されていません。すべての商標はそれぞれの所有者の財産です。';

  @override
  String get statsTitle => '統計';

  @override
  String get statsTotalLabel => '合計';

  @override
  String get statsCollectedLabel => '収集済み';

  @override
  String get statsDuplicateCopiesLabel => '重複';

  @override
  String get statsCategoriesTitle => 'カテゴリ別';

  @override
  String get statsAllCategories => 'すべて';

  @override
  String get statsNoStatsYet => 'データなし。集め始めよう！';

  @override
  String get statsBestCategory => '最も進んでいる';

  @override
  String get statsWorstCategory => '最も遅れている';

  @override
  String get statsCompletedCategories => '完了済み';

  @override
  String get drawerStats => '統計';

  @override
  String get statsCategoryPickerSearch => 'カテゴリを検索...';

  @override
  String statsCategoryPickerSelected(Object count) {
    return '$count選択中';
  }

  @override
  String get statsCategoryPickerAll => 'すべてのカテゴリ';

  @override
  String get statsCategoryPickerClear => 'クリア';

  @override
  String get statsSortTooltip => '並び替え';

  @override
  String get statsSortByName => 'カテゴリー順';

  @override
  String get statsSortByProgressDesc => '進捗の高い順';

  @override
  String get statsSortByProgressAsc => '進捗の低い順';

  @override
  String get statsSortByMissing => '不足枚数順';

  @override
  String get statsSortByDuplicates => '重複枚数順';

  @override
  String get tradeHubTitle => 'Intercambio de Cromos';

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
      'Se cancelará el intercambio y los cromos volverán a tu inventario.';

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
      'Alguien quiere intercambiar cromos contigo.';

  @override
  String get tradeStatusSelecting => 'Seleccionando cromos';

  @override
  String get tradeStatusSelectingDesc =>
      'Ambos están eligiendo qué cromos ofrecer.';

  @override
  String get tradeStatusMyConfirmed => 'Tu oferta está lista';

  @override
  String get tradeStatusMyConfirmedDesc =>
      'Esperando que el otro usuario confirme su oferta.';

  @override
  String get tradeStatusOtherConfirmed => 'El otro ya confirmó';

  @override
  String get tradeStatusOtherConfirmedDesc =>
      'Confirma tu selección de cromos para continuar.';

  @override
  String get tradeStatusReservedLabel => 'Cromos reservados';

  @override
  String get tradeStatusReservedDesc =>
      'Intercambio acordado. Confirma cuando hayas recibido tus cromos.';

  @override
  String get tradeAcceptBtn => 'Aceptar intercambio';

  @override
  String get tradeSeeOfferBtn => 'Ver intercambio';

  @override
  String get tradeSelectBtn => 'Seleccionar mis cromos';

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
    return '$count cromo(s) seleccionado(s)';
  }

  @override
  String get tradeNegNoStickers => 'No tienes cromos para ofrecer.';

  @override
  String get tradeNegPartnerWaiting =>
      'El otro coleccionista aún no ha seleccionado sus cromos.';

  @override
  String tradeNegOfferLabel(Object count) {
    return 'Ofrecerás $count cromo(s)';
  }

  @override
  String get tradeNegConfirmBtn => 'Confirmar mi oferta';

  @override
  String get tradeNegSaving => 'Guardando…';

  @override
  String get tradeNegAtLeastOne => 'Selecciona al menos un cromo para ofrecer.';

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
      'Podrás cambiar los cromos que vas a dar. El otro coleccionista deberá esperar.';

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
      'El otro coleccionista actualizó su oferta de cromos.';

  @override
  String tradeNegTotalItems(Object count) {
    return '$count cromo(s) en total';
  }

  @override
  String tradeNegReceivingCount(Object count) {
    return '$count cromo(s) que vas a recibir';
  }

  @override
  String get tradeDeliveryTitle => 'Confirmar recepción';

  @override
  String get tradeDeliveryInstruction =>
      'Marca los cromos que recibiste físicamente';

  @override
  String get tradeDeliveryDesc =>
      'Los marcados se añadirán a tu álbum. Los desmarcados volverán al inventario del otro coleccionista.';

  @override
  String get tradeDeliveryNoOffer =>
      'El otro coleccionista no ofreció ningún cromo.';

  @override
  String get tradeDeliveryNotReceived => 'No recibido';

  @override
  String tradeDeliveryAllReceived(Object received, Object total) {
    return 'Recibiste todos los cromos ($received/$total)';
  }

  @override
  String tradeDeliveryPartial(Object received, Object total, Object pending) {
    return '$received de $total marcados · $pending volverán al otro coleccionista.';
  }

  @override
  String get tradeDeliveryConfirmTitle => 'Confirmar recepción';

  @override
  String tradeDeliveryConfirmMsg(Object received, Object pending) {
    return 'Se añadirán $received cromo(s) a tu álbum.\n$pending cromo(s) desmarcados volverán al otro coleccionista.';
  }

  @override
  String tradeDeliverySuccess(Object count) {
    return '¡$count cromo(s) añadidos a tu álbum! 🏆';
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
    return '$count cromo(s)';
  }

  @override
  String get tradeDrawerTitle => 'Intercambiar cromos';

  @override
  String get tradeDrawerActiveBadge => 'ACTIVO';

  @override
  String get tradeErrorGeneric =>
      'Ocurrió un error en el intercambio. Inténtalo de nuevo.';

  @override
  String get tradeErrorNotLoggedIn =>
      'Debes iniciar sesión para intercambiar cromos.';

  @override
  String get tradeErrorSelf => 'No puedes intercambiar cromos contigo mismo.';

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
}
