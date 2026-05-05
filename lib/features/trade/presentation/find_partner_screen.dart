// Archivo: lib/features/trade/presentation/find_partner_screen.dart

import 'package:album_26_sticker_collector/features/trade/data/trade_provider.dart';
import 'package:album_26_sticker_collector/features/trade/domain/trade_partner.dart';
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';
import 'package:album_26_sticker_collector/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class FindPartnerScreen extends ConsumerStatefulWidget {
  const FindPartnerScreen({super.key});

  @override
  ConsumerState<FindPartnerScreen> createState() => _FindPartnerScreenState();
}

class _FindPartnerScreenState extends ConsumerState<FindPartnerScreen>
    with SingleTickerProviderStateMixin {
  final _codeController = TextEditingController();
  late final TabController _tabController;

  TradePartner? _foundPartner;
  bool _isSearching = false;
  bool _isCreatingSession = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _codeController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _searchByCode(String code) async {
    final l10n = AppLocalizations.of(context);
    if (code.trim().length != 6) {
      setState(() => _errorMessage = l10n.tradeErrorCodeLength);
      return;
    }

    final myId = supabase.auth.currentUser?.id;
    if (myId == null) {
      setState(() => _errorMessage = l10n.tradeErrorNotLoggedIn);
      return;
    }

    // Verificar que no sea el propio código
    final myCode = await ref.read(myTradeCodeProvider.future);
    if (code.trim() == myCode) {
      setState(() => _errorMessage = l10n.tradeErrorSelf);
      return;
    }

    setState(() {
      _isSearching = true;
      _foundPartner = null;
      _errorMessage = null;
    });

    try {
      final partner = await ref
          .read(tradeActionsProvider.notifier)
          .findUserByCode(code.trim());

      if (!mounted) return;

      if (partner == null) {
        setState(() => _errorMessage = l10n.tradeErrorCodeNotFound);
      } else if (partner.userId == myId) {
        setState(() => _errorMessage = l10n.tradeErrorSelf);
      } else {
        setState(() => _foundPartner = partner);
      }
    } catch (e) {
      if (mounted) {
        setState(
          () => _errorMessage = AppLocalizations.of(context).tradeErrorGeneric,
        );
      }
    } finally {
      if (mounted) setState(() => _isSearching = false);
    }
  }

  Future<void> _sendRequest(TradePartner partner) async {
    setState(() {
      _isCreatingSession = true;
      _errorMessage = null;
    });

    try {
      await ref
          .read(tradeActionsProvider.notifier)
          .initiateSession(partner.userId);

      if (!mounted) return;

      final l10n = AppLocalizations.of(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            l10n.tradeFindRequestSent(partner.displayName),
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );

      // Volver al hub
      Navigator.pop(context);
    } catch (e) {
      if (mounted) {
        setState(
          () => _errorMessage = AppLocalizations.of(context).tradeErrorGeneric,
        );
      }
    } finally {
      if (mounted) setState(() => _isCreatingSession = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: Text(
          l10n.tradeFindTitle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.amber),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.amber,
          labelColor: Colors.amber,
          unselectedLabelColor: Colors.white38,
          tabs: [
            Tab(
              icon: const Icon(Icons.keyboard_rounded),
              text: l10n.tradeFindCodeTab,
            ),
            Tab(
              icon: const Icon(Icons.qr_code_scanner_rounded),
              text: l10n.tradeFindScanTab,
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _ManualCodeTab(
            controller: _codeController,
            isSearching: _isSearching,
            isCreatingSession: _isCreatingSession,
            foundPartner: _foundPartner,
            errorMessage: _errorMessage,
            onSearch: _searchByCode,
            onSendRequest: _sendRequest,
          ),
          _QrScanTab(
            onCodeDetected: (code) {
              _tabController.animateTo(0);
              _codeController.text = code;
              _searchByCode(code);
            },
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Tab: Código manual
// ─────────────────────────────────────────────────────────────────────────────

class _ManualCodeTab extends StatelessWidget {
  final TextEditingController controller;
  final bool isSearching;
  final bool isCreatingSession;
  final TradePartner? foundPartner;
  final String? errorMessage;
  final ValueChanged<String> onSearch;
  final ValueChanged<TradePartner> onSendRequest;

  const _ManualCodeTab({
    required this.controller,
    required this.isSearching,
    required this.isCreatingSession,
    required this.foundPartner,
    required this.errorMessage,
    required this.onSearch,
    required this.onSendRequest,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          // Ilustración
          const Icon(
            Icons.swap_horiz_rounded,
            color: Colors.amber,
            size: 64,
          ).animate().fadeIn(duration: 400.ms).scaleXY(begin: 0.8, end: 1.0),

          const SizedBox(height: 16),
          Builder(
            builder: (ctx) {
              final l10n = AppLocalizations.of(ctx);
              return Column(
                children: [
                  Text(
                    l10n.tradeFindInstruction,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ).animate().fadeIn(delay: 100.ms),
                  const SizedBox(height: 8),
                  Text(
                    l10n.tradeFindHint,
                    style: const TextStyle(color: Colors.white54, fontSize: 13),
                    textAlign: TextAlign.center,
                  ).animate().fadeIn(delay: 150.ms),
                ],
              );
            },
          ),

          const SizedBox(height: 32),

          // Input de código
          TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            maxLength: 6,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: 8,
            ),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              counterText: '',
              hintText: '000000',
              hintStyle: TextStyle(
                color: Colors.white24,
                fontSize: 28,
                letterSpacing: 8,
              ),
              filled: true,
              fillColor: const Color(0xFF1E1E1E),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Colors.amber, width: 1.5),
              ),
              prefixIcon: const Icon(Icons.tag_rounded, color: Colors.amber),
            ),
            onSubmitted: onSearch,
          ).animate().fadeIn(delay: 200.ms),

          const SizedBox(height: 16),

          // Botón buscar
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            icon: isSearching
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.black,
                    ),
                  )
                : const Icon(Icons.search_rounded),
            label: Builder(
              builder: (ctx) {
                final l10n = AppLocalizations.of(ctx);
                return Text(
                  isSearching
                      ? l10n.tradeFindSearching
                      : l10n.tradeFindSearchBtn,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                );
              },
            ),
            onPressed: isSearching ? null : () => onSearch(controller.text),
          ).animate().fadeIn(delay: 250.ms),

          // Error
          if (errorMessage != null) ...[
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.red.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.red.withValues(alpha: 0.3)),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: Colors.redAccent,
                    size: 18,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      errorMessage!,
                      style: const TextStyle(
                        color: Colors.redAccent,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],

          // Resultado encontrado
          if (foundPartner != null) ...[
            const SizedBox(height: 20),
            _PartnerFoundCard(
              partner: foundPartner!,
              isCreating: isCreatingSession,
              onSend: () => onSendRequest(foundPartner!),
            ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.15, end: 0),
          ],
        ],
      ),
    );
  }
}

