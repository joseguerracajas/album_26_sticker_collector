import 'dart:io';

import 'package:album_26_sticker_collector/core/tutorial/lookup_tutorial.dart';
import 'package:album_26_sticker_collector/core/tutorial/tutorial_keys.dart';
import 'package:album_26_sticker_collector/core/tutorial/tutorial_service.dart';
import 'package:album_26_sticker_collector/features/catalog/data/stickers_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/domain/sticker.model.dart';
import 'package:album_26_sticker_collector/features/inventory/presentation/widgets/sticker_info_sheet.dart';
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

/// Pantalla de consulta de sticker.
/// Permite buscar un cromo manualmente (escribiendo el código)
/// o escaneándolo con la cámara.
class StickerLookupScreen extends ConsumerStatefulWidget {
  const StickerLookupScreen({super.key});

  @override
  ConsumerState<StickerLookupScreen> createState() =>
      _StickerLookupScreenState();
}

class _StickerLookupScreenState extends ConsumerState<StickerLookupScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  // Cache: "ECU10" -> Sticker
  Map<String, Sticker>? _stickerCache;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadCache();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      final done = await TutorialService.isLookupTutorialDone();
      if (!done && mounted) LookupTutorial.show(context);
    });
  }

  Future<void> _loadCache() async {
    final stickers = await ref.read(allStickersProvider.future);
    final cache = <String, Sticker>{};
    for (final s in stickers) {
      final key = '${s.categoryId}${s.stickerCode}'.toUpperCase().replaceAll(
        ' ',
        '',
      );
      cache[key] = s;
    }
    if (mounted) setState(() => _stickerCache = cache);
  }

  Sticker? _findSticker(String rawInput) {
    final key = rawInput.toUpperCase().replaceAll(' ', '').replaceAll('_', '');
    return _stickerCache?[key];
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          l10n.lookupScreenTitle,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottom: TabBar(
          key: tutorialLookupTabBarKey,
          controller: _tabController,
          indicatorColor: Colors.amber,
          labelColor: Colors.amber,
          unselectedLabelColor: Colors.white54,
          tabs: [
            Tab(text: l10n.lookupTabManual),
            Tab(text: l10n.lookupTabScanner),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _ManualLookupTab(findSticker: _findSticker),
          _ScannerLookupTab(findSticker: _findSticker),
        ],
      ),
    );
  }
}

// ─── Pestaña: Búsqueda manual ─────────────────────────────────────────────────

class _ManualLookupTab extends ConsumerStatefulWidget {
  const _ManualLookupTab({required this.findSticker});

  final Sticker? Function(String) findSticker;

  @override
  ConsumerState<_ManualLookupTab> createState() => _ManualLookupTabState();
}

