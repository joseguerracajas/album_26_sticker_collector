import 'dart:io';
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
  final TextRecognizer _textRecognizer = TextRecognizer(
    script: TextRecognitionScript.latin,
  );

  bool _isCameraInitialized = false;
  bool _isProcessing = false;

  // --- VARIABLES DE CONSENSO (Anti-errores) ---
  String? _lastDetectedCode;
  int _consensusCount = 0;
  final int _requiredConsensus =
      3; // Cuántas veces seguidas debe ver el mismo número

  @override
  void initState() {
    super.initState();
    _initializeCamera();
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
      final inputImage = _inputImageFromCameraImage(image);
      if (inputImage == null) return;

      final recognizedText = await _textRecognizer.processImage(inputImage);
      final rawString = recognizedText.text.toUpperCase();

      // 1. EL ESCUDO ANTI-TRAMPAS 🛡️ (Verifica que sea Panini o FIFA)
      if (!rawString.contains('PANINI') && !rawString.contains('FIFA')) {
        _consensusCount = 0;
        return;
      }

      // 2. EL CAZADOR DE NÚMEROS 🎯 (Busca números de 1 a 3 dígitos)
      final RegExp regex = RegExp(r'\b\d{1,3}\b');
      final matches = regex.allMatches(rawString);

      if (matches.isEmpty) {
        _consensusCount = 0;
        return;
      }

      final foundCode = matches.first.group(0)!;

      // 3. LA REGLA DE CONSENSO 🤝
      if (foundCode == _lastDetectedCode) {
        _consensusCount++;
      } else {
        _lastDetectedCode = foundCode;
        _consensusCount = 1;
      }

      // 4. ¡BINGO! LLEGAMOS AL CONSENSO
      if (_consensusCount >= _requiredConsensus) {
        // Añadimos a la bandeja temporal usando Riverpod
        ref.read(pendingScansProvider.notifier).addSticker(foundCode);

        // Haptic feedback (vibra el teléfono)
        HapticFeedback.heavyImpact();

        // Reseteamos
        _consensusCount = 0;
        _lastDetectedCode = null;

        // Pausa de 1 segundo para no leer el mismo cromo a lo loco
        await Future.delayed(const Duration(seconds: 1));
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
        (Platform.isIOS && format != InputImageFormat.bgra8888))
      return null;

    if (image.planes.isEmpty) return null;

    // Ajuste para el formato de bytes dependiendo de la plataforma
    final bytes = Platform.isAndroid
        ? image
              .planes
              .first
              .bytes // NV21/YV12 usa un buffer continuo a veces, o se asume el primer plano para ML Kit básico
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

          // 4. (Opcional) Un mini indicador flotante para ver cuántos llevas
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Consumer(
              builder: (context, ref, child) {
                final escaneados = ref.watch(pendingScansProvider);
                if (escaneados.isEmpty) return const SizedBox.shrink();

                return Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Cromos leídos: ${escaneados.length}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
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
        Container(
          width: 250,
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.amber, width: 3),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          "Centra el número y el logo de Panini aquí",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(color: Colors.black, blurRadius: 10),
            ], // Sombra para que se lea en fondos claros
          ),
        ),
      ],
    );
  }
}
