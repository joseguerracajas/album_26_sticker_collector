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
      'カメラを初期化できませんでした。アプリにカメラのアクセス許可があることを確認してください。';
}
