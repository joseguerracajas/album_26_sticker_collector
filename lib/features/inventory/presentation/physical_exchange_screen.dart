import 'dart:io';

import 'package:album_26_sticker_collector/features/catalog/data/catalog_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/data/stickers_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/domain/sticker.model.dart';
import 'package:album_26_sticker_collector/features/inventory/data/inventory_provider.dart';
import 'package:album_26_sticker_collector/features/monetization/data/ads_provider.dart';
import 'package:album_26_sticker_collector/features/monetization/data/subscription_provider.dart';
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

/// Pantalla de intercambio físico de stickers.
/// Escanea stickers en lote y los clasifica en "me faltan" y "repetidos"
/// para facilitar el intercambio cara a cara con otro coleccionista.

// Provider que el AppShell activa/desactiva al cambiar de pestaña
class _ExchangeTabActiveNotifier extends Notifier<bool> {
  @override
  bool build() => false;

  void setActive(bool value) => state = value;
}

final exchangeTabActiveProvider =
    NotifierProvider<_ExchangeTabActiveNotifier, bool>(
      _ExchangeTabActiveNotifier.new,
    );

class PhysicalExchangeScreen extends ConsumerStatefulWidget {
  const PhysicalExchangeScreen({super.key});

  @override
  ConsumerState<PhysicalExchangeScreen> createState() =>
      _PhysicalExchangeScreenState();
}