class _ManualLookupTabState extends ConsumerState<_ManualLookupTab> {
  final TextEditingController _controller = TextEditingController();
  String? _errorMessage;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _search() {
    final input = _controller.text.trim();
    if (input.isEmpty) return;

    final sticker = widget.findSticker(input);
    final l10n = AppLocalizations.of(context);

    if (sticker == null) {
      setState(() => _errorMessage = l10n.lookupStickerNotFound);
      HapticFeedback.mediumImpact();
      return;
    }

    setState(() => _errorMessage = null);
    HapticFeedback.mediumImpact();
    StickerInfoSheet.show(context, sticker);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Campo de texto
            TextField(
              key: tutorialLookupSearchFieldKey,
              controller: _controller,
              style: const TextStyle(color: Colors.white, fontSize: 18),
              textCapitalization: TextCapitalization.characters,
              onSubmitted: (_) => _search(),
              decoration: InputDecoration(
                hintText: l10n.lookupSearchHint,
                hintStyle: const TextStyle(color: Colors.white38),
                filled: true,
                fillColor: const Color(0xFF1E1E1E),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Colors.amber, width: 2),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear, color: Colors.white38),
                  onPressed: () {
                    _controller.clear();
                    setState(() => _errorMessage = null);
                  },
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Mensaje de error
            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.redAccent, fontSize: 14),
                ),
              ),

            // Botón buscar
            SizedBox(
              key: tutorialLookupSearchButtonKey,
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                ),
                icon: const Icon(Icons.search_rounded, size: 22),
                label: Text(
                  l10n.lookupSearchButton,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: _search,
              ),
            ),

            const SizedBox(height: 40),

            // Hint visual
            Center(
              child: Column(
                children: [
                  Icon(
                    Icons.manage_search_rounded,
                    color: Colors.white12,
                    size: 72,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'ECU 10  ·  ARG 5  ·  FRA 1',
                    style: const TextStyle(
                      color: Colors.white24,
                      fontSize: 13,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Pestaña: Escáner de consulta ─────────────────────────────────────────────

class _ScannerLookupTab extends ConsumerStatefulWidget {
  const _ScannerLookupTab({required this.findSticker});

  final Sticker? Function(String) findSticker;

  @override
  ConsumerState<_ScannerLookupTab> createState() => _ScannerLookupTabState();
}

class _ScannerLookupTabState extends ConsumerState<_ScannerLookupTab>
    with WidgetsBindingObserver {
  CameraController? _cameraController;
  final TextRecognizer _textRecognizer = TextRecognizer(
    script: TextRecognitionScript.latin,
  );

  bool _isCameraInitialized = false;
  bool _isProcessing = false;
  bool _cameraError = false;
  bool _sheetOpen = false;

  // Sistema de consenso (igual que el escáner principal)
  final int _requiredConsensus = 3;
  final Map<String, int> _consensusMap = {};
  final Map<String, DateTime> _cooldownMap = {};

  final _orientations = {
    DeviceOrientation.portraitUp: 0,
    DeviceOrientation.landscapeLeft: 90,
    DeviceOrientation.portraitDown: 180,
    DeviceOrientation.landscapeRight: 270,
  };

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initCamera();
  }

  Future<void> _initCamera() async {
    try {
      final cameras = await availableCameras();
      final back = cameras.firstWhere(
        (c) => c.lensDirection == CameraLensDirection.back,
        orElse: () => cameras.first,
      );
      _cameraController = CameraController(
        back,
        ResolutionPreset.high,
        enableAudio: false,
      );
      await _cameraController!.initialize();
      if (mounted) {
        setState(() => _isCameraInitialized = true);
        _startStream();
      }
    } catch (_) {
      if (mounted) setState(() => _cameraError = true);
    }
  }

  void _startStream() {
    _cameraController?.startImageStream((image) async {
      if (_isProcessing || _sheetOpen) return;
      _isProcessing = true;
      await _processFrame(image);
      _isProcessing = false;
    });
  }

  Future<void> _processFrame(CameraImage image) async {
    try {
      final inputImage = _buildInputImage(image);
      if (inputImage == null) return;

      final result = await _textRecognizer.processImage(inputImage);
      final rawGlobal = result.text.toUpperCase();

      // Escudo anti-trampas
      if (!rawGlobal.contains('PANINI') && !rawGlobal.contains('FIFA')) {
        _consensusMap.clear();
        return;
      }

      final imageW = image.width.toDouble();
      final imageH = image.height.toDouble();
      final roi = Rect.fromCenter(
        center: Offset(imageW / 2, imageH / 2),
        width: imageW * 0.5,
        height: imageH * 0.5,
      );

      final regex = RegExp(r'(?<!\d)(?:[A-Z]{3}\s?)?\d{1,3}(?!\d)');
      final Set<String> codesInFrame = {};

      for (final block in result.blocks) {
        if (!roi.contains(block.boundingBox.center)) continue;
        final blockText = block.text.toUpperCase();
        for (final match in regex.allMatches(blockText)) {
          final raw = match.group(0)!.toUpperCase().replaceAll(' ', '');
          // El cache usa la clave tal cual → la búsqueda en findSticker la normaliza
          if (widget.findSticker(raw) != null) {
            codesInFrame.add(raw);
          }
        }
      }

      _consensusMap.removeWhere((k, _) => !codesInFrame.contains(k));

      for (final code in codesInFrame) {
        if (_cooldownMap.containsKey(code)) {
          final secs = DateTime.now().difference(_cooldownMap[code]!).inSeconds;
          if (secs < 4) continue;
        }

        _consensusMap[code] = (_consensusMap[code] ?? 0) + 1;

        if (_consensusMap[code]! >= _requiredConsensus) {
          final sticker = widget.findSticker(code);
          if (sticker == null) continue;

          _cooldownMap[code] = DateTime.now();
          _consensusMap.remove(code);

          if (!mounted) return;
          HapticFeedback.heavyImpact();

          _sheetOpen = true;
          await StickerInfoSheet.show(context, sticker);
          if (mounted) _sheetOpen = false;
        }
      }
    } catch (_) {
      // Ignorar errores de OCR silenciosamente
    }
  }

  InputImage? _buildInputImage(CameraImage image) {
    if (_cameraController == null) return null;
    final camera = _cameraController!.description;
    final sensorOrientation = camera.sensorOrientation;
    InputImageRotation? rotation;

    if (Platform.isIOS) {
      rotation = InputImageRotationValue.fromRawValue(sensorOrientation);
    } else if (Platform.isAndroid) {
      var comp = _orientations[_cameraController!.value.deviceOrientation];
      if (comp == null) return null;
      if (camera.lensDirection == CameraLensDirection.front) {
        comp = (sensorOrientation + comp) % 360;
      } else {
        comp = (sensorOrientation - comp + 360) % 360;
      }
      rotation = InputImageRotationValue.fromRawValue(comp);
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

    return InputImage.fromBytes(
      bytes: image.planes.first.bytes,
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
    WidgetsBinding.instance.removeObserver(this);
    _cameraController?.dispose();
    _textRecognizer.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    if (_cameraError) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Text(
            l10n.scannerCameraInitError,
            style: const TextStyle(color: Colors.white60, fontSize: 15),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    if (!_isCameraInitialized || _cameraController == null) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.amber),
      );
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        CameraPreview(_cameraController!),
        _buildOverlay(context, l10n),
      ],
    );
  }

  Widget _buildOverlay(BuildContext context, AppLocalizations l10n) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Marco de apuntado
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
          l10n.lookupScannerHint,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            shadows: [Shadow(color: Colors.black, blurRadius: 10)],
          ),
        ),
      ],
    );
  }
}
