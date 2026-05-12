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
  String get drawerSignIn => '로그인';

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
      '카메라를 초기화할 수 없습니다. 앱에 카메라 권한이  있는지 확인하세요.';

  @override
  String get variantSheetTitle => '앨범 변형';

  @override
  String get variantSheetInventoryNote =>
      '변형을 변경해도 인벤토리는 유지됩니다. 이미 보유한 스티커는 계속 기록됩니다.';

  @override
  String variantSheetLoadError(Object error) {
    return '변형 로드 오류: $error';
  }

  @override
  String get variantSheetEmpty => '이 앨범에 사용 가능한 변형이 없습니다.';

  @override
  String get variantSheetDefaultLabel => '기본 변형';

  @override
  String get variantMandatoryTitle => '지역 선택';

  @override
  String get variantMandatorySubtitle => '내 지역에 맞는 앨범 버전을 선택하세요.';

  @override
  String variantChangedSuccess(Object name) {
    return '$name(으)로 변경되었습니다 ✅';
  }

  @override
  String get profileDeleteAccountButton => '계정 삭제';

  @override
  String get profileDeleteAccountTitle => '계정을 삭제하시겠습니까?';

  @override
  String get profileDeleteAccountMessage =>
      '이 작업은 영구적입니다. 모든 데이터가 삭제되며 콜렉션을 복구할 수 없습니다.';

  @override
  String get profileDeleteAccountConfirmButton => '영구 삭제';

  @override
  String get profileDeleteAccountSuccess => '계정이 삭제되었습니다.';

  @override
  String get profileDeleteAccountError => '계정 삭제 중 오류가 발생했습니다. 다시 시도해 주세요.';

  @override
  String get paywallPrivacyPolicy => '개인정보 처리방침';

  @override
  String get paywallTermsOfUse => '이용약관';

  @override
  String get paywallLegalDisclaimer => '구독하면 이용약관 및 개인정보 처리방침에 동의하는 것입니다.';

  @override
  String get tutorialSkip => '건너뛰기';

  @override
  String get tutorialTapToContinue => '계속하려면 어디든 탭하세요';

  @override
  String get tutorialStep1Title => '전체 진행 상황';

  @override
  String get tutorialStep1Body => '수집한 스티커 수를 확인하세요. 계속 수집하세요!';

  @override
  String get tutorialStep2Title => '팀 검색';

  @override
  String get tutorialStep2Body => '국가나 팀 이름을 입력해 목록을 필터링하세요.';

  @override
  String get tutorialStep3Title => '메인 메뉴';

  @override
  String get tutorialStep3Body => '프로필 접근과 앨범 버전 변경이 가능합니다.';

  @override
  String get tutorialStep4Title => '스티커 스캔';

  @override
  String get tutorialStep4Body => '카메라로 스티커를 스캔해 앨범에 자동으로 추가하세요.';

  @override
  String get tutorialStep5Title => '목록 공유';

  @override
  String get tutorialStep5Body => '부족하거나 중복된 스티커 목록을 내보내 친구들과 교환하세요.';

  @override
  String get globalTutorialStep1Title => '컬렉션 필터링';

  @override
  String get globalTutorialStep1Body =>
      '이 버튼을 사용하여 모든 스티커, 없는 것만 또는 중복된 것만 볼 수 있습니다. 교환 정리에 안성맞춤!';

  @override
  String get globalTutorialStep2Title => '스티커 검색';

  @override
  String get globalTutorialStep2Body => '국가 이름, 코드 또는 스티커 번호를 입력하여 빠르게 찾으세요.';

  @override
  String get globalTutorialStep3Title => '탭하여 표시';

  @override
  String get globalTutorialStep3Body =>
      '회색 스티커를 한 번 탭하면 앨범에 추가됩니다(금색이 됩니다). 다시 탭하면 제거 확인을 요청합니다.';

  @override
  String get globalTutorialStep4Title => '길게 누르면 더 많은 옵션';

  @override
  String get globalTutorialStep4Body =>
      '스티커를 길게 눌러 각 변형(Normal, Gold, Legend...)의 복사본 수를 관리하세요.';

  @override
  String get tutorialStep6Title => '카테고리 탐색';

  @override
  String get tutorialStep6Body =>
      '국가나 팀을 탭하여 스티커를 확인하세요. 이미 가진 것을 표시하고 중복을 관리할 수 있습니다.';

  @override
  String get categoryTutorialStep1Title => '스티커 필터링';

  @override
  String get categoryTutorialStep1Body =>
      '이 버튼으로 모든 스티커, 없는 것만 또는 중복만 볼 수 있습니다.';

  @override
  String get categoryTutorialStep2Title => '스티커 검색';

  @override
  String get categoryTutorialStep2Body => '국가명, 코드 또는 번호를 입력하여 빠르게 찾으세요.';

  @override
  String get categoryTutorialStep3Title => '탭하여 표시';

  @override
  String get categoryTutorialStep3Body =>
      '회색 스티커를 탭하면 앨범에 추가됩니다(금색으로 변함). 이미 있는데 다시 탭하면 삭제 확인이 표시됩니다.';

  @override
  String get categoryTutorialStep4Title => '길게 눌러 더 많은 옵션';

  @override
  String get categoryTutorialStep4Body =>
      '스티커를 길게 누르면 각 변형(Normal, Gold, Legend)의 보유 수량을 관리할 수 있습니다.';

  @override
  String get drawerReplayTutorial => '튜토리얼 다시 보기';

  @override
  String get variantTutorialTitle => '지역을 선택하세요';

  @override
  String get variantTutorialBody =>
      '본인의 국가나 지역에 맞는 앨범 버전을 선택하세요. 이것이 콜렉션에 표시될 스티커와 변형(Normal, Gold, Legend)을 결정합니다.';

  @override
  String get drawerLegalNotice => '법적 고지';

  @override
  String get legalNoticeTitle => '법적 고지';

  @override
  String get legalNoticeBody =>
      '이 앱은 비공식 팩 제작물이며 어떠한 공식 축구 조직, 스티커 제조업체 또는 축구 토너먼트의 공식 파트너와도 제휴, 보증 또는 연결되어 있지 않습니다. 모든 상표는 해당 소유자의 재산입니다.';

  @override
  String get statsTitle => '통계';

  @override
  String get statsTotalLabel => '합계';

  @override
  String get statsCollectedLabel => '수집됨';

  @override
  String get statsDuplicateCopiesLabel => '중복';

  @override
  String get statsCategoriesTitle => '카테고리별';

  @override
  String get statsAllCategories => '전체';

  @override
  String get statsNoStatsYet => '아직 데이터 없음. 수집을 시작하세요!';

  @override
  String get statsBestCategory => '진행률 최고';

  @override
  String get statsWorstCategory => '진행률 최저';

  @override
  String get statsCompletedCategories => '완료됨';

  @override
  String get drawerStats => '통계';

  @override
  String get statsCategoryPickerSearch => '카테고리 검색...';

  @override
  String statsCategoryPickerSelected(Object count) {
    return '$count개 선택됨';
  }

  @override
  String get statsCategoryPickerAll => '모든 카테고리';

  @override
  String get statsCategoryPickerClear => '지우기';

  @override
  String get statsSortTooltip => '정렬';

  @override
  String get statsSortByName => '카테고리';

  @override
  String get statsSortByProgressDesc => '진행률 높은 순';

  @override
  String get statsSortByProgressAsc => '진행률 낙은 순';

  @override
  String get statsSortByMissing => '부족 많은 순';

  @override
  String get statsSortByDuplicates => '중복 많은 순';

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

  @override
  String get drawerLookup => '스티커 조회';

  @override
  String get lookupScreenTitle => '스티커 조회';

  @override
  String get lookupTabManual => '수동';

  @override
  String get lookupTabScanner => '스캐너';

  @override
  String get lookupSearchHint => '예: ECU 10, ARG 5, FRA 1...';

  @override
  String get lookupSearchButton => '검색';

  @override
  String get lookupStickerNotFound => '해당 코드의 스티커를 찾을 수 없습니다.';

  @override
  String get lookupStatusMissing => '없음';

  @override
  String get lookupStatusCollected => '보유 중 ✓';

  @override
  String lookupStatusDuplicates(Object count) {
    return '$count개 중복 🔁';
  }

  @override
  String get lookupQtyLabel => '내 인벤토리 수량';

  @override
  String get lookupScannerHint => '스티커를 중앙에 맞춰 인식';

  @override
  String get lookupScannerOpenTooltip => 'Abrir escáner';

  @override
  String get lookupScannerOpenCamera => 'Escanear stickers';

  @override
  String get lookupScannerViewResults => 'Ver resultados';

  @override
  String lookupScannerSaveSuccess(Object count) {
    return '$count cromo(s) agregado(s) al inventario';
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
  String get lookupTutorialStep1Title => '두 가지 검색 방법';

  @override
  String get lookupTutorialStep1Body =>
      '코드를 입력하려면 수동 탭, 카메라로 스캔하려면 스캔너 탭을 사용하세요.';

  @override
  String get lookupTutorialStep2Title => '코드 입력';

  @override
  String get lookupTutorialStep2Body =>
      '앨범에 표시된 코드(ECU 10 또는 ARG 5 등)를 입력하고 검색 버튼을 누르세요.';

  @override
  String get lookupTutorialStep3Title => '확인 및 관리';

  @override
  String get lookupTutorialStep3Body =>
      '스티커가 없는지 있는지 확인할 수 있습니다. + 및 – 버튼으로 인벤토리를 즐시 업데이트하세요.';
}
