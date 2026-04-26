// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => '앨범 26';

  @override
  String get authWelcomeTitle => '앨범 26에 오신 것을 환영합니다';

  @override
  String get authEmailLabel => '이메일';

  @override
  String get authPasswordLabel => '비밀번호';

  @override
  String get authLoginButton => '로그인';

  @override
  String get authContinueWith => '또는 다음으로 계속';

  @override
  String get authContinueGoogle => 'Google로 계속';

  @override
  String get authContinueApple => 'Apple로 계속';

  @override
  String get authContinueGuest => '게스트로 계속';

  @override
  String get authNoAccountRegister => '계정이 없으신가요? 회원가입';

  @override
  String get authForgotPassword => '비밀번호를 잊으셨나요?';

  @override
  String get authResetPasswordEnterEmail => '비밀번호를 복구하려면 이메일을 입력하세요.';

  @override
  String get authResetPasswordEmailSent => '비밀번호 재설정 이메일을 발송했습니다.';

  @override
  String get authGuestMigratedSuccess => '게스트 진행 상황이 새 계정으로 성공적으로 이전되었습니다! 🏆';

  @override
  String get authGuestRemotePreserved =>
      '돌아오신 것을 환영합니다! 클라우드 컬렉션이 복원되었으며 로컬 게스트 진행 상황은 삭제되었습니다.';

  @override
  String commonErrorWithMessage(Object message) {
    return '오류: $message';
  }

  @override
  String get authErrorInvalidCredentials =>
      '이메일 또는 비밀번호가 잘못되었습니다. 정보를 확인하고 다시 시도해주세요.';

  @override
  String get authErrorEmailNotConfirmed =>
      '이메일이 아직 확인되지 않았습니다. 받은 편지함을 확인해주세요.';

  @override
  String get authErrorUserAlreadyRegistered => '해당 이메일로 이미 계정이 존재합니다.';

  @override
  String get authErrorWeakPassword => '비밀번호가 너무 약합니다. 최소 6자 이상을 사용하세요.';

  @override
  String get authErrorInvalidEmail => '이메일 주소 형식이 올바르지 않습니다.';

  @override
  String get authErrorTokenExpired => '코드가 만료되었거나 유효하지 않습니다. 새 코드를 요청하세요.';

  @override
  String get authErrorRateLimit => '시도 횟수가 너무 많습니다. 잠시 후 다시 시도해주세요.';

  @override
  String get authErrorNetworkError => '연결이 없습니다. 네트워크를 확인하고 다시 시도해주세요.';

  @override
  String get authErrorSessionExpired => '세션이 만료되었습니다. 다시 로그인해주세요.';

  @override
  String get authErrorUnknown => '예기치 않은 오류가 발생했습니다. 다시 시도해주세요.';

  @override
  String get registerTitle => '계정 만들기';

  @override
  String get registerFillAllFields => '모든 필드를 입력해주세요.';

  @override
  String get registerEmailsDontMatch => '이메일 주소가 일치하지 않습니다.';

  @override
  String get registerPasswordsDontMatch => '비밀번호가 일치하지 않습니다.';

  @override
  String get registerPasswordMinLength => '비밀번호는 최소 6자 이상이어야 합니다.';

  @override
  String get registerAccountCreated => '계정이 성공적으로 생성되었습니다! ⚽ 로그인해주세요.';

  @override
  String get registerConfirmEmailLabel => '이메일 확인';

  @override
  String get registerConfirmPasswordLabel => '비밀번호 확인';

  @override
  String get registerSubmitButton => '회원가입';

  @override
  String get profileTitle => '내 프로필';

  @override
  String get profileOfficialCollector => '공식 컬렉터 🌟';

  @override
  String get profileChangePasswordButton => '비밀번호 업데이트';

  @override
  String get profileChangePasswordTitle => '비밀번호 업데이트';

  @override
  String get profileNewPasswordLabel => '새 비밀번호';

  @override
  String get profileConfirmNewPasswordLabel => '새 비밀번호 확인';

  @override
  String get profilePasswordUpdatedSuccess => '비밀번호가 성공적으로 업데이트되었습니다.';

  @override
  String get profileLogoutButton => '로그아웃';

  @override
  String get profileLogoutSuccess => '성공적으로 로그아웃되었습니다.';

  @override
  String get profileUnknownUser => '알 수 없는 사용자';

  @override
  String profileLogoutError(Object message) {
    return '로그아웃 오류: $message';
  }

  @override
  String get homeTitle => '내 앨범 26';

  @override
  String get homeProfileTooltip => '내 프로필';

  @override
  String get homeShareAll => '전체 목록 공유';

  @override
  String get homeShareMissingOnly => '없는 것만';

  @override
  String get homeShareDuplicatesOnly => '중복만';

  @override
  String get homeGlobalProgressTitle => '전체 진행 상황';

  @override
  String homeCollectedCount(Object collected, Object total) {
    return '$total개 중 $collected개 수집됨';
  }

  @override
  String get homeViewFullCollection => '전체 컬렉션 보기';

  @override
  String get homeTeamsTitle => '팀';

  @override
  String get homeSearchTeamsHint => '국가 또는 팀으로 검색...';

  @override
  String get homeNoResults => '팀을 찾을 수 없습니다';

  @override
  String get homeScanButton => '스티커 스캔';

  @override
  String homeObtainedCount(Object collected, Object total) {
    return '$total개 중 $collected개 획득';
  }

  @override
  String get homeProgressError => '오류';

  @override
  String get globalCollectionTitle => '전체 컬렉션';

  @override
  String get filterAll => '전체';

  @override
  String get filterMissing => '없는 것';

  @override
  String get filterDuplicates => '중복';

  @override
  String get filterSearchHint => '국가, 코드 또는 번호로 검색...';

  @override
  String get stickerRemoveTitle => '스티커를 제거하시겠습니까?';

  @override
  String stickerRemoveConfirm(Object stickerLabel) {
    return '앨범에서 스티커 $stickerLabel을(를) 제거하시겠습니까?';
  }

  @override
  String get commonCancel => '취소';

  @override
  String get commonRemove => '제거';

  @override
  String get commonDone => '완료';

  @override
  String get gridNoResults => '스티커를 찾을 수 없습니다.';

  @override
  String scannerViewScannedButton(Object count) {
    return '스캔된 스티커 $count개 검토';
  }

  @override
  String get scannerOverlayHint => '스티커 뒷면을 여기에 가운데 맞추세요';

  @override
  String get pendingScansTitle => '스캔된 스티커';

  @override
  String get pendingScansEmpty => '아직 스티커를 스캔하지 않았습니다';

  @override
  String pendingScansItemLabel(Object code) {
    return '스티커: $code';
  }

  @override
  String pendingScansSavedSuccess(Object count) {
    return '스티커 $count개가 앨범에 추가되었습니다! 🏆';
  }

  @override
  String pendingScansSaveError(Object message) {
    return '저장 오류: $message';
  }

  @override
  String get shareHeader => '⚽ *앨범 26 교환 목록* 🏆';

  @override
  String get shareMissingSectionTitle => '❌ *없는 것:*';

  @override
  String get shareDuplicatesSectionTitle => '🔁 *중복:*';

  @override
  String get shareNoneMissing => '없음! 😎';

  @override
  String get shareNoDuplicates => '중복 없음 😅';

  @override
  String get shareLetsTrade => '교환하실래요? 👀🔥';

  @override
  String get shareSeparator => '--------------------------';

  @override
  String get forgotPasswordTitle => '계정 복구';

  @override
  String get forgotPasswordDescription =>
      '이메일을 입력하시면 비밀번호 재설정을 위한 6자리 코드를 보내드립니다.';

  @override
  String get forgotPasswordEmailLabel => '이메일';

  @override
  String get forgotPasswordEmptyEmailError => '이메일 주소를 입력해주세요.';

  @override
  String get forgotPasswordCodeSentSuccess => '코드가 전송되었습니다. 받은 편지함을 확인해주세요.';

  @override
  String get forgotPasswordSendCodeButton => '코드 전송';

  @override
  String forgotPasswordStep2Description(Object email) {
    return '$email로 보낸 코드와 새 비밀번호를 입력하세요.';
  }

  @override
  String get forgotPasswordCodeInputLabel => '8자리 코드';

  @override
  String get forgotPasswordInvalidCodeError => '코드는 정확히 6자리여야 합니다.';

  @override
  String get forgotPasswordNewPasswordLabel => '새 비밀번호';

  @override
  String get forgotPasswordShortPasswordError => '비밀번호는 최소 6자 이상이어야 합니다.';

  @override
  String get forgotPasswordSavePasswordButton => '비밀번호 저장';

  @override
  String get forgotPasswordPasswordUpdatedSuccess =>
      '비밀번호가 성공적으로 업데이트되었습니다! 🏆';

  @override
  String get validationEmailInvalid => '이메일 주소가 유효하지 않습니다.';

  @override
  String get paywallTitle => '광고 없이 즐기세요';

  @override
  String get paywallSubtitle => '모든 기능은 무료로 이용할 수 있습니다. Pro로 중단 없이 모든 것을 즐기세요.';

  @override
  String get paywallBenefitScanner => '전면 광고 없는 스캐너';

  @override
  String get paywallBenefitNoAds => '광고 없음';

  @override
  String get paywallBenefitSync => '클라우드 동기화 포함';

  @override
  String paywallSubscribeButton(Object price) {
    return '구독 · $price';
  }

  @override
  String get paywallPackageMonthly => '월간';

  @override
  String get paywallPackageAnnual => '연간';

  @override
  String get paywallPackageWeekly => '주간';

  @override
  String get paywallPackageLifetime => '평생';

  @override
  String get paywallPackageTwoMonth => '2개월마다';

  @override
  String get paywallPackageThreeMonth => '3개월마다';

  @override
  String get paywallPackageSixMonth => '6개월마다';

  @override
  String get paywallRestorePurchases => '구매 복원';

  @override
  String get paywallCancelAnytime => '언제든지 취소 가능. 약정 없음.';

  @override
  String get paywallLoadError => '플랜을 불러올 수 없습니다. 연결을 확인해주세요.';

  @override
  String get paywallRetry => '다시 시도';

  @override
  String get paywallPurchaseError => '구매에 실패했습니다. 다시 시도해주세요.';

  @override
  String get paywallRestoreError => '구매를 복원할 수 없습니다. 다시 시도해주세요.';

  @override
  String get paywallGuestTitle => '구독하려면 로그인';

  @override
  String get paywallGuestBody =>
      'Pro는 계정에 연결됩니다. 모든 기능을 잠금 해제하려면 로그인하거나 계정을 만드세요.';

  @override
  String get paywallGuestSignInButton => '로그인';

  @override
  String scannerDemoRemaining(Object count) {
    return '무료 스캔 $count회 남음';
  }

  @override
  String get scannerDemoFinishedTitle => '5회의 무료 스캔을 모두 사용했습니다';

  @override
  String get scannerDemoFinishedSubtitle => '무제한 스티커 스캔과 광고 없는 경험을 위해 구독하세요.';

  @override
  String get scannerDemoUnlockButton => 'Pro 플랜 보기';

  @override
  String get adDialogTitle => '무료 콘텐츠';

  @override
  String get adDialogBody => '계속하려면 짧은 광고를 보거나 Pro를 구독하고 광고를 영원히 잊으세요.';

  @override
  String get adDialogWatchAd => '광고 보기';

  @override
  String get adDialogGetPro => 'Pro 가져오기';

  @override
  String get adDialogNotNow => '나중에';

  @override
  String get scannerCameraInitError =>
      '카메라를 초기화할 수 없습니다. 앱에 카메라 권한이 있는지 확인하세요.';
}
