// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get shareStatisticsTooltip => 'Compartir progreso';

  @override
  String shareStatisticsMessage(
    String percentage,
    String appTitle,
    String appLink,
  ) {
    return '¡He coleccionado el $percentage% de mi álbum de cromos! Únete a mí en $appTitle: $appLink';
  }

  @override
  String get appTitle => 'Sticker Album 2026';

  @override
  String get authWelcomeTitle => 'Sticker Album 2026\'ya Hoş Geldiniz';

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
  String get homeTitle => 'Sticker Album 2026';

  @override
  String get homeProfileTooltip => 'Profilim';

  @override
  String get drawerSignIn => 'Giriş Yap';

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
  String get shareHeader => '⚽ *STICKER ALBUM 2026 TAKAS LİSTESİ* 🏆';

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
  String shareDownloadLink(String appName) {
    return '📲 $appName uygulamasını indir\nhttps://onelink.to/5adrft?olbm=1';
  }

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
  String get validationEmailInvalid => 'E-posta adresi geçerli değil.';

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
  String get paywallBestOption => 'En iyi seçenek';

  @override
  String get paywallStartFreeTrial => 'Ücretsiz denemeyi başlat';

  @override
  String paywallFreeTrial(int days) {
    return '$days günlük ücretsiz deneme';
  }

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

  @override
  String get variantSheetTitle => 'Albüm varyantı';

  @override
  String get variantSheetInventoryNote =>
      'Varyant değiştirdiğinizde envanteriniz korunur. Zaten sahip olduğunuz çıkartmalar kayıtlı kalır.';

  @override
  String variantSheetLoadError(Object error) {
    return 'Varyantlar yüklenirken hata: $error';
  }

  @override
  String get variantSheetEmpty => 'Bu albüm için mevcut varyant yok.';

  @override
  String get variantSheetDefaultLabel => 'Varsayılan varyant';

  @override
  String get variantMandatoryTitle => 'Bölgenizi seçin';

  @override
  String get variantMandatorySubtitle => 'Bölgeniz için albüm sürümünü seçin.';

  @override
  String variantChangedSuccess(Object name) {
    return 'Varyant $name olarak değiştirildi ✅';
  }

  @override
  String get profileDeleteAccountButton => 'Hesabı sil';

  @override
  String get profileDeleteAccountTitle => 'Hesabınızı silmek istiyor musunuz?';

  @override
  String get profileDeleteAccountMessage =>
      'Bu işlem kalıcıdır. Tüm verileriniz silinecek ve koleksiyonunuzu kurtaramazsınız.';

  @override
  String get profileDeleteAccountConfirmButton => 'Kalıcı olarak sil';

  @override
  String get profileDeleteAccountSuccess => 'Hesabınız silindi.';

  @override
  String get profileDeleteAccountError =>
      'Hesap silinirken hata oluştu. Tekrar deneyin.';

  @override
  String get paywallPrivacyPolicy => 'Gizlilik Politikası';

  @override
  String get paywallTermsOfUse => 'Kullanım Koşulları';

  @override
  String get paywallLegalDisclaimer =>
      'Abone olarak Kullanım Koşullarını ve Gizlilik Politikasını kabul etmiş olursunuz.';

  @override
  String get tutorialSkip => 'Atla';

  @override
  String get tutorialTapToContinue =>
      'Devam etmek için herhangi bir yere dokun';

  @override
  String get tutorialStep1Title => 'Genel ilerlemeniz';

  @override
  String get tutorialStep1Body =>
      'Kac cikartma topladıgınızı burada görebilirsiniz. Devam edin!';

  @override
  String get tutorialStep2Title => 'Takim ara';

  @override
  String get tutorialStep2Body =>
      'Listeyi filtrelemek için bir ülke veya takim adi yazin.';

  @override
  String get tutorialStep3Title => 'Ana menu';

  @override
  String get tutorialStep3Body =>
      'Profilinize erisin ve albüm varyantini degistirin.';

  @override
  String get tutorialStep4Title => 'Cikartma tara';

  @override
  String get tutorialStep4Body =>
      'Cikartmalari taramak ve otomatik eklemek için kamerayi kullanin.';

  @override
  String get tutorialStep5Title => 'Listeyi paylas';

  @override
  String get tutorialStep5Body =>
      'Eksik veya fazla cikartma listenizi takas icin disa aktarin.';

  @override
  String get globalTutorialStep1Title => 'Koleksiyonu filtrele';

  @override
  String get globalTutorialStep1Body =>
      'Tüm cikartmalarini, yalnizca eksikleri veya yalnizca fazlalari görmek için bu düğmeleri kullan. Takas düzenlemek için mükemmel!';

  @override
  String get globalTutorialStep2Title => 'Cikartma ara';

  @override
  String get globalTutorialStep2Body =>
      'Ülke adini, kodu veya cikartma numarasini yaz ve hizla bul.';

  @override
  String get globalTutorialStep3Title => 'Isaretlemek için dokun';

  @override
  String get globalTutorialStep3Body =>
      'Gri bir cikartmaya bir dokunma onu albüme ekler (altinlasir). Tekrar dokunursan kaldirma onay istenir.';

  @override
  String get globalTutorialStep4Title => 'Daha fazla secenek için uzun bas';

  @override
  String get globalTutorialStep4Body =>
      'Her varyanttan (Normal, Gold, Legend...) kac kopya oldugunu yönetmek için bir cikartmaya uzun bas.';

  @override
  String get tutorialStep6Title => 'Kategori kesf et';

  @override
  String get tutorialStep6Body =>
      'Cikartmalarini gormek icin herhangi bir ulke veya takima dokun. Orada sahip olduklarini isaretleyebilir ve fazlaligini yonetebilirsin.';

  @override
  String get tutorialNavAlbumTitle => 'Álbum';

  @override
  String get tutorialNavAlbumBody =>
      'Tu álbum principal. Aquí ves todos los países y equipos, marcas tus stickers y ves tu progreso global.';

  @override
  String get tutorialNavScannerTitle => 'Escáner';

  @override
  String get tutorialNavScannerBody =>
      'Escanea el dorso de tus stickers físicos con la cámara. La app los reconoce automáticamente y los añade a tu colección. ¡También puedes quitar repetidos!';

  @override
  String get tutorialNavExchangeTitle => 'Intercambio';

  @override
  String get tutorialNavExchangeBody =>
      'Escanea los stickers de otro coleccionista para saber cuáles te faltan y cuáles puedes ofrecerle a cambio. Perfecto para intercambios cara a cara.';

  @override
  String get tutorialNavLookupTitle => 'Buscar';

  @override
  String get tutorialNavLookupBody =>
      'Consulta cualquier sticker por su código o número. Puedes buscarlo escribiéndolo o escaneándolo directamente.';

  @override
  String get tutorialNavStatsTitle => 'Estadísticas';

  @override
  String get tutorialNavStatsBody =>
      'Analiza tu progreso por categoría: porcentaje completado, faltantes y repetidos. Ordena y filtra como quieras.';

  @override
  String get categoryTutorialStep1Title => 'Cikartmalari filtrele';

  @override
  String get categoryTutorialStep1Body =>
      'Tum cikartmalari, yalnizca eksikleri veya yalnizca fazlaliklari gormek icin bu duegmeleri kullan.';

  @override
  String get categoryTutorialStep2Title => 'Cikartma ara';

  @override
  String get categoryTutorialStep2Body =>
      'Hizlica bulmak icin ulke adini, kodu veya cikartma numarasini yaz.';

  @override
  String get categoryTutorialStep3Title => 'Isaretlemek icin dokun';

  @override
  String get categoryTutorialStep3Body =>
      'Gri bir cikartmaya dokunmak onu albume ekler (altin olur). Zaten varsa ve tekrar dokunursan, kaldirmayi onayman istenecek.';

  @override
  String get categoryTutorialStep4Title => 'Daha fazla secen icin uzun bas';

  @override
  String get categoryTutorialStep4Body =>
      'Bir cikartmayi uzun basarak her varyantin (Normal, Gold, Legend) kac kopyasina sahip oldugunu yonetebilirsin.';

  @override
  String get drawerReplayTutorial => 'Egitimi tekrar izle';

  @override
  String get drawerRateApp => 'Uygulamamızı değerlendirin';

  @override
  String get scannerTutorialStep1Title => 'Modo de escaneo';

  @override
  String get scannerTutorialStep1Body =>
      'Elige Agregar para registrar stickers nuevos, o Quitar repetidos para eliminar del inventario los que ya tienes de más.';

  @override
  String get scannerTutorialStep2Title => 'Apunta al sticker';

  @override
  String get scannerTutorialStep2Body =>
      'Coloca el dorso del sticker dentro del marco. La app detecta el código automáticamente y lo añade a tu álbum. Verás una notificación en pantalla con el resultado.';

  @override
  String get exchangeTutorialStep1Title => 'Escanea los stickers de tu amigo';

  @override
  String get exchangeTutorialStep1Body =>
      'Apunta la cámara al dorso de los stickers de otro coleccionista. La app clasifica cuáles te faltan y cuáles ya tienes repetidos.';

  @override
  String get exchangeTutorialStep2Title => 'Faltantes y repetidos';

  @override
  String get exchangeTutorialStep2Body =>
      'Aquí verás en tiempo real cuántos stickers nuevos encontraste y cuántos ya tenías. Toca Ver resultados para ver la lista completa y guardar los que te faltan.';

  @override
  String get statsTutorialStep1Title => 'Tu progreso global';

  @override
  String get statsTutorialStep1Body =>
      'Esta tarjeta muestra cuántos stickers únicos tienes del total del álbum. ¡Apunta al 100%! Desliza hacia abajo para actualizar.';

  @override
  String get statsTutorialStep2Title => 'Filtra por categoría';

  @override
  String get statsTutorialStep2Body =>
      'Toca estos chips para ver las estadísticas de un país o equipo concreto. Puedes seleccionar varios a la vez para comparar.';

  @override
  String get variantTutorialTitle => 'Bölgeni seç';

  @override
  String get variantTutorialBody =>
      'Ülkene veya bölgene karşılık gelen albüm varyantını seç. Bu, koleksiyonunda hangi çıkartmaların ve varyantların (Normal, Gold, Legend) görüneceğini belirler.';

  @override
  String get drawerLegalNotice => 'Yasal Bildirim';

  @override
  String get legalNoticeTitle => 'Yasal Bildirim';

  @override
  String get legalNoticeBody =>
      'Bu uygulama resmi olmayan bir hayran yapıtıdır ve herhangi bir resmi futbol organizasyonu, çıkartma üreticisi veya futbol turnuvasının resmi ortağıyla bağlantılı, onaylı veya ilişkilendirilmiş değildir. Tüm ticari markalar ilgili sahiplerinin mülkiyetindedir.';

  @override
  String get statsTitle => 'İstatistikler';

  @override
  String get statsTotalLabel => 'Toplam';

  @override
  String get statsCollectedLabel => 'Toplanmış';

  @override
  String get statsDuplicateCopiesLabel => 'Kopyalar';

  @override
  String get statsCategoriesTitle => 'Kategoriye Göre';

  @override
  String get statsAllCategories => 'Tümü';

  @override
  String get statsNoStatsYet => 'Henüz veri yok. Toplamaya başla!';

  @override
  String get statsBestCategory => 'En fazla ilerleme';

  @override
  String get statsWorstCategory => 'En az ilerleme';

  @override
  String get statsCompletedCategories => 'Tamamlananlar';

  @override
  String get drawerStats => 'İstatistikler';

  @override
  String get statsCategoryPickerSearch => 'Kategori ara...';

  @override
  String statsCategoryPickerSelected(Object count) {
    return '$count seçildi';
  }

  @override
  String get statsCategoryPickerAll => 'Tüm kategoriler';

  @override
  String get statsCategoryPickerClear => 'Temizle';

  @override
  String get statsSortTooltip => 'Sırala';

  @override
  String get statsSortByName => 'Kategori';

  @override
  String get statsSortByProgressDesc => 'En fazla ilerleme önce';

  @override
  String get statsSortByProgressAsc => 'En az ilerleme önce';

  @override
  String get statsSortByMissing => 'En fazla eksik önce';

  @override
  String get statsSortByDuplicates => 'En fazla tekrar önce';

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
  String get drawerLookup => 'Çıkartma sorgula';

  @override
  String get physicalExchangeVirtualBtn => 'Intercambio Virtual';

  @override
  String get lookupScreenTitle => 'Çıkartma sorgula';

  @override
  String get lookupTabManual => 'Manuel';

  @override
  String get lookupTabScanner => 'Tarayıcı';

  @override
  String get lookupSearchHint => 'Ör.: ECU 10, ARG 5, FRA 1...';

  @override
  String get lookupSearchButton => 'Ara';

  @override
  String get lookupStickerNotFound => 'Bu kodla çıkartma bulunamadı.';

  @override
  String get lookupStatusMissing => 'Eksik';

  @override
  String get lookupStatusCollected => 'Zaten var ✓';

  @override
  String lookupStatusDuplicates(Object count) {
    return '$count yinelenen 🔁';
  }

  @override
  String get lookupQtyLabel => 'Envanterinizdeki miktar';

  @override
  String get lookupScannerHint => 'Tanımlamak için çıkartmayı ortala';

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
  String get lookupTutorialStep1Title => 'İki arama yöntemi';

  @override
  String get lookupTutorialStep1Body =>
      'Kodu girmek için Manuel sekmesini veya kamerayı kullanmak için Tarayıcı sekmesini kullanın.';

  @override
  String get lookupTutorialStep2Title => 'Kodu girin';

  @override
  String get lookupTutorialStep2Body =>
      'Albumde göründüğü gibi kodu girin, ör. ECU 10 veya ARG 5, ardından Ara\'ya dokunun.';

  @override
  String get lookupTutorialStep3Title => 'Kontrol et ve yönet';

  @override
  String get lookupTutorialStep3Body =>
      'Çıkartmanın eksik mi yoksa mevcut mu olduğunu göreceksiniz. + ve – düğmeleriyle envanterinizi anında güncelleyebilirsiniz.';

  @override
  String get scanBadgeNew => 'Yeni';

  @override
  String get scanBadgeRepeated => 'Tekrar';

  @override
  String get scannerModeAdd => 'Çıkartma ekle';

  @override
  String get scannerModeRemoveDuplicates => 'Tekrarları kaldır';

  @override
  String get scannerRemoveModeHint => 'Kaldırılacak tekrar çıkartmayı ortala';

  @override
  String get removeDuplicatesTitle => 'Kaldırılacak tekrarlar';

  @override
  String get removeDuplicatesEmpty => 'Henüz tekrar taranmadı';

  @override
  String removeDuplicatesSavedSuccess(Object count) {
    return '$count tekrar envanterden kaldırıldı 🗑️';
  }

  @override
  String removeDuplicatesSaveError(Object message) {
    return 'Kaydetme hatası: $message';
  }

  @override
  String removeDuplicatesLimitWarning(Object label) {
    return '$label için tekrar çıkartma yok';
  }

  @override
  String removeDuplicatesReviewButton(Object count) {
    return 'Kaldırılacak $count kişiyi incele';
  }

  @override
  String get navAlbum => 'Albüm';

  @override
  String get navScanner => 'Tarayıcı';
}
