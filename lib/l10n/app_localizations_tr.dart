// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Albüm 26';

  @override
  String get authWelcomeTitle => 'Albüm 26\'ya Hoş Geldiniz';

  @override
  String get authEmailLabel => 'E-posta';

  @override
  String get authPasswordLabel => 'Şifre';

  @override
  String get authLoginButton => 'GİRİŞ YAP';

  @override
  String get authContinueWith => 'Veya şununla devam et';

  @override
  String get authContinueGoogle => 'Google ile devam et';

  @override
  String get authContinueApple => 'Apple ile devam et';

  @override
  String get authContinueGuest => 'Misafir olarak devam et';

  @override
  String get authNoAccountRegister => 'Hesabın yok mu? Kaydol';

  @override
  String get authForgotPassword => 'Şifreni mi unuttun?';

  @override
  String get authResetPasswordEnterEmail =>
      'Şifreni sıfırlamak için e-postanı gir.';

  @override
  String get authResetPasswordEmailSent =>
      'Şifreni sıfırlamak için e-posta gönderdik.';

  @override
  String get authGuestMigratedSuccess =>
      'Misafir ilerlemeniz yeni hesabınıza başarıyla aktarıldı! 🏆';

  @override
  String get authGuestRemotePreserved =>
      'Tekrar hoş geldiniz! Bulut koleksiyonunuz geri yüklendi ve yerel misafir ilerlemesi silindi.';

  @override
  String commonErrorWithMessage(Object message) {
    return 'Hata: $message';
  }

  @override
  String get authErrorInvalidCredentials =>
      'Yanlış e-posta veya şifre. Bilgilerini kontrol edip tekrar dene.';

  @override
  String get authErrorEmailNotConfirmed =>
      'E-postanız henüz onaylanmamış. Gelen kutunuzu kontrol edin.';

  @override
  String get authErrorUserAlreadyRegistered =>
      'Bu e-posta ile zaten bir hesap mevcut.';

  @override
  String get authErrorWeakPassword =>
      'Şifre çok zayıf. En az 6 karakter kullan.';

  @override
  String get authErrorInvalidEmail => 'E-posta adresi formatı geçerli değil.';

  @override
  String get authErrorTokenExpired =>
      'Kod süresi dolmuş veya geçersiz. Lütfen yeni bir tane isteyin.';

  @override
  String get authErrorRateLimit =>
      'Çok fazla deneme. Tekrar denemeden önce bir süre bekleyin.';

  @override
  String get authErrorNetworkError =>
      'Bağlantı yok. Ağını kontrol edip tekrar dene.';

  @override
  String get authErrorSessionExpired =>
      'Oturumunuzun süresi doldu. Lütfen tekrar giriş yapın.';

  @override
  String get authErrorUnknown =>
      'Beklenmedik bir hata oluştu. Lütfen tekrar deneyin.';

  @override
  String get registerTitle => 'Hesap Oluştur';

  @override
  String get registerFillAllFields => 'Lütfen tüm alanları doldurun.';

  @override
  String get registerEmailsDontMatch => 'E-posta adresleri eşleşmiyor.';

  @override
  String get registerPasswordsDontMatch => 'Şifreler eşleşmiyor.';

  @override
  String get registerPasswordMinLength => 'Şifre en az 6 karakter olmalıdır.';

  @override
  String get registerAccountCreated =>
      'Hesap başarıyla oluşturuldu! ⚽ Lütfen giriş yapın.';

  @override
  String get registerConfirmEmailLabel => 'E-postayı onayla';

  @override
  String get registerConfirmPasswordLabel => 'Şifreyi onayla';

  @override
  String get registerSubmitButton => 'KAYDOL';

  @override
  String get profileTitle => 'Profilim';

  @override
  String get profileOfficialCollector => 'Resmi Koleksiyoncu 🌟';

  @override
  String get profileChangePasswordButton => 'Şifreyi güncelle';

  @override
  String get profileChangePasswordTitle => 'Şifreyi güncelle';

  @override
  String get profileNewPasswordLabel => 'Yeni şifre';

  @override
  String get profileConfirmNewPasswordLabel => 'Yeni şifreyi onayla';

  @override
  String get profilePasswordUpdatedSuccess => 'Şifre başarıyla güncellendi.';

  @override
  String get profileLogoutButton => 'Çıkış Yap';

  @override
  String get profileLogoutSuccess => 'Başarıyla çıkış yapıldı.';

  @override
  String get profileUnknownUser => 'Bilinmeyen kullanıcı';

  @override
  String profileLogoutError(Object message) {
    return 'Çıkış yapılırken hata: $message';
  }

  @override
  String get homeTitle => 'Albümüm 26';

  @override
  String get homeProfileTooltip => 'Profilim';

  @override
  String get homeShareAll => 'Tam Listeyi Paylaş';

  @override
  String get homeShareMissingOnly => 'Yalnızca Eksikler';

  @override
  String get homeShareDuplicatesOnly => 'Yalnızca Kopyalar';

  @override
  String get homeGlobalProgressTitle => 'Genel İlerleme';

  @override
  String homeCollectedCount(Object collected, Object total) {
    return '$total kartın $collected tanesi toplandı';
  }

  @override
  String get homeViewFullCollection => 'Tam Koleksiyonu Görüntüle';

  @override
  String get homeTeamsTitle => 'Takımlar';

  @override
  String get homeSearchTeamsHint => 'Ülke veya takıma göre ara...';

  @override
  String get homeNoResults => 'Takım bulunamadı';

  @override
  String get homeScanButton => 'Sticker Tara';

  @override
  String homeObtainedCount(Object collected, Object total) {
    return '$total kartın $collected tanesi elde edildi';
  }

  @override
  String get homeProgressError => 'Hata';

  @override
  String get globalCollectionTitle => 'Tam Koleksiyon';

  @override
  String get filterAll => 'Tümü';

  @override
  String get filterMissing => 'Eksikler';

  @override
  String get filterDuplicates => 'Kopyalar';

  @override
  String get filterSearchHint => 'Ülke, kod veya numaraya göre ara...';

  @override
  String get stickerRemoveTitle => 'Sticker kaldırılsın mı?';

  @override
  String stickerRemoveConfirm(Object stickerLabel) {
    return '$stickerLabel stickerını albümünden kaldırmak istediğinizden emin misiniz?';
  }

  @override
  String get commonCancel => 'İptal';

  @override
  String get commonRemove => 'Kaldır';

  @override
  String get commonDone => 'TAMAM';

  @override
  String get gridNoResults => 'Sticker bulunamadı.';

  @override
  String scannerViewScannedButton(Object count) {
    return 'Taranan $count stickerı gözden geçir';
  }

  @override
  String get scannerOverlayHint => 'Stickerin arkasını buraya ortala';

  @override
  String get pendingScansTitle => 'Taranan Stickerlar';

  @override
  String get pendingScansEmpty => 'Henüz hiçbir sticker taramadınız';

  @override
  String pendingScansItemLabel(Object code) {
    return 'Sticker: $code';
  }

  @override
  String pendingScansSavedSuccess(Object count) {
    return '$count sticker albümünüze eklendi! 🏆';
  }

  @override
  String pendingScansSaveError(Object message) {
    return 'Kaydedilirken hata: $message';
  }

  @override
  String get shareHeader => '⚽ *ALBÜM 26 TAKAS LİSTESİ* 🏆';

  @override
  String get shareMissingSectionTitle => '❌ *EKSİKLER:*';

  @override
  String get shareDuplicatesSectionTitle => '🔁 *KOPYALAR:*';

  @override
  String get shareNoneMissing => 'Yok! 😎';

  @override
  String get shareNoDuplicates => 'Kopya yok 😅';

  @override
  String get shareLetsTrade => 'Takas yapmak ister misin? 👀🔥';

  @override
  String get shareSeparator => '--------------------------';

  @override
  String get forgotPasswordTitle => 'Hesabı Kurtar';

  @override
  String get forgotPasswordDescription =>
      'E-posta adresinizi girin, şifrenizi sıfırlamak için 6 haneli bir kod gönderelim.';

  @override
  String get forgotPasswordEmailLabel => 'E-posta';

  @override
  String get forgotPasswordEmptyEmailError =>
      'Lütfen e-posta adresinizi girin.';

  @override
  String get forgotPasswordCodeSentSuccess =>
      'Kod gönderildi. Gelen kutunuzu kontrol edin.';

  @override
  String get forgotPasswordSendCodeButton => 'KOD GÖNDER';

  @override
  String forgotPasswordStep2Description(Object email) {
    return '$email adresine gönderdiğimiz kodu ve yeni şifrenizi girin.';
  }

  @override
  String get forgotPasswordCodeInputLabel => '8 haneli kod';

  @override
  String get forgotPasswordInvalidCodeError =>
      'Kod tam olarak 6 rakamdan oluşmalıdır.';

  @override
  String get forgotPasswordNewPasswordLabel => 'Yeni Şifre';

  @override
  String get forgotPasswordShortPasswordError =>
      'Şifre en az 6 karakter olmalıdır.';

  @override
  String get forgotPasswordSavePasswordButton => 'ŞİFREYİ KAYDET';

  @override
  String get forgotPasswordPasswordUpdatedSuccess =>
      'Şifre başarıyla güncellendi! 🏆';

  @override
  String get paywallTitle => 'Reklamsız Keyfini Çıkar';

  @override
  String get paywallSubtitle =>
      'Tüm özellikler ücretsiz. Pro ile her şeyi kesintisiz kullanırsınız.';

  @override
  String get paywallBenefitScanner => 'Geçiş reklamları olmadan tarayıcı';

  @override
  String get paywallBenefitNoAds => 'Reklam yok';

  @override
  String get paywallBenefitSync => 'Bulut senkronizasyonu dahil';

  @override
  String paywallSubscribeButton(Object price) {
    return 'Abone Ol · $price';
  }

  @override
  String get paywallPackageMonthly => 'Aylık';

  @override
  String get paywallPackageAnnual => 'Yıllık';

  @override
  String get paywallPackageWeekly => 'Haftalık';

  @override
  String get paywallPackageLifetime => 'Ömür Boyu';

  @override
  String get paywallPackageTwoMonth => 'Her 2 ayda bir';

  @override
  String get paywallPackageThreeMonth => 'Her 3 ayda bir';

  @override
  String get paywallPackageSixMonth => 'Her 6 ayda bir';

  @override
  String get paywallRestorePurchases => 'Satın alımları geri yükle';

  @override
  String get paywallCancelAnytime => 'İstediğinizde iptal edin. Taahhüt yok.';

  @override
  String get paywallLoadError =>
      'Planlar yüklenemedi. Bağlantınızı kontrol edin.';

  @override
  String get paywallRetry => 'Tekrar Dene';

  @override
  String get paywallPurchaseError =>
      'Satın alma başarısız oldu. Lütfen tekrar deneyin.';

  @override
  String get paywallRestoreError =>
      'Satın alımlar geri yüklenemedi. Lütfen tekrar deneyin.';

  @override
  String get paywallGuestTitle => 'Abone olmak için giriş yapın';

  @override
  String get paywallGuestBody =>
      'Pro hesabınıza bağlıdır. Tüm özelliklerin kilidini açmak için giriş yapın veya hesap oluşturun.';

  @override
  String get paywallGuestSignInButton => 'GİRİŞ YAP';

  @override
  String scannerDemoRemaining(Object count) {
    return '$count ücretsiz tarama kaldı';
  }

  @override
  String get scannerDemoFinishedTitle => '5 ücretsiz taramanızı kullandınız';

  @override
  String get scannerDemoFinishedSubtitle =>
      'Sınırsız sticker taramak ve reklamsız deneyim için abone olun.';

  @override
  String get scannerDemoUnlockButton => 'Pro Planlarını Görüntüle';

  @override
  String get adDialogTitle => 'Ücretsiz içerik';

  @override
  String get adDialogBody =>
      'Devam etmek için kısa bir reklam izleyin veya Pro\'ya abone olun ve reklamları sonsuza dek unutun.';

  @override
  String get adDialogWatchAd => 'Reklam izle';

  @override
  String get adDialogGetPro => 'Pro Al';

  @override
  String get adDialogNotNow => 'Şimdi değil';

  @override
  String get scannerCameraInitError =>
      'Kamera başlatılamadı. Uygulamanın kamera iznine sahip olduğundan emin olun.';
}