class _PhysicalExchangeScreenState extends ConsumerState<PhysicalExchangeScreen>
    with WidgetsBindingObserver {
  CameraController? _cameraController;
  final TextRecognizer _textRecognizer = TextRecognizer(
    script: TextRecognitionScript.latin,
  );

  bool _isCameraInitialized = false;
  bool _isProcessing = false;
  bool _cameraError = false;
  bool _isInitializing = false;

  // Caché de stickers: "ECU10" → Sticker
  Map<String, Sticker>? _stickerCache;

  // Sistema de consenso
  final int _requiredConsensus = 3;
  final Map<String, int> _consensusMap = {};
  final Map<String, DateTime> _cooldownMap = {};

  final _orientations = {
    DeviceOrientation.portraitUp: 0,
    DeviceOrientation.landscapeLeft: 90,
    DeviceOrientation.portraitDown: 180,
    DeviceOrientation.landscapeRight: 270,
  };

  // ── Batch scan state ──────────────────────────────────────────────────────
  final Set<String> _scannedCodes = {};
  final List<Sticker> _missing = [];
  final Map<String, Sticker> _duplicatesMap = {};
  final Set<String> _selectedMissing = {};
  bool _isSaving = false;
  Map<String, String> _emojiCache = {};

  // ── Overlay de notificación ───────────────────────────────────────────────
  String? _overlayLabel;
  bool _overlayIsNew = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _loadCache();
    _loadEmojiCache();
    // La cámara se inicia de forma perezosa cuando el tab se activa
    // (evita el fallo de CameraPreview dentro de Offstage del IndexedStack)
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

  Future<void> _loadEmojiCache() async {
    final cats = await ref.read(categoriesProvider.future);
    if (mounted) {
      setState(() {
        _emojiCache = {for (final c in cats) c.id: c.emoji};
      });
    }
  }

  Future<void> _shutdownCamera() async {
    _isInitializing = false;
    try {
      if (_cameraController?.value.isStreamingImages ?? false) {
        await _cameraController?.stopImageStream();
      }
    } catch (_) {}
    try {
      await _cameraController?.dispose();
    } catch (_) {}
    _cameraController = null;
    if (mounted) {
      setState(() {
        _isCameraInitialized = false;
        _cameraError = false;
      });
    }
  }

  Future<void> _initCamera() async {
    if (_isInitializing || _isCameraInitialized) return;
    _isInitializing = true;
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
    } finally {
      _isInitializing = false;
    }
  }

  void _startStream() {
    _cameraController?.startImageStream((image) async {
      if (_isProcessing) return;
      _isProcessing = true;
      await _processFrame(image);
      _isProcessing = false;
    });
  }

  Sticker? _findSticker(String rawInput) {
    final key = rawInput.toUpperCase().replaceAll(' ', '').replaceAll('_', '');
    return _stickerCache?[key];
  }

  Future<void> _processFrame(CameraImage image) async {
    if (_stickerCache == null) return;
    try {
      final inputImage = _buildInputImage(image);
      if (inputImage == null) return;

      final result = await _textRecognizer.processImage(inputImage);
      final rawGlobal = result.text.toUpperCase();

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
          if (_findSticker(raw) != null) codesInFrame.add(raw);
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
          final sticker = _findSticker(code);
          if (sticker == null) continue;

          _cooldownMap[code] = DateTime.now();
          _consensusMap.remove(code);

          if (!mounted) return;
          await _handleScannedSticker(sticker);
        }
      }
    } catch (_) {}
  }

  Future<void> _handleScannedSticker(Sticker sticker) async {
    // Validación primero: intersticial cada 8 cromos (solo usuarios free)
    final isSubscribed =
        ref.read(subscriptionProvider).asData?.value.isSubscribed ?? false;
    if (!isSubscribed && mounted) {
      final canProceed = await ref
          .read(adServiceProvider)
          .onStickerScanned(isSubscribed: isSubscribed, context: context);
      if (!canProceed) return; // gate bloqueado → no clasificar
    }

    final normalizedCode = '${sticker.categoryId}${sticker.stickerCode}'
        .toUpperCase()
        .replaceAll(' ', '');

    // Determinar si es nuevo o repetido ANTES de clasificar
    final isNewSticker =
        !_scannedCodes.contains(normalizedCode) &&
        ((ref.read(inventoryProvider).asData?.value[sticker.id] ?? {}).values
                .fold(0, (s, q) => s + q) ==
            0);
    final emoji = _emojiCache[sticker.categoryId] ?? '';
    final label = '$emoji ${sticker.categoryId} ${sticker.stickerCode}';
    if (mounted) {
      setState(() {
        _overlayLabel = label;
        _overlayIsNew = isNewSticker;
      });
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) setState(() => _overlayLabel = null);
      });
    }

    if (_scannedCodes.contains(normalizedCode)) {
      if (mounted) setState(() => _duplicatesMap[normalizedCode] = sticker);
      await _doubleHaptic();
    } else {
      _scannedCodes.add(normalizedCode);

      final inventory = ref.read(inventoryProvider).asData?.value ?? {};
      final qty = (inventory[sticker.id] ?? {}).values.fold(0, (s, q) => s + q);

      if (qty == 0) {
        if (mounted)
          setState(() {
            _missing.add(sticker);
            _selectedMissing.add(sticker.id);
          });
        HapticFeedback.mediumImpact();
      } else {
        if (mounted) setState(() => _duplicatesMap[normalizedCode] = sticker);
        await _doubleHaptic();
      }
    }
  }

  Future<void> _doubleHaptic() async {
    HapticFeedback.heavyImpact();
    await Future.delayed(const Duration(milliseconds: 150));
    if (mounted) HapticFeedback.heavyImpact();
  }

  Future<void> _addSelectedToInventory() async {
    if (_isSaving) return;
    setState(() => _isSaving = true);
    try {
      final toAdd = _missing
          .where((s) => _selectedMissing.contains(s.id))
          .toList();
      for (final sticker in toAdd) {
        await ref
            .read(inventoryProvider.notifier)
            .updateVariantQuantity(sticker.id, 'normal', 1);
      }
      if (mounted) {
        final l10n = AppLocalizations.of(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.lookupScannerSaveSuccess(toAdd.length)),
            backgroundColor: Colors.greenAccent.shade700,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 2),
          ),
        );
        _clearSession();
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  void _clearSession() {
    setState(() {
      _scannedCodes.clear();
      _missing.clear();
      _duplicatesMap.clear();
      _selectedMissing.clear();
      _consensusMap.clear();
      _cooldownMap.clear();
    });
  }

  Future<void> _confirmClearSession(AppLocalizations l10n) async {
    _cameraController?.stopImageStream();

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF1E1E1E),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          l10n.lookupScannerResetConfirmTitle,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          l10n.lookupScannerResetConfirmMsg,
          style: const TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(
              l10n.commonCancel,
              style: const TextStyle(color: Colors.white54),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(
              l10n.lookupScannerResetConfirmBtn,
              style: const TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      _clearSession();
      if (mounted &&
          (_cameraController?.value.isInitialized ?? false) &&
          !(_cameraController?.value.isStreamingImages ?? true)) {
        _startStream();
      }
    } else if (mounted &&
        (_cameraController?.value.isInitialized ?? false) &&
        !(_cameraController?.value.isStreamingImages ?? true)) {
      _startStream();
    }
  }

  void _openResultsSheet(BuildContext context, AppLocalizations l10n) {
    _cameraController?.stopImageStream();

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => StatefulBuilder(
        builder: (ctx, setSheetState) {
          return DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.35,
            maxChildSize: 0.92,
            expand: false,
            builder: (_, scrollController) => Container(
              decoration: const BoxDecoration(
                color: Color(0xFF1A1A1A),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade700,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                    child: Row(
                      children: [
                        Text(
                          l10n.lookupScannerScannedCount(_scannedCodes.length),
                          style: const TextStyle(
                            color: Colors.white54,
                            fontSize: 13,
                          ),
                        ),
                        const Spacer(),
                        _ExStatBadge(
                          count: _missing.length,
                          label: l10n.lookupScannerNewLabel,
                          color: Colors.greenAccent,
                        ),
                        const SizedBox(width: 8),
                        _ExStatBadge(
                          count: _duplicatesMap.length,
                          label: l10n.lookupScannerDuplicatesLabel,
                          color: Colors.amber,
                        ),
                      ],
                    ),
                  ),
                  const Divider(color: Colors.white12, height: 1),
                  Expanded(
                    child: _missing.isEmpty && _duplicatesMap.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.document_scanner_outlined,
                                  color: Colors.white12,
                                  size: 56,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  l10n.lookupScannerEmptyHint,
                                  style: const TextStyle(
                                    color: Colors.white24,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : ListView(
                            controller: scrollController,
                            padding: const EdgeInsets.only(bottom: 24),
                            children: [
                              if (_missing.isNotEmpty) ...[
                                _ExSectionHeader(
                                  icon: Icons.bookmark_add_outlined,
                                  title: l10n.lookupScannerMissingSection(
                                    _missing.length,
                                  ),
                                  color: Colors.greenAccent,
                                  trailing: _selectedMissing.isNotEmpty
                                      ? TextButton.icon(
                                          style: TextButton.styleFrom(
                                            backgroundColor: Colors.greenAccent
                                                .withValues(alpha: 0.15),
                                            foregroundColor: Colors.greenAccent,
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 12,
                                              vertical: 4,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                          icon: _isSaving
                                              ? const SizedBox(
                                                  width: 14,
                                                  height: 14,
                                                  child:
                                                      CircularProgressIndicator(
                                                        strokeWidth: 2,
                                                        color:
                                                            Colors.greenAccent,
                                                      ),
                                                )
                                              : const Icon(
                                                  Icons.add_rounded,
                                                  size: 16,
                                                ),
                                          label: Text(
                                            l10n.lookupScannerAddSelected(
                                              _selectedMissing.length,
                                            ),
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          onPressed: _isSaving
                                              ? null
                                              : () async {
                                                  await _addSelectedToInventory();
                                                  setSheetState(() {});
                                                },
                                        )
                                      : null,
                                ),
                                ..._missing.map(
                                  (s) => _ExMissingTile(
                                    sticker: s,
                                    emoji: _emojiCache[s.categoryId] ?? '',
                                    isSelected: _selectedMissing.contains(s.id),
                                    onToggle: (selected) {
                                      setState(() {
                                        if (selected) {
                                          _selectedMissing.add(s.id);
                                        } else {
                                          _selectedMissing.remove(s.id);
                                        }
                                      });
                                      setSheetState(() {});
                                    },
                                  ),
                                ),
                              ],
                              if (_duplicatesMap.isNotEmpty) ...[
                                _ExSectionHeader(
                                  icon: Icons.copy_rounded,
                                  title: l10n.lookupScannerDuplicatesSection(
                                    _duplicatesMap.length,
                                  ),
                                  color: Colors.amber,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  child: Wrap(
                                    spacing: 8,
                                    runSpacing: 8,
                                    children: _duplicatesMap.values
                                        .map(
                                          (s) => Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 12,
                                              vertical: 6,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.amber.withValues(
                                                alpha: 0.1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                color: Colors.amber.withValues(
                                                  alpha: 0.3,
                                                ),
                                              ),
                                            ),
                                            child: Text(
                                              '${_emojiCache[s.categoryId] ?? ''} ${s.categoryId} ${s.stickerCode}',
                                              style: const TextStyle(
                                                color: Colors.amber,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ],
                            ],
                          ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ).whenComplete(() {
      if (mounted &&
          (_cameraController?.value.isInitialized ?? false) &&
          !(_cameraController?.value.isStreamingImages ?? true)) {
        _startStream();
      }
    });
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

    // Inicia la cámara al entrar al tab, la libera completamente al salir
    ref.listen<bool>(exchangeTabActiveProvider, (_, isActive) {
      if (!mounted) return;
      if (isActive) {
        _initCamera();
      } else {
        _shutdownCamera();
      }
    });

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          l10n.physicalExchangeScreenTitle,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.amber),
        // actions: [
        //   TextButton.icon(
        //     onPressed: () => Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (_) => const TradeHubScreen()),
        //     ),
        //     icon: const Icon(
        //       Icons.swap_horiz_rounded,
        //       color: Colors.amber,
        //       size: 18,
        //     ),
        //     label: Text(
        //       l10n.physicalExchangeVirtualBtn,
        //       style: const TextStyle(
        //         color: Colors.amber,
        //         fontWeight: FontWeight.bold,
        //       ),
        //     ),
        //   ),
        // ],
      ),
      body: _buildBody(context, l10n),
    );
  }

  Widget _buildBody(BuildContext context, AppLocalizations l10n) {
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
      children: [
        // ── Cámara a pantalla completa ───────────────────────────────────────
        Positioned.fill(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final previewAspect = _cameraController!.value.aspectRatio;
              double w = constraints.maxWidth;
              double h = constraints.maxHeight;
              if (w / h < previewAspect) {
                w = h * previewAspect;
              } else {
                h = w / previewAspect;
              }
              return OverflowBox(
                maxWidth: w,
                maxHeight: h,
                alignment: Alignment.center,
                child: CameraPreview(_cameraController!),
              );
            },
          ),
        ),

        // ── Marco de apuntado + Hint ─────────────────────────────────────────
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 220,
                height: 280,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.amber, width: 2.5),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                l10n.scannerOverlayHint,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(color: Colors.black, blurRadius: 10)],
                ),
              ),
            ],
          ),
        ),

        // ── Barra inferior ───────────────────────────────────────────────────
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black87, Colors.transparent],
              ),
            ),
            child: Row(
              children: [
                _ExStatBadge(
                  count: _missing.length,
                  label: l10n.lookupScannerNewLabel,
                  color: Colors.greenAccent,
                ),
                const SizedBox(width: 8),
                _ExStatBadge(
                  count: _duplicatesMap.length,
                  label: l10n.lookupScannerDuplicatesLabel,
                  color: Colors.amber,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => _confirmClearSession(l10n),
                  child: Tooltip(
                    message: l10n.lookupScannerResetTooltip,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.refresh_rounded,
                        color: Colors.white70,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  icon: const Icon(Icons.list_alt_rounded, size: 18),
                  label: Text(
                    l10n.lookupScannerViewResults,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  onPressed: () => _openResultsSheet(context, l10n),
                ),
              ],
            ),
          ),
        ),

        // ── Overlay de notificación de escaneo ───────────────────────────────
        if (_overlayLabel != null)
          Positioned(
            top: 80,
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
    );
  }
}

