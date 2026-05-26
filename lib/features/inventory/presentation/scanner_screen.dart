import 'dart:io';
import 'package:album_26_sticker_collector/core/utils/rating_service.dart';
import 'package:album_26_sticker_collector/core/tutorial/scanner_tutorial.dart';
import 'package:album_26_sticker_collector/core/tutorial/tutorial_keys.dart';
import 'package:album_26_sticker_collector/core/tutorial/tutorial_service.dart';
import 'package:album_26_sticker_collector/features/catalog/data/catalog_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/data/stickers_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/domain/sticker.model.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/pending_scans_sheet.dart';
import 'package:album_26_sticker_collector/features/inventory/data/inventory_provider.dart';
import 'package:album_26_sticker_collector/features/inventory/data/pending_remove_provider.dart';
import 'package:album_26_sticker_collector/features/inventory/data/pending_scans_provider.dart';
import 'package:album_26_sticker_collector/features/inventory/presentation/remove_duplicates_sheet.dart';
import 'package:album_26_sticker_collector/features/monetization/data/ads_provider.dart';
import 'package:album_26_sticker_collector/features/monetization/data/subscription_provider.dart';
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'camera_coordinator.dart';

// Provider que el AppShell activa/desactiva al cambiar de pestaña
class _ScannerTabActiveNotifier extends Notifier<bool> {
  @override
  bool build() => false;

  void setActive(bool value) => state = value;
}

final scannerTabActiveProvider =
    NotifierProvider<_ScannerTabActiveNotifier, bool>(
      _ScannerTabActiveNotifier.new,
    );

class ScannerScreen extends ConsumerStatefulWidget {
  final bool standalone;
  const ScannerScreen({super.key, this.standalone = false});

