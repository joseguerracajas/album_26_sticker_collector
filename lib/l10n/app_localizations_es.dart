// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Álbum 26';

  @override
  String get authWelcomeTitle => 'Bienvenido a Álbum 26';

  @override
  String get authEmailLabel => 'Correo electrónico';

  @override
  String get authPasswordLabel => 'Contraseña';

  @override
  String get authLoginButton => 'INICIAR SESIÓN';

  @override
  String get authContinueWith => 'O continúa con';

  @override
  String get authContinueGoogle => 'Continuar con Google';

  @override
  String get authContinueApple => 'Continuar con Apple';

  @override
  String get authContinueGuest => 'Continuar como invitado';

  @override
  String get authNoAccountRegister => '¿No tienes cuenta? Regístrate';

  @override
  String get authForgotPassword => '¿Olvidaste tu contraseña?';

  @override
  String get authResetPasswordEnterEmail =>
      'Ingresa tu correo para recuperar la contraseña.';

  @override
  String get authResetPasswordEmailSent =>
      'Te enviamos un correo para restablecer tu contraseña.';

  @override
  String get authGuestMigratedSuccess =>
      '¡Tu progreso como invitado se transfirió a tu nueva cuenta con éxito! 🏆';

  @override
  String get authGuestRemotePreserved =>
      '¡Bienvenido de vuelta! Se ha restaurado tu colección de la nube y el progreso local ha sido descartado.';

  @override
  String commonErrorWithMessage(Object message) {
    return 'Error: $message';
  }

  @override
  String get authErrorInvalidCredentials =>
      'Correo o contraseña incorrectos. Verifica tus datos e intenta de nuevo.';

  @override
  String get authErrorEmailNotConfirmed =>
      'Tu correo aún no ha sido confirmado. Revisa tu bandeja de entrada.';

  @override
  String get authErrorUserAlreadyRegistered =>
      'Ya existe una cuenta con ese correo electrónico.';

  @override
  String get authErrorWeakPassword =>
      'La contraseña es demasiado débil. Usa al menos 6 caracteres.';

  @override
  String get authErrorInvalidEmail =>
      'El formato del correo electrónico no es válido.';

  @override
  String get authErrorTokenExpired =>
      'El código ha expirado o no es válido. Solicita uno nuevo.';

  @override
  String get authErrorRateLimit =>
      'Demasiados intentos. Espera un momento antes de volver a intentarlo.';

  @override
  String get authErrorNetworkError =>
      'Sin conexión. Verifica tu red e intenta de nuevo.';

  @override
  String get authErrorSessionExpired =>
      'Tu sesión ha expirado. Inicia sesión nuevamente.';

  @override
  String get authErrorUnknown =>
      'Ocurrió un error inesperado. Intenta de nuevo.';

  @override
  String get registerTitle => 'Crear Cuenta';

  @override
  String get registerFillAllFields => 'Por favor, completa todos los campos.';

  @override
  String get registerEmailsDontMatch =>
      'Los correos electrónicos no coinciden.';

  @override
  String get registerPasswordsDontMatch => 'Las contraseñas no coinciden.';

  @override
  String get registerPasswordMinLength =>
      'La contraseña debe tener al menos 6 caracteres.';

  @override
  String get registerAccountCreated =>
      '¡Cuenta creada con éxito! ⚽ Ahora inicia sesión.';

  @override
  String get registerConfirmEmailLabel => 'Confirmar correo electrónico';

  @override
  String get registerConfirmPasswordLabel => 'Confirmar contraseña';

  @override
  String get registerSubmitButton => 'REGISTRARME';

  @override
  String get profileTitle => 'Mi Perfil';

  @override
  String get profileOfficialCollector => 'Coleccionista Oficial 🌟';

  @override
  String get profileChangePasswordButton => 'Actualizar contraseña';

  @override
  String get profileChangePasswordTitle => 'Actualizar contraseña';

  @override
  String get profileNewPasswordLabel => 'Nueva contraseña';

  @override
  String get profileConfirmNewPasswordLabel => 'Confirmar nueva contraseña';

  @override
  String get profilePasswordUpdatedSuccess =>
      'Contraseña actualizada correctamente.';

  @override
  String get profileLogoutButton => 'Cerrar Sesión';

  @override
  String get profileLogoutSuccess => 'Sesión cerrada correctamente.';

  @override
  String get profileUnknownUser => 'Usuario desconocido';

  @override
  String profileLogoutError(Object message) {
    return 'Error al cerrar sesión: $message';
  }

  @override
  String get homeTitle => 'Mi Álbum 26';

  @override
  String get homeProfileTooltip => 'Mi Perfil';

  @override
  String get drawerSignIn => 'Iniciar Sesión';

  @override
  String get homeShareAll => 'Compartir Todo';

  @override
  String get homeShareMissingOnly => 'Solo Faltantes';

  @override
  String get homeShareDuplicatesOnly => 'Solo Repetidas';

  @override
  String get homeGlobalProgressTitle => 'Progreso Global';

  @override
  String homeCollectedCount(Object collected, Object total) {
    return '$collected de $total coleccionadas';
  }

  @override
  String get homeViewFullCollection => 'Ver Colección Completa';

  @override
  String get homeTeamsTitle => 'Equipos';

  @override
  String get homeSearchTeamsHint => 'Buscar país o equipo...';

  @override
  String get homeNoResults => 'Sin resultados';

  @override
  String get homeScanButton => 'Escanear Cromo';

  @override
  String homeObtainedCount(Object collected, Object total) {
    return '$collected de $total obtenidos';
  }

  @override
  String get homeProgressError => 'Error';

  @override
  String get globalCollectionTitle => 'Colección Completa';

  @override
  String get filterAll => 'Todos';

  @override
  String get filterMissing => 'Faltantes';

  @override
  String get filterDuplicates => 'Repetidas';

  @override
  String get filterSearchHint => 'Buscar país, código o número...';

  @override
  String get stickerRemoveTitle => '¿Quitar cromo?';

  @override
  String stickerRemoveConfirm(Object stickerLabel) {
    return '¿Seguro que quieres quitar el cromo $stickerLabel de tu álbum?';
  }

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonRemove => 'Quitar';

  @override
  String get commonDone => 'LISTO';

  @override
  String get gridNoResults => 'No se encontraron stickers.';

  @override
  String scannerViewScannedButton(Object count) {
    return 'Revisar $count stickers escaneados';
  }

  @override
  String get scannerOverlayHint => 'Centra la parte trasera del cromo aquí';

  @override
  String get pendingScansTitle => 'stickers Escaneados';

  @override
  String get pendingScansEmpty => 'Aún no has escaneado ningún cromo';

  @override
  String pendingScansItemLabel(Object code) {
    return 'Sticker: $code';
  }

  @override
  String pendingScansSavedSuccess(Object count) {
    return '¡$count stickers añadidos a tu álbum con éxito! 🏆';
  }

  @override
  String pendingScansSaveError(Object message) {
    return 'Error al guardar: $message';
  }

  @override
  String get shareHeader => '⚽ *INTERCAMBIO ÁLBUM 26* 🏆';

  @override
  String get shareMissingSectionTitle => '❌ *ME FALTAN:*';

  @override
  String get shareDuplicatesSectionTitle => '🔁 *REPETIDAS:*';

  @override
  String get shareNoneMissing => '¡Ninguno! 😎';

  @override
  String get shareNoDuplicates => 'Sin repetidas 😅';

  @override
  String get shareLetsTrade => '¿Cambiamos? 👀🔥';

  @override
  String get shareSeparator => '--------------------------';

  @override
  String get forgotPasswordTitle => 'Recuperar Cuenta';

  @override
  String get forgotPasswordDescription =>
      'Ingresa tu correo electrónico y te enviaremos un código de 6 dígitos para restablecer tu contraseña.';

  @override
  String get forgotPasswordEmailLabel => 'Correo Electrónico';

  @override
  String get forgotPasswordEmptyEmailError =>
      'Por favor, ingresa tu correo electrónico.';

  @override
  String get forgotPasswordCodeSentSuccess =>
      'Código enviado. Revisa tu bandeja de entrada.';

  @override
  String get forgotPasswordSendCodeButton => 'ENVIAR CÓDIGO';

  @override
  String forgotPasswordStep2Description(Object email) {
    return 'Escribe el código que enviamos a $email y tu nueva contraseña.';
  }

  @override
  String get forgotPasswordCodeInputLabel => 'Código de 8 dígitos';

  @override
  String get forgotPasswordInvalidCodeError =>
      'El código debe tener exactamente 6 dígitos.';

  @override
  String get forgotPasswordNewPasswordLabel => 'Nueva Contraseña';

  @override
  String get forgotPasswordShortPasswordError =>
      'La contraseña debe tener al menos 6 caracteres.';

  @override
  String get forgotPasswordSavePasswordButton => 'GUARDAR CONTRASEÑA';

  @override
  String get forgotPasswordPasswordUpdatedSuccess =>
      '¡Contraseña actualizada con éxito! 🏆';

  @override
  String get validationEmailInvalid => 'El correo electrónico no es válido.';

  @override
  String get paywallTitle => 'Disfruta sin publicidad';

  @override
  String get paywallSubtitle =>
      'Todas las funciones están disponibles gratis. Con Pro disfrutas de todo sin interrupciones.';

  @override
  String get paywallBenefitScanner => 'Escáner sin anuncios intermedios';

  @override
  String get paywallBenefitNoAds => 'Sin publicidad';

  @override
  String get paywallBenefitSync => 'Sincronización en la nube incluida';

  @override
  String paywallSubscribeButton(Object price) {
    return 'Suscribirse · $price';
  }

  @override
  String get paywallPackageMonthly => 'Mensual';

  @override
  String get paywallPackageAnnual => 'Anual';

  @override
  String get paywallPackageWeekly => 'Semanal';

  @override
  String get paywallPackageLifetime => 'De por vida';

  @override
  String get paywallPackageTwoMonth => 'Bimestral';

  @override
  String get paywallPackageThreeMonth => 'Trimestral';

  @override
  String get paywallPackageSixMonth => 'Semestral';

  @override
  String get paywallRestorePurchases => 'Restaurar compras';

  @override
  String get paywallCancelAnytime => 'Cancela cuando quieras. Sin compromisos.';

  @override
  String get paywallLoadError =>
      'No se pudieron cargar los planes. Verifica tu conexión.';

  @override
  String get paywallRetry => 'Reintentar';

  @override
  String get paywallPurchaseError =>
      'Error al procesar la compra. Inténtalo de nuevo.';

  @override
  String get paywallRestoreError =>
      'No se pudieron restaurar las compras. Inténtalo de nuevo.';

  @override
  String get paywallGuestTitle => 'Inicia sesión para suscribirte';

  @override
  String get paywallGuestBody =>
      'Pro está vinculado a tu cuenta. Inicia sesión o crea una cuenta para desbloquear todas las funciones.';

  @override
  String get paywallGuestSignInButton => 'INICIAR SESIÓN';

  @override
  String scannerDemoRemaining(Object count) {
    return '$count escaneos gratis restantes';
  }

  @override
  String get scannerDemoFinishedTitle => 'Has usado tus 5 escaneos gratis';

  @override
  String get scannerDemoFinishedSubtitle =>
      'Suscríbete para escanear stickers ilimitados y disfrutar sin publicidad.';

  @override
  String get scannerDemoUnlockButton => 'Ver planes Pro';

  @override
  String get adDialogTitle => 'Contenido gratuito';

  @override
  String get adDialogBody =>
      'Para continuar, ve un breve anuncio o suscríbete a Pro y olvídate de la publicidad para siempre.';

  @override
  String get adDialogWatchAd => 'Ver anuncio';

  @override
  String get adDialogGetPro => 'Obtener Pro';

  @override
  String get adDialogNotNow => 'Ahora no';

  @override
  String get scannerCameraInitError =>
      'No se pudo inicializar la cámara. Verifica que la app tenga permiso de acceso a la cámara.';

  @override
  String get variantSheetTitle => 'Variante del álbum';

  @override
  String get variantSheetInventoryNote =>
      'Tu inventario se conserva al cambiar de variante. Los stickers que ya tienes siguen registrados.';

  @override
  String variantSheetLoadError(Object error) {
    return 'Error cargando variantes: $error';
  }

  @override
  String get variantSheetEmpty =>
      'No hay variantes disponibles para este álbum.';

  @override
  String get variantSheetDefaultLabel => 'Variante por defecto';

  @override
  String get variantMandatoryTitle => 'Elige tu región';

  @override
  String get variantMandatorySubtitle =>
      'Selecciona la versión del álbum de tu zona para ver los stickers correctos.';

  @override
  String variantChangedSuccess(Object name) {
    return 'Variante cambiada a $name ✅';
  }

  @override
  String get profileDeleteAccountButton => 'Eliminar cuenta';

  @override
  String get profileDeleteAccountTitle => '¿Eliminar tu cuenta?';

  @override
  String get profileDeleteAccountMessage =>
      'Esta acción es permanente. Se borrarán todos tus datos y no podrás recuperar tu colección.';

  @override
  String get profileDeleteAccountConfirmButton => 'Eliminar definitivamente';

  @override
  String get profileDeleteAccountSuccess => 'Tu cuenta ha sido eliminada.';

  @override
  String get profileDeleteAccountError =>
      'Error al eliminar la cuenta. Inténtalo de nuevo.';

  @override
  String get paywallPrivacyPolicy => 'Política de Privacidad';

  @override
  String get paywallTermsOfUse => 'Términos de Uso';

  @override
  String get paywallLegalDisclaimer =>
      'Al suscribirte aceptas nuestros Términos de Uso y Política de Privacidad.';

  @override
  String get tutorialSkip => 'Saltar';

  @override
  String get tutorialTapToContinue => 'Toca en cualquier lugar para continuar';

  @override
  String get tutorialStep1Title => 'Tu progreso global';

  @override
  String get tutorialStep1Body =>
      'Aquí ves cuántos stickers llevas y tu porcentaje de completado. ¡Sigue coleccionando!';

  @override
  String get tutorialStep2Title => 'Busca equipos';

  @override
  String get tutorialStep2Body =>
      'Escribe el nombre de un país o equipo para filtrar la lista al instante.';

  @override
  String get tutorialStep3Title => 'Menú principal';

  @override
  String get tutorialStep3Body =>
      'Aquí puedes cambiar tu perfil, elegir la variante del álbum y más opciones.';

  @override
  String get tutorialStep4Title => 'Escanea stickers';

  @override
  String get tutorialStep4Body =>
      'Usa la cámara para escanear el dorso de tus stickers físicos y añadirlos automáticamente a tu álbum.';

  @override
  String get tutorialStep5Title => 'Comparte tu lista';

  @override
  String get tutorialStep5Body =>
      'Exporta tu lista de faltantes o repetidas para intercambiar stickers con amigos.';

  @override
  String get globalTutorialStep1Title => 'Filtra tu colección';

  @override
  String get globalTutorialStep1Body =>
      'Usa estos botones para ver todos tus stickers, solo los que te faltan o solo los repetidos. ¡Ideal para organizar intercambios!';

  @override
  String get globalTutorialStep2Title => 'Busca un cromo';

  @override
  String get globalTutorialStep2Body =>
      'Escribe el nombre del país, el código o el número del cromo para encontrarlo rápidamente.';

  @override
  String get globalTutorialStep3Title => 'Toca para marcar';

  @override
  String get globalTutorialStep3Body =>
      'Un toque sobre un cromo gris lo añade a tu álbum (se pone dorado). Si ya lo tienes y lo tocas de nuevo, te pedirá confirmación para quitarlo.';

  @override
  String get globalTutorialStep4Title => 'Mantén pulsado para más opciones';

  @override
  String get globalTutorialStep4Body =>
      'Si mantienes pulsado un cromo puedes gestionar cuántas copias tienes de cada variante (Normal, Gold, Legend…) y actualizar tu inventario de repetidas.';

  @override
  String get tutorialStep6Title => 'Explora una categoria';

  @override
  String get tutorialStep6Body =>
      'Toca cualquier pais o equipo para ver sus stickers. Alli podras marcar los que ya tienes y gestionar tus repetidos.';

  @override
  String get categoryTutorialStep1Title => 'Filtra los stickers';

  @override
  String get categoryTutorialStep1Body =>
      'Usa estos botones para ver todos los stickers de esta categoria, solo los que te faltan o solo los repetidos.';

  @override
  String get categoryTutorialStep2Title => 'Busca un cromo';

  @override
  String get categoryTutorialStep2Body =>
      'Escribe el nombre del pais, el codigo o el numero del cromo para encontrarlo rapidamente.';

  @override
  String get categoryTutorialStep3Title => 'Toca para marcar';

  @override
  String get categoryTutorialStep3Body =>
      'Un toque sobre un cromo gris lo anade a tu album (se pone dorado). Si ya lo tienes y lo tocas de nuevo, te pedira confirmacion para quitarlo.';

  @override
  String get categoryTutorialStep4Title => 'Manten pulsado para mas opciones';

  @override
  String get categoryTutorialStep4Body =>
      'Si mantienes pulsado un cromo puedes gestionar cuantas copias tienes de cada variante (Normal, Gold, Legend) y actualizar tu inventario de repetidas.';

  @override
  String get drawerReplayTutorial => 'Ver tutorial de nuevo';

  @override
  String get variantTutorialTitle => 'Selecciona tu región';

  @override
  String get variantTutorialBody =>
      'Elige la variante del álbum que corresponde a tu país o región. Esto define qué stickers y variantes (Normal, Gold, Legend) aparecerán en tu colección.';

  @override
  String get drawerLegalNotice => 'Aviso Legal';

  @override
  String get legalNoticeTitle => 'Aviso Legal';

  @override
  String get legalNoticeBody =>
      'Esta aplicación es una creación de fans no oficial y no está afiliada, respaldada ni conectada con cualquier organización oficial de fútbol o fabricante de stickers o cualquier socio oficial del torneo de fútbol. Todas las marcas registradas son propiedad de sus respectivos dueños.';

  @override
  String get statsTitle => 'Estadísticas';

  @override
  String get statsTotalLabel => 'Total';

  @override
  String get statsCollectedLabel => 'Recolectados';

  @override
  String get statsDuplicateCopiesLabel => 'Repetidos';

  @override
  String get statsCategoriesTitle => 'Por Categoría';

  @override
  String get statsAllCategories => 'Todas';

  @override
  String get statsNoStatsYet => 'Sin datos aún. ¡Empieza a coleccionar!';

  @override
  String get statsBestCategory => 'Mayor progreso';

  @override
  String get statsWorstCategory => 'Menor progreso';

  @override
  String get statsCompletedCategories => 'Completas';

  @override
  String get drawerStats => 'Estadísticas';

  @override
  String get statsCategoryPickerSearch => 'Buscar categoría...';

  @override
  String statsCategoryPickerSelected(Object count) {
    return '$count seleccionadas';
  }

  @override
  String get statsCategoryPickerAll => 'Todas las categorías';

  @override
  String get statsCategoryPickerClear => 'Limpiar';

  @override
  String get statsSortTooltip => 'Ordenar';

  @override
  String get statsSortByName => 'Categoría';

  @override
  String get statsSortByProgressDesc => 'Mayor progreso primero';

  @override
  String get statsSortByProgressAsc => 'Menor progreso primero';

  @override
  String get statsSortByMissing => 'Más faltantes primero';

  @override
  String get statsSortByDuplicates => 'Más repetidos primero';

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
    return '$count cromo(s) seleccionado(s)';
  }

  @override
  String get tradeNegNoStickers => 'No tienes stickers para ofrecer.';

  @override
  String get tradeNegPartnerWaiting =>
      'El otro coleccionista aún no ha seleccionado sus stickers.';

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
      'Marca los stickers que recibiste físicamente';

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
  String get drawerLookup => 'Buscar';

  @override
  String get physicalExchangeVirtualBtn => 'Intercambio Virtual';

  @override
  String get lookupScreenTitle => 'Consultar Cromo';

  @override
  String get lookupTabManual => 'Manual';

  @override
  String get lookupTabScanner => 'Escáner';

  @override
  String get lookupSearchHint => 'Ej: ECU 10, ARG 5, FRA 1...';

  @override
  String get lookupSearchButton => 'Buscar';

  @override
  String get lookupStickerNotFound =>
      'No se encontró ningún cromo con ese código.';

  @override
  String get lookupStatusMissing => 'Te falta';

  @override
  String get lookupStatusCollected => 'Ya lo tienes ✓';

  @override
  String lookupStatusDuplicates(Object count) {
    return '$count repetido(s) 🔁';
  }

  @override
  String get lookupQtyLabel => 'Cantidad en tu inventario';

  @override
  String get lookupScannerHint => 'Centra el cromo para identificarlo';

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
  String get lookupTutorialStep1Title => 'Dos formas de buscar';

  @override
  String get lookupTutorialStep1Body =>
      'Usa la pestaña Manual para ingresar el código del cromo (ej. ECU 10), o la pestaña Escáner para apuntar la cámara directamente.';

  @override
  String get lookupTutorialStep2Title => 'Ingresa el código';

  @override
  String get lookupTutorialStep2Body =>
      'Escribe el código del cromo tal como aparece en el álbum, por ejemplo ECU 10 o ARG 5, y pulsa Buscar.';

  @override
  String get lookupTutorialStep3Title => 'Consulta y gestiona';

  @override
  String get lookupTutorialStep3Body =>
      'Verás si el cromo te falta, ya lo tienes o cuántos repetidos llevas. Con los botones + y – puedes actualizar tu inventario al instante.';
}
