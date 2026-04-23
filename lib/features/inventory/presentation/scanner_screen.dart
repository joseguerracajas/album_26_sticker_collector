import 'dart:io';
import 'package:album_26_sticker_collector/features/catalog/data/stickers_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/pending_scans_sheet.dart';
import 'package:album_26_sticker_collector/features/inventory/data/pending_scans_provider.dart';
import 'package:album_26_sticker_collector/features/monetization/data/ads_provider.dart';
import 'package:album_26_sticker_collector/features/monetization/data/subscription_provider.dart';
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class ScannerScreen extends ConsumerStatefulWidget {
  const ScannerScreen({super.key});

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

  // --- VARIABLES DEL MULTIESCÁNER ---
  final int _requiredConsensus = 3;
  final Map<String, int> _consensusMap = {};
  final Map<String, DateTime> _cooldownMap = {};

  @override
  void initState() {
    super.initState();
    _loadValidIdsCache();
    _initializeCamera();
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

  Future<void> _initializeCamera() async {
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
        setState(() => _isCameraInitialized = true);
        _startImageStream();
      }
    } catch (e) {
      debugPrint('❌ Error inicializando la cámara: $e');
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

          ref.read(pendingScansProvider.notifier).addSticker(code);
          HapticFeedback.heavyImpact();

          _cooldownMap[code] = DateTime.now();
          _consensusMap.remove(code);

          // Intersticial cada 8 cromos (solo usuarios free)
          final isSubscribed =
              ref.read(subscriptionProvider).asData?.value.isSubscribed ??
              false;
          if (!isSubscribed && mounted) {
            await ref
                .read(adServiceProvider)
                .onStickerScanned(isSubscribed: isSubscribed, context: context);
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

    final bytes = Platform.isAndroid
        ? image.planes.first.bytes
        : image.planes.first.bytes;

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
    _cameraController?.dispose();
    _textRecognizer.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

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

          // 3. Botón para cerrar
          Positioned(
            top: 50,
            left: 20,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 30),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),

          // 4. Botón Flotante para ver la bandeja de escaneo
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
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      builder: (context) => const PendingScansSheet(),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScannerOverlay(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 🔥 MIRA MÁS PEQUEÑA (240x320)
        Container(
          width: 240,
          height: 320,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.amber, width: 3),
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
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            shadows: [Shadow(color: Colors.black, blurRadius: 10)],
          ),
        ),
      ],
    );
  }
}
