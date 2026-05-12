import 'dart:io';

import 'package:album_26_sticker_collector/core/tutorial/lookup_tutorial.dart';
import 'package:album_26_sticker_collector/core/tutorial/tutorial_keys.dart';
import 'package:album_26_sticker_collector/core/tutorial/tutorial_service.dart';
import 'package:album_26_sticker_collector/features/catalog/data/stickers_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/domain/sticker.model.dart';
import 'package:album_26_sticker_collector/features/inventory/data/inventory_provider.dart';
import 'package:album_26_sticker_collector/features/inventory/presentation/scanner_screen.dart';
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
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        FocusManager.instance.primaryFocus?.unfocus();
      }
    });
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
        iconTheme: const IconThemeData(color: Colors.amber),
        title: Text(
          l10n.lookupScreenTitle,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: l10n.lookupScannerOpenTooltip,
            icon: const Icon(
              Icons.qr_code_scanner_rounded,
              color: Colors.amber,
            ),
            onPressed: () => Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => const ScannerScreen())),
          ),
        ],
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
  final TextEditingController _lettersCtrl = TextEditingController();
  final TextEditingController _numbersCtrl = TextEditingController();
  final FocusNode _lettersFocus = FocusNode();
  final FocusNode _numbersFocus = FocusNode();
  String? _errorMessage;
  Sticker? _foundSticker;

  static const _sentinel = '\u200b';

  @override
  void initState() {
    super.initState();
    // El centinela permite detectar backspace en teclado soft:
    // cuando el usuario borra el centinela el campo queda vacío
    // y onChanged dispara con '', lo que indica backspace en campo vacío.
    _numbersFocus.addListener(_onNumbersFocusChange);
  }

  void _onNumbersFocusChange() {
    if (_numbersFocus.hasFocus) _ensureSentinel();
  }

  void _ensureSentinel() {
    if (!_numbersCtrl.text.startsWith(_sentinel)) {
      final current = _numbersCtrl.text;
      _numbersCtrl.value = TextEditingValue(
        text: '$_sentinel$current',
        selection: TextSelection.collapsed(offset: 1 + current.length),
      );
    }
  }

  String get _numbersDigits => _numbersCtrl.text.replaceAll(_sentinel, '');

  @override
  void dispose() {
    _lettersCtrl.dispose();
    _numbersCtrl.dispose();
    _lettersFocus.dispose();
    _numbersFocus.dispose();
    super.dispose();
  }

  Sticker? _findBestMatch(String letters, String numbers) {
    final input = '$letters$numbers';
    Sticker? sticker = widget.findSticker(input);

    // Intentar sin cero inicial (p. ej. "ECU05" → "ECU5")
    if (sticker == null) {
      final trimmed = '$letters${numbers.replaceFirst(RegExp(r'^0+'), '')}';
      if (trimmed != input) sticker = widget.findSticker(trimmed);
    }

    // Intentar con cero inicial (p. ej. "ECU5" → "ECU05")
    if (sticker == null) {
      final padded = '$letters${numbers.padLeft(2, '0')}';
      if (padded != input) sticker = widget.findSticker(padded);
    }

    return sticker;
  }

  /// Búsqueda en vivo: no borra los campos ni quita el foco.
  void _autoSearch() {
    final letters = _lettersCtrl.text.trim();
    final numbers = _numbersDigits.trim();

    if (letters.isEmpty || numbers.isEmpty) {
      if (_foundSticker != null || _errorMessage != null) {
        setState(() {
          _foundSticker = null;
          _errorMessage = null;
        });
      }
      return;
    }

    final l10n = AppLocalizations.of(context);
    final sticker = _findBestMatch(letters, numbers);

    setState(() {
      _foundSticker = sticker;
      _errorMessage = sticker == null ? l10n.lookupStickerNotFound : null;
    });
    if (sticker != null) HapticFeedback.lightImpact();
  }

  /// Búsqueda manual (submit/botón): igual pero quita el foco.
  void _search() {
    FocusScope.of(context).unfocus();
    _autoSearch();
  }

  void _clearFields() {
    _lettersCtrl.clear();
    // Limpia dígitos pero mantiene el centinela si el campo tiene foco
    _numbersCtrl.value = _numbersFocus.hasFocus
        ? TextEditingValue(
            text: _sentinel,
            selection: const TextSelection.collapsed(offset: 1),
          )
        : TextEditingValue.empty;
    setState(() {
      _errorMessage = null;
      _foundSticker = null;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _lettersFocus.requestFocus();
    });
  }

  InputDecoration _boxDecoration({required String hint}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(
        color: Colors.white24,
        fontSize: 26,
        fontWeight: FontWeight.bold,
        letterSpacing: 12,
      ),
      filled: true,
      fillColor: const Color(0xFF1E1E1E),
      counterText: '',
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.white24, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.amber, width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Dos inputs: letras [ARG] + números [17]
            Row(
              key: tutorialLookupSearchFieldKey,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Campo letras (3 chars)
                SizedBox(
                  width: 136,
                  height: 72,
                  child: TextField(
                    controller: _lettersCtrl,
                    focusNode: _lettersFocus,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 10,
                    ),
                    textCapitalization: TextCapitalization.characters,
                    keyboardType: TextInputType.text,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(3),
                      FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z]')),
                      _UpperCaseFormatter(),
                    ],
                    onChanged: (value) {
                      if (value.length == 3) _numbersFocus.requestFocus();
                      _autoSearch();
                    },
                    onSubmitted: (_) => _search(),
                    decoration: _boxDecoration(hint: 'ARG'),
                  ),
                ),

                const SizedBox(width: 20),

                // Campo números (2 chars)
                SizedBox(
                  width: 100,
                  height: 72,
                  child: TextField(
                    controller: _numbersCtrl,
                    focusNode: _numbersFocus,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 10,
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      // 1 centinela + 2 dígitos = 3
                      LengthLimitingTextInputFormatter(3),
                      FilteringTextInputFormatter.allow(RegExp(r'[\u200b\d]')),
                    ],
                    onChanged: (value) {
                      if (!value.startsWith(_sentinel)) {
                        // El centinela fue borrado: backspace en campo vacío
                        if (_lettersCtrl.text.isNotEmpty) {
                          final t = _lettersCtrl.text;
                          _lettersCtrl.value = TextEditingValue(
                            text: t.substring(0, t.length - 1),
                            selection: TextSelection.collapsed(
                              offset: t.length - 1,
                            ),
                          );
                        }
                        _lettersFocus.requestFocus();
                        return;
                      }
                      _autoSearch();
                    },
                    onSubmitted: (_) => _search(),
                    decoration: _boxDecoration(hint: '17'),
                  ),
                ),

                const SizedBox(width: 12),

                // Botón limpiar
                SizedBox(
                  key: tutorialLookupSearchButtonKey,
                  width: 48,
                  height: 72,
                  child: Material(
                    color: const Color(0xFF1E1E1E),
                    borderRadius: BorderRadius.circular(12),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: _clearFields,
                      child: const Icon(
                        Icons.backspace_outlined,
                        color: Colors.white38,
                        size: 22,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Mensaje de error
            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.redAccent, fontSize: 14),
                ),
              ),

            // Resultado inline
            if (_foundSticker != null)
              _InlineStickerCard(sticker: _foundSticker!, l10n: l10n),
          ],
        ),
      ),
    );
  }
}