// ─── Widgets auxiliares ───────────────────────────────────────────────────────

class _ExStatBadge extends StatelessWidget {
  const _ExStatBadge({
    required this.count,
    required this.label,
    required this.color,
  });

  final int count;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$count',
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 3),
        Text(
          label,
          style: const TextStyle(color: Colors.white38, fontSize: 12),
        ),
      ],
    );
  }
}

class _ExSectionHeader extends StatelessWidget {
  const _ExSectionHeader({
    required this.icon,
    required this.title,
    required this.color,
    this.trailing,
  });

  final IconData icon;
  final String title;
  final Color color;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
      child: Row(
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const Spacer(),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}

class _ExMissingTile extends StatelessWidget {
  const _ExMissingTile({
    required this.sticker,
    required this.emoji,
    required this.isSelected,
    required this.onToggle,
  });

  final Sticker sticker;
  final String emoji;
  final bool isSelected;
  final ValueChanged<bool> onToggle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onToggle(!isSelected),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.greenAccent.withValues(alpha: 0.07)
              : Colors.transparent,
          border: Border(
            bottom: BorderSide(color: Colors.white.withValues(alpha: 0.05)),
          ),
        ),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? Colors.greenAccent : Colors.transparent,
                border: Border.all(
                  color: isSelected ? Colors.greenAccent : Colors.white24,
                  width: 1.5,
                ),
              ),
              child: isSelected
                  ? const Icon(Icons.check, color: Colors.black, size: 14)
                  : null,
            ),
            const SizedBox(width: 12),
            Text(
              '$emoji ${sticker.categoryId} ${sticker.stickerCode}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