class _PartnerFoundCard extends StatelessWidget {
  final TradePartner partner;
  final bool isCreating;
  final VoidCallback onSend;

  const _PartnerFoundCard({
    required this.partner,
    required this.isCreating,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.green.withValues(alpha: 0.5),
          width: 1.5,
        ),
      ),
      child: Column(
        children: [
          const Icon(Icons.person_rounded, color: Colors.green, size: 40),
          const SizedBox(height: 8),
          Builder(
            builder: (ctx) => Text(
              AppLocalizations.of(ctx).tradeFindPartnerFound,
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            partner.displayName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Builder(
            builder: (ctx) => Text(
              AppLocalizations.of(ctx).tradeFindPartnerCode(partner.tradeCode),
              style: const TextStyle(color: Colors.white38, fontSize: 12),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 13),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: isCreating
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Icon(Icons.send_rounded),
              label: Builder(
                builder: (ctx) {
                  final l10n = AppLocalizations.of(ctx);
                  return Text(
                    isCreating ? l10n.tradeFindSending : l10n.tradeFindSendBtn,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  );
                },
              ),
              onPressed: isCreating ? null : onSend,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Tab: Escanear QR
// ─────────────────────────────────────────────────────────────────────────────

class _QrScanTab extends StatefulWidget {
  final ValueChanged<String> onCodeDetected;

  const _QrScanTab({required this.onCodeDetected});

  @override
  State<_QrScanTab> createState() => _QrScanTabState();
}

class _QrScanTabState extends State<_QrScanTab> {
  final MobileScannerController _controller = MobileScannerController();
  bool _scanned = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Cámara
        MobileScanner(
          controller: _controller,
          onDetect: (capture) {
            if (_scanned) return;
            final barcode = capture.barcodes.firstOrNull;
            final raw = barcode?.rawValue;
            if (raw != null && raw.length == 6 && int.tryParse(raw) != null) {
              setState(() => _scanned = true);
              HapticFeedback.heavyImpact();
              widget.onCodeDetected(raw);
            }
          },
        ),

        // Overlay
        IgnorePointer(
          child: CustomPaint(
            painter: _ScanOverlayPainter(),
            child: const SizedBox.expand(),
          ),
        ),

        // Instrucción
        Positioned(
          bottom: 40,
          left: 24,
          right: 24,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Builder(
              builder: (ctx) => Text(
                AppLocalizations.of(ctx).tradeFindScanHint,
                style: const TextStyle(color: Colors.white, fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ScanOverlayPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black.withValues(alpha: 0.55);
    final scanSize = size.width * 0.65;
    final left = (size.width - scanSize) / 2;
    final top = (size.height - scanSize) / 2.5;
    final scanRect = Rect.fromLTWH(left, top, scanSize, scanSize);

    // Oscurecer todo excepto el área de escaneo
    final path = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
      ..addRRect(RRect.fromRectAndRadius(scanRect, const Radius.circular(16)))
      ..fillType = PathFillType.evenOdd;

    canvas.drawPath(path, paint);

    // Borde del área de escaneo
    final borderPaint = Paint()
      ..color = Colors.amber
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawRRect(
      RRect.fromRectAndRadius(scanRect, const Radius.circular(16)),
      borderPaint,
    );

    // Esquinas decorativas
    const cornerLen = 24.0;
    final cornerPaint = Paint()
      ..color = Colors.amber
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    // Esquina superior izquierda
    canvas.drawLine(
      Offset(left, top + cornerLen),
      Offset(left, top),
      cornerPaint,
    );
    canvas.drawLine(
      Offset(left, top),
      Offset(left + cornerLen, top),
      cornerPaint,
    );

    // Esquina superior derecha
    canvas.drawLine(
      Offset(left + scanSize - cornerLen, top),
      Offset(left + scanSize, top),
      cornerPaint,
    );
    canvas.drawLine(
      Offset(left + scanSize, top),
      Offset(left + scanSize, top + cornerLen),
      cornerPaint,
    );

    // Esquina inferior izquierda
    canvas.drawLine(
      Offset(left, top + scanSize - cornerLen),
      Offset(left, top + scanSize),
      cornerPaint,
    );
    canvas.drawLine(
      Offset(left, top + scanSize),
      Offset(left + cornerLen, top + scanSize),
      cornerPaint,
    );

    // Esquina inferior derecha
    canvas.drawLine(
      Offset(left + scanSize - cornerLen, top + scanSize),
      Offset(left + scanSize, top + scanSize),
      cornerPaint,
    );
    canvas.drawLine(
      Offset(left + scanSize, top + scanSize - cornerLen),
      Offset(left + scanSize, top + scanSize),
      cornerPaint,
    );
  }

  @override
  bool shouldRepaint(_) => false;
}
