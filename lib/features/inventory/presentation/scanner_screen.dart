import 'dart:io';
import 'package:album_26_sticker_collector/features/catalog/data/stickers_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/pending_scans_sheet.dart';
import 'package:album_26_sticker_collector/features/inventory/data/pending_scans_provider.dart';
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
  final int _requiredConsensus = 3; // Cuántas veces seguidas debe ver el número
  Map<String, int> _consensusMap =
      {}; // Rastrea el progreso de cada cromo { "ECU_10": 2 }
  Map<String, DateTime> _cooldownMap =
      {}; // Rastrea el bloqueo temporal { "ECU_10": 10:05:01 }

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
          // Inicializamos como un Map vacío
          _validStickerIdsCache = {};

          for (var cromo in allStickers) {
            final realId = cromo.id.toUpperCase(); // Ej: "ECU_10"
            // Creamos la llave sin espacios ni guiones
            final searchKey = '${cromo.categoryId}${cromo.stickerCode}';

            // Llenamos el diccionario: traductor["ECU10"] = "ECU_10"
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
        enableAudio: false, // ¡Sin audio para no pedir permisos de micrófono!
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
      // 1. Convertimos el video a formato ML Kit
      final inputImage = _inputImageFromCameraImage(image);
      if (inputImage == null) return;

      // Extraemos el texto crudo de la imagen
      final recognizedText = await _textRecognizer.processImage(inputImage);
      final rawStringGlobal = recognizedText.text.toUpperCase();

      // 2. EL ESCUDO ANTI-TRAMPAS GLOBAL 🛡️
      if (!rawStringGlobal.contains('PANINI') &&
          !rawStringGlobal.contains('FIFA')) {
        _consensusMap.clear(); // Si quitamos los cromos, borramos el progreso
        return;
      }

      if (_validStickerIdsCache == null) return;

      // (?<!\d) y (?!\d) evitan leer códigos de barras largos
      final RegExp regex = RegExp(r'(?<!\d)(?:[A-Z]{3}\s?)?\d{1,3}(?!\d)');

      // Aquí guardaremos los cromos válidos que encontremos en ESTE frame exacto
      Set<String> codesInThisFrame = {};

      // 3. LA MAGIA DE LOS CUADROS 🟩 (Procesamos bloque por bloque)
      for (final block in recognizedText.blocks) {
        final blockText = block.text.toUpperCase();
        final matches = regex.allMatches(blockText);

        for (final match in matches) {
          String rawCode = match.group(0)!.toUpperCase();
          String searchKey = rawCode.replaceAll(' ', '').replaceAll('_', '');

          // Si el código de ESTE cuadro existe en la DB, lo añadimos a la lista del frame
          if (_validStickerIdsCache!.containsKey(searchKey)) {
            codesInThisFrame.add(_validStickerIdsCache![searchKey]!);
          }
        }
      }

      // 4. LIMPIEZA DE CONSENSO 🧹
      // Si un cromo estaba a punto de ser capturado pero moviste la mano, reseteamos su contador
      _consensusMap.removeWhere((code, _) => !codesInThisFrame.contains(code));

      // 5. PROCESAR LOS CROMOS DEL FRAME ACTUAL 🎯
      for (final code in codesInThisFrame) {
        // --- SEGURO ANTI-METRALLETA POR CROMO ---
        if (_cooldownMap.containsKey(code)) {
          final seconds = DateTime.now()
              .difference(_cooldownMap[code]!)
              .inSeconds;
          if (seconds < 3)
            continue; // Si este cromo específico fue escaneado hace menos de 3s, lo ignoramos
        }

        // --- SISTEMA DE CONSENSO INDIVIDUAL ---
        _consensusMap[code] = (_consensusMap[code] ?? 0) + 1;

        // --- ¡BINGO MULTIPLE! 🏆 ---
        if (_consensusMap[code]! >= _requiredConsensus) {
          debugPrint('🎯 Cromo capturado por bloque -> $code');

          // Guardamos en Riverpod
          ref.read(pendingScansProvider.notifier).addSticker(code);
          HapticFeedback.heavyImpact();

          // Ponemos ESTE cromo en cooldown
          _cooldownMap[code] = DateTime.now();

          // Reseteamos su consenso para el futuro
          _consensusMap.remove(code);
        }
      }
    } catch (e) {
      debugPrint('❌ Error en el procesamiento del OCR: $e');
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

    // Ajuste para el formato de bytes dependiendo de la plataforma
    final bytes = Platform.isAndroid
        ? image
              .planes
              .first
              .bytes // NV21/YV12
        : image.planes.first.bytes; // BGRA8888 en iOS

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
          _buildScannerOverlay(),

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

                // Si no hay nada escaneado, ocultamos el botón
                if (escaneados.isEmpty) return const SizedBox.shrink();

                // Sumamos la cantidad total de cromos (por si escaneó el mismo 3 veces)
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
                    'Ver $totalCromos cromos escaneados',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    HapticFeedback.lightImpact();
                    // AQUÍ LLAMAMOS A TU NUEVO WIDGET
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      isScrollControlled:
                          true, // Permite que crezca si hay muchos
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

  Widget _buildScannerOverlay() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // La "Mira" con proporciones físicas reales (4.9cm x 6.5cm)
        Container(
          width: 309,
          height: 410,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.amber, width: 3),
            borderRadius: BorderRadius.circular(12),
            // Un toque de sombra para que resalte sobre cualquier fondo
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 15,
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          "Centra la parte trasera del cromo aquí",
          textAlign: TextAlign.center,
          style: TextStyle(
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