// ─── Tarjeta de resultado inline ──────────────────────────────────────────────

class _InlineStickerCard extends ConsumerWidget {
  const _InlineStickerCard({required this.sticker, required this.l10n});

  final Sticker sticker;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inventoryAsync = ref.watch(inventoryProvider);
    final stickerInventory =
        inventoryAsync.asData?.value[sticker.id] ?? const {};
    final totalQty = stickerInventory.values.fold(0, (sum, q) => sum + q);
    final stickerLabel = '${sticker.categoryId} ${sticker.stickerCode}';

    // Colores del chip de estado
    final Color statusColor;
    final String statusLabel;
    final IconData statusIcon;
    if (totalQty == 0) {
      statusColor = Colors.redAccent;
      statusLabel = l10n.lookupStatusMissing;
      statusIcon = Icons.search_off_rounded;
    } else if (totalQty == 1) {
      statusColor = Colors.green;
      statusLabel = l10n.lookupStatusCollected;
      statusIcon = Icons.check_circle_outline_rounded;
    } else {
      statusColor = Colors.blue.shade300;
      statusLabel = l10n.lookupStatusDuplicates(totalQty - 1);
      statusIcon = Icons.content_copy_rounded;
    }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: Container(
        key: ValueKey(sticker.id),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white12),
        ),
        child: Column(
          children: [
            // Código
            Text(
              stickerLabel,
              style: const TextStyle(
                color: Colors.amber,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),

            // Descripción
            if (sticker.description != null && sticker.description!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  sticker.description!,
                  style: const TextStyle(color: Colors.white60, fontSize: 14),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

            const SizedBox(height: 24),

            // Chip de estado
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
              decoration: BoxDecoration(
                color: statusColor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(40),
                border: Border.all(
                  color: statusColor.withValues(alpha: 0.4),
                  width: 1.5,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(statusIcon, color: statusColor, size: 22),
                  const SizedBox(width: 10),
                  Text(
                    statusLabel,
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // Controles +/-
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _CircleBtn(
                  icon: Icons.remove_rounded,
                  color: totalQty > 0 ? Colors.redAccent : Colors.grey.shade700,
                  enabled: totalQty > 0,
                  onTap: () {
                    HapticFeedback.lightImpact();
                    ref
                        .read(inventoryProvider.notifier)
                        .updateVariantQuantity(sticker.id, 'normal', -1);
                  },
                ),
                const SizedBox(width: 32),
                Text(
                  '$totalQty',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 32),
                _CircleBtn(
                  icon: Icons.add_rounded,
                  color: Colors.amber,
                  enabled: true,
                  onTap: () {
                    HapticFeedback.lightImpact();
                    ref
                        .read(inventoryProvider.notifier)
                        .updateVariantQuantity(sticker.id, 'normal', 1);
                  },
                ),
              ],
            ),

            const SizedBox(height: 8),
            Text(
              l10n.lookupQtyLabel,
              style: const TextStyle(color: Colors.white38, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

class _CircleBtn extends StatelessWidget {
  const _CircleBtn({
    required this.icon,
    required this.color,
    required this.enabled,
    required this.onTap,
  });

  final IconData icon;
  final Color color;
  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withValues(alpha: enabled ? 0.15 : 0.06),
          border: Border.all(
            color: color.withValues(alpha: enabled ? 0.5 : 0.2),
            width: 1.5,
          ),
        ),
        child: Icon(
          icon,
          color: enabled ? color : Colors.grey.shade700,
          size: 30,
        ),
      ),
    );
  }
}

// ─── Formatter ────────────────────────────────────────────────────────────────

class _UpperCaseFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return newValue.copyWith(text: newValue.text.toUpperCase());
  }
}

// ─── Pestaña: Escáner de consulta ─────────────────────────────────────────────
/// Escanea un único sticker y muestra el resultado en un bottom sheet
/// con la misma información que el buscador manual.

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
          if (widget.findSticker(raw) != null) codesInFrame.add(raw);
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
          HapticFeedback.mediumImpact();
          _showStickerSheet(sticker);
          return;
        }
      }
    } catch (_) {}
  }

  void _showStickerSheet(Sticker sticker) {
    _sheetOpen = true;
    _cameraController?.stopImageStream();

    final l10n = AppLocalizations.of(context);
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => Container(
        decoration: const BoxDecoration(
          color: Color(0xFF1A1A1A),
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.grey.shade700,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            _InlineStickerCard(sticker: sticker, l10n: l10n),
            const SizedBox(height: 8),
          ],
        ),
      ),
    ).whenComplete(() {
      _sheetOpen = false;
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
        // Cámara a pantalla completa
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

        // Marco de apuntado
        Center(
          child: Container(
            width: 220,
            height: 280,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.amber, width: 2.5),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),

        // Hint
        Positioned(
          bottom: 40,
          left: 0,
          right: 0,
          child: Text(
            l10n.lookupScannerHint,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              shadows: [Shadow(color: Colors.black, blurRadius: 10)],
            ),
          ),
        ),
      ],
    );
  }
}