  @override
  ConsumerState<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends ConsumerState<ScannerScreen> {
  CameraController? _cameraController;
  Map<String, String>? _validStickerIdsCache;

  final TextRecognizer _textRecognizer = TextRecognizer(
    script: TextRecognitionScript.latin,
  );

  bool _isCameraInitialized = false;
  bool _isProcessing = false;
  bool _cameraError = false;
  bool _isInitializing = false;
  Future<void>? _shutdownFuture;

  // --- VARIABLES DEL MULTIESCÁNER ---
  final int _requiredConsensus = 3;
  final Map<String, int> _consensusMap = {};
  final Map<String, DateTime> _cooldownMap = {};

  // --- SESIÓN ACTUAL Y CACHÉ DE ETIQUETAS ---
  final Set<String> _scannedThisSession = {}; // sticker IDs escaneados hoy
  Map<String, Sticker>? _stickerById; // id → Sticker
  Map<String, String> _emojiCache = {}; // categoryId → emoji

  // --- OVERLAY DE NOTIFICACIÓN ---
  String? _overlayLabel;
  bool _overlayIsNew = true;

  // --- MODO DE ESCANEO ---
  bool _isRemoveMode = false;

  // --- TUTORIAL ---
  bool _tutorialScheduled = false;

  @override
  void initState() {
    super.initState();
    // Los datos de caché se cargan siempre (sin cámara)
    _loadValidIdsCache();
    _loadStickerMeta();
    // La cámara se inicia de forma perezosa cuando el tab se activa
    // (evita el fallo de CameraPreview dentro de Offstage del IndexedStack).
    // En modo standalone (Navigator.push), se inicia directamente.
    if (widget.standalone) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _initializeCamera();
          _maybeShowScannerTutorial();
        }
      });
    }
  }

  Future<void> _maybeShowScannerTutorial() async {
    if (_tutorialScheduled || !mounted) return;
    _tutorialScheduled = true;
    // Pequeño delay para que la cámara termine de renderizarse
    await Future.delayed(const Duration(milliseconds: 600));
    if (!mounted) return;
    final done = await TutorialService.isScannerTutorialDone();
    if (!done && mounted) ScannerTutorial.show(context);
  }

  Future<void> _loadStickerMeta() async {
    try {
      final allStickers = await ref.read(allStickersProvider.future);
      final cats = await ref.read(categoriesProvider.future);
      if (mounted) {
        setState(() {
          _stickerById = {for (final s in allStickers) s.id: s};
          _emojiCache = {for (final c in cats) c.id: c.emoji};
        });
      }
    } catch (_) {}
  }

  Future<void> _loadValidIdsCache() async {
    try {
      final allStickers = await ref.read(allStickersProvider.future);

      if (mounted) {
        setState(() {
          _validStickerIdsCache = {};

          for (var cromo in allStickers) {
            final realId = cromo.id.toUpperCase();
            final searchKey = '${cromo.categoryId}${cromo.stickerCode}';
            _validStickerIdsCache![searchKey] = realId;
          }
        });
      }
    } catch (e) {
      debugPrint('❌ Error cargando caché de IDs: $e');
    }
  }

  Future<void> _shutdownCamera() async {
    debugPrint('🎥 [Scanner] _shutdownCamera: inicio');
    _isInitializing = false;
    final controller = _cameraController;
    _cameraController = null;
    _shutdownFuture = null;
    if (mounted) {
      setState(() {
        _isCameraInitialized = false;
        _cameraError = false;
      });
    }
    // Encadenar sobre cualquier shutdown previo en vuelo (de esta u otra screen)
    final prev = CameraCoordinator.shutdownFuture;
    final f = Future<void>(() async {
      if (prev != null) await prev;
      try {
        if (controller?.value.isStreamingImages ?? false) {
          debugPrint('🎥 [Scanner] stopImageStream...');
          await controller?.stopImageStream();
        }
      } catch (e) {
        debugPrint('🎥 [Scanner] error en stopImageStream: $e');
      }
      try {
        debugPrint('🎥 [Scanner] dispose...');
        await controller?.dispose();
        debugPrint('🎥 [Scanner] dispose completado');
      } catch (e) {
        debugPrint('🎥 [Scanner] error en dispose: $e');
      }
    });
    _shutdownFuture = f;
    CameraCoordinator.shutdownFuture = f;
    await f;
    if (_shutdownFuture == f) _shutdownFuture = null;
    if (CameraCoordinator.shutdownFuture == f)
      CameraCoordinator.shutdownFuture = null;
    debugPrint('🎥 [Scanner] _shutdownCamera: fin');
  }

  Future<void> _initializeCamera() async {
    debugPrint('🎥 [Scanner] _initializeCamera llamado');
    // Ceder el event loop para que cualquier _shutdownCamera pendiente
    // (del screen saliente) pueda arrancar y registrar su Future global.
    await Future.delayed(Duration.zero);
    // Esperar cualquier dispose en curso (esta screen u otras)
    final globalPending = CameraCoordinator.shutdownFuture;
    if (globalPending != null) {
      debugPrint('🎥 [Scanner] esperando shutdown global...');
      await globalPending;
      debugPrint('🎥 [Scanner] shutdown global finalizado');
    }
    if (!mounted) {
      debugPrint('🎥 [Scanner] no mounted tras espera');
      return;
    }
    if (!widget.standalone && !ref.read(scannerTabActiveProvider)) {
      debugPrint('🎥 [Scanner] tab ya no activo');
      return;
    }
    if (_isInitializing || _isCameraInitialized) {
      debugPrint(
        '🎥 [Scanner] ya inicializando/inicializado: $_isInitializing/$_isCameraInitialized',
      );
      return;
    }
    _isInitializing = true;
    debugPrint('🎥 [Scanner] iniciando cámara...');
    try {
      final cameras = await availableCameras();
      final backCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back,
        orElse: () => cameras.first,
      );

      _cameraController = CameraController(
        backCamera,
        ResolutionPreset.high,
        enableAudio: false,
      );

      await _cameraController!.initialize();

      if (mounted) {
        debugPrint('🎥 [Scanner] cámara OK, iniciando stream');
        setState(() => _isCameraInitialized = true);
        _startImageStream();
      }
    } catch (e, st) {
      debugPrint('❌ [Scanner] error inicializando cámara: $e\n$st');
      if (mounted) setState(() => _cameraError = true);
    } finally {
      _isInitializing = false;
    }
  }

  void _startImageStream() {
    _cameraController!.startImageStream((CameraImage image) async {
      if (_isProcessing) return;
      _isProcessing = true;

      await _processCameraFrame(image);

      _isProcessing = false;
    });
  }

  Future<void> _processCameraFrame(CameraImage image) async {
    try {
      final inputImage = _inputImageFromCameraImage(image);
      if (inputImage == null) return;

      final recognizedText = await _textRecognizer.processImage(inputImage);
      final rawStringGlobal = recognizedText.text.toUpperCase();

      // 1. EL ESCUDO ANTI-TRAMPAS GLOBAL 🛡️
      if (!rawStringGlobal.contains('PANINI') &&
          !rawStringGlobal.contains('FIFA')) {
        _consensusMap.clear();
        return;
      }

      if (_validStickerIdsCache == null) return;

      // 2. DEFINIR LA "VISIÓN DE TÚNEL" (Region of Interest) 🔭
      // Calculamos el 50% central de la imagen de la cámara.
      final imageWidth = image.width.toDouble();
      final imageHeight = image.height.toDouble();
      final roiRect = Rect.fromCenter(
        center: Offset(imageWidth / 2, imageHeight / 2),
        width: imageWidth * 0.5, // Solo lee la mitad central de ancho
        height: imageHeight * 0.5, // Solo lee la mitad central de alto
      );

      // El cazador de códigos mejorado (evita códigos de barras largos)
      final RegExp regex = RegExp(r'(?<!\d)(?:[A-Z]{3}\s?)?\d{1,3}(?!\d)');
      Set<String> codesInThisFrame = {};

      // 3. LA MAGIA DE LOS CUADROS CON FILTRO DE ZONA 🟩
      for (final block in recognizedText.blocks) {
        // 🔥 FILTRO ROI: Si el centro del texto que leyó NO está dentro
        // de nuestra zona central, lo ignoramos por completo.
        if (!roiRect.contains(block.boundingBox.center)) {
          continue;
        }

        final blockText = block.text.toUpperCase();
        final matches = regex.allMatches(blockText);

        for (final match in matches) {
          String rawCode = match.group(0)!.toUpperCase();
          String searchKey = rawCode.replaceAll(' ', '').replaceAll('_', '');

          if (_validStickerIdsCache!.containsKey(searchKey)) {
            codesInThisFrame.add(_validStickerIdsCache![searchKey]!);
          }
        }
      }

      // 4. LIMPIEZA DE CONSENSO 🧹
      _consensusMap.removeWhere((code, _) => !codesInThisFrame.contains(code));

      // 5. PROCESAR LOS CROMOS DEL FRAME ACTUAL 🎯
      for (final code in codesInThisFrame) {
        // --- SEGURO ANTI-METRALLETA ---
        if (_cooldownMap.containsKey(code)) {
          final seconds = DateTime.now()
              .difference(_cooldownMap[code]!)
              .inSeconds;
          if (seconds < 3) continue;
        }

        // --- SISTEMA DE CONSENSO INDIVIDUAL ---
        _consensusMap[code] = (_consensusMap[code] ?? 0) + 1;

        // --- ¡BINGO! 🏆 ---
        if (_consensusMap[code]! >= _requiredConsensus) {
          debugPrint('🎯 Cromo capturado en la mira -> $code');

          _cooldownMap[code] = DateTime.now();
          _consensusMap.remove(code);

          if (!_isRemoveMode) {
            // MODO AGREGAR: intersticial cada 8 cromos (solo usuarios free)
            final isSubscribed =
                ref.read(subscriptionProvider).asData?.value.isSubscribed ??
                false;
            if (!isSubscribed && mounted) {
              final canProceed = await ref
                  .read(adServiceProvider)
                  .onStickerScanned(
                    isSubscribed: isSubscribed,
                    context: context,
                  );
              if (!canProceed) continue; // gate bloqueado → no registrar
            }
            ref.read(pendingScansProvider.notifier).addSticker(code);
            RatingService.trackScanAndMaybePrompt();
          } else {
            // MODO QUITAR: validar límite de repetidos
            final inventoryQty =
                (ref.read(inventoryProvider).asData?.value[code] ?? {}).values
                    .fold(0, (s, q) => s + q);
            final pendingQty = ref.read(pendingRemoveProvider)[code] ?? 0;
            final maxRemovable = (inventoryQty - 1).clamp(0, inventoryQty);

            if (maxRemovable <= 0 || pendingQty >= maxRemovable) {
              if (mounted) {
                final sticker = _stickerById?[code];
                final emoji = sticker != null
                    ? (_emojiCache[sticker.categoryId] ?? '')
                    : '';
                final label = sticker != null
                    ? '$emoji ${sticker.categoryId} ${sticker.stickerCode}'
                    : code;
                final l10n = AppLocalizations.of(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      l10n.removeDuplicatesLimitWarning(label),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    backgroundColor: Colors.orangeAccent,
                    behavior: SnackBarBehavior.floating,
                    duration: const Duration(seconds: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              }
              continue;
            }
            // MODO QUITAR: mismo gate de intersticial que modo agregar
            final isSubscribed =
                ref.read(subscriptionProvider).asData?.value.isSubscribed ??
                false;
            if (!isSubscribed && mounted) {
              final canProceed = await ref
                  .read(adServiceProvider)
                  .onStickerScanned(
                    isSubscribed: isSubscribed,
                    context: context,
                  );
              if (!canProceed) continue; // gate bloqueado → no registrar
            }
            ref.read(pendingRemoveProvider.notifier).addSticker(code);
          }
          if (mounted) {
            final sticker = _stickerById?[code];
            final isNew =
                !_isRemoveMode &&
                !_scannedThisSession.contains(code) &&
                ((ref.read(inventoryProvider).asData?.value[code] ?? {}).values
                        .fold(0, (s, q) => s + q) ==
                    0);
            // Haptic: simple para nuevo, doble para repetido
            if (isNew) {
              HapticFeedback.heavyImpact();
            } else {
              HapticFeedback.heavyImpact();
              await Future.delayed(const Duration(milliseconds: 120));
              HapticFeedback.heavyImpact();
            }
            _scannedThisSession.add(code);
            final emoji = sticker != null
                ? (_emojiCache[sticker.categoryId] ?? '')
                : '';
            final label = sticker != null
                ? '$emoji ${sticker.categoryId} ${sticker.stickerCode}'
                : code;
            setState(() {
              _overlayLabel = label;
              _overlayIsNew = isNew;
            });
            Future.delayed(const Duration(seconds: 2), () {
              if (mounted) setState(() => _overlayLabel = null);
            });
          }
        }
      }
    } catch (e) {
      debugPrint('❌ Error en OCR: $e');
    }
  }

  // --- TRADUCTOR DE CÁMARA A ML KIT ---
  final _orientations = {
    DeviceOrientation.portraitUp: 0,
    DeviceOrientation.landscapeLeft: 90,
    DeviceOrientation.portraitDown: 180,
    DeviceOrientation.landscapeRight: 270,
  };

  InputImage? _inputImageFromCameraImage(CameraImage image) {
    if (_cameraController == null) return null;
    final camera = _cameraController!.description;
    final sensorOrientation = camera.sensorOrientation;
    InputImageRotation? rotation;

    if (Platform.isIOS) {
      rotation = InputImageRotationValue.fromRawValue(sensorOrientation);
    } else if (Platform.isAndroid) {
      var rotationCompensation =
          _orientations[_cameraController!.value.deviceOrientation];
      if (rotationCompensation == null) return null;
      if (camera.lensDirection == CameraLensDirection.front) {
        rotationCompensation = (sensorOrientation + rotationCompensation) % 360;
      } else {
        rotationCompensation =
            (sensorOrientation - rotationCompensation + 360) % 360;
      }
      rotation = InputImageRotationValue.fromRawValue(rotationCompensation);
    }
    if (rotation == null) return null;

    final format = InputImageFormatValue.fromRawValue(image.format.raw);
    if (format == null ||
        (Platform.isAndroid &&
            format != InputImageFormat.nv21 &&
            format != InputImageFormat.yv12) ||
        (Platform.isIOS && format != InputImageFormat.bgra8888)) {
      return null;
    }

    if (image.planes.isEmpty) return null;

    late final Uint8List bytes;
    if (Platform.isAndroid) {
      // Concatenar los planos para NV21/YV12
      final WriteBuffer allBytes = WriteBuffer();
      for (final plane in image.planes) {
        allBytes.putUint8List(plane.bytes);
      }
      bytes = allBytes.done().buffer.asUint8List();
    } else {
      bytes = image.planes.first.bytes;
    }

    return InputImage.fromBytes(
      bytes: bytes,
      metadata: InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: rotation,
        format: format,
        bytesPerRow: image.planes.first.bytesPerRow,
      ),
    );
  }

  @override
  void dispose() {
    if (widget.standalone) {
      _shutdownCamera();
    }
    _cameraController?.dispose();
    _textRecognizer.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    // Inicia la cámara al entrar al tab, la libera completamente al salir.
    // En modo standalone la cámara se maneja desde initState/dispose.
    if (!widget.standalone) {
      ref.listen<bool>(scannerTabActiveProvider, (_, isActive) {
        if (!mounted) return;
        if (isActive) {
          _initializeCamera();
          _maybeShowScannerTutorial();
        } else {
          _shutdownCamera();
        }
      });
    }

    if (_cameraError) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              l10n.scannerCameraInitError,
              style: const TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    if (!_isCameraInitialized || _cameraController == null) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator(color: Colors.amber)),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 1. La vista de la cámara
          CameraPreview(_cameraController!),

          // 2. El diseño del marco (La mira)
          _buildScannerOverlay(context),

          // 2b. Botón de retroceso (solo en modo standalone)
          if (widget.standalone)
            Positioned(
              top: MediaQuery.of(context).padding.top + 8,
              left: 8,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.black54,
                  shape: const CircleBorder(),
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),

          // 3. Toggle de modo (Agregar / Quitar repetidos)
          Positioned(
            top: MediaQuery.of(context).padding.top + 60,
            left: 20,
            right: 20,
            child: Container(
              key: tutorialScannerModeKey,
              child: _buildModeToggle(context, l10n),
            ),
          ),

          // 4. Botón Flotante para ver la bandeja de escaneo (modo AGREGAR)
          if (!_isRemoveMode)
            Positioned(
              bottom: 50,
              left: 20,
              right: 20,
              child: Consumer(
                builder: (context, ref, child) {
                  final escaneados = ref.watch(pendingScansProvider);

                  if (escaneados.isEmpty) return const SizedBox.shrink();

                  final totalCromos = escaneados.values.fold(
                    0,
                    (sum, count) => sum + count,
                  );

                  return ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 8,
                    ),
                    icon: const Icon(Icons.fact_check_outlined, size: 26),
                    label: Text(
                      l10n.scannerViewScannedButton(totalCromos),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      _cameraController?.stopImageStream();
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                        builder: (context) => const PendingScansSheet(),
                      ).whenComplete(() {
                        if (mounted &&
                            (_cameraController?.value.isInitialized ?? false) &&
                            !(_cameraController?.value.isStreamingImages ??
                                true)) {
                          _startImageStream();
                        }
                      });
                    },
                  );
                },
              ),
            ),

          // 4b. Botón Flotante para ver bandeja de quitar (modo QUITAR)
          if (_isRemoveMode)
            Positioned(
              bottom: 50,
              left: 20,
              right: 20,
              child: Consumer(
                builder: (context, ref, child) {
                  final pendingRemove = ref.watch(pendingRemoveProvider);

                  if (pendingRemove.isEmpty) return const SizedBox.shrink();

                  final totalCromos = pendingRemove.values.fold(
                    0,
                    (sum, count) => sum + count,
                  );

                  return ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 8,
                    ),
                    icon: const Icon(Icons.remove_circle_outline, size: 26),
                    label: Text(
                      l10n.removeDuplicatesReviewButton(totalCromos),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      _cameraController?.stopImageStream();
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                        builder: (context) => const RemoveDuplicatesSheet(),
                      ).whenComplete(() {
                        if (mounted &&
                            (_cameraController?.value.isInitialized ?? false) &&
                            !(_cameraController?.value.isStreamingImages ??
                                true)) {
                          _startImageStream();
                        }
                      });
                    },
                  );
                },
              ),
            ),

          // 5. Overlay de notificación de escaneo
          if (_overlayLabel != null)
            Positioned(
              top: 130,
              left: 24,
              right: 24,
              child: AnimatedOpacity(
                opacity: _overlayLabel != null ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.75),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _overlayLabel!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: _overlayIsNew
                              ? Colors.greenAccent
                              : Colors.redAccent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          _overlayIsNew
                              ? l10n.scanBadgeNew
                              : l10n.scanBadgeRepeated,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildModeToggle(BuildContext context, AppLocalizations l10n) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.65),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Expanded(
            child: _ModeToggleOption(
              label: l10n.scannerModeAdd,
              icon: Icons.add_circle_outline,
              isSelected: !_isRemoveMode,
              selectedColor: Colors.amber,
              onTap: () {
                if (_isRemoveMode) {
                  HapticFeedback.selectionClick();
                  setState(() => _isRemoveMode = false);
                }
              },
            ),
          ),
          Expanded(
            child: _ModeToggleOption(
              label: l10n.scannerModeRemoveDuplicates,
              icon: Icons.remove_circle_outline,
              isSelected: _isRemoveMode,
              selectedColor: Colors.orangeAccent,
              onTap: () {
                if (!_isRemoveMode) {
                  HapticFeedback.selectionClick();
                  setState(() => _isRemoveMode = true);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScannerOverlay(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final borderColor = _isRemoveMode ? Colors.orangeAccent : Colors.amber;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 🔥 MIRA MÁS PEQUEÑA (240x320)
        Container(
          key: tutorialScannerFrameKey,
          width: 240,
          height: 320,
          decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: 3),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                spreadRadius: 2,
                blurRadius: 15,
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          l10n.scannerOverlayHint,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: _isRemoveMode ? Colors.orangeAccent : Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            shadows: const [Shadow(color: Colors.black, blurRadius: 10)],
          ),
        ),
      ],
    );
  }
}

class _ModeToggleOption extends StatelessWidget {
  const _ModeToggleOption({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.selectedColor,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool isSelected;
  final Color selectedColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        decoration: BoxDecoration(
          color: isSelected ? selectedColor : Colors.transparent,
          borderRadius: BorderRadius.circular(26),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 16,
              color: isSelected ? Colors.black : Colors.white70,
            ),
            const SizedBox(width: 4),
            Flexible(
              child: Text(
                label,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: isSelected ? Colors.black : Colors.white70,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
