// Archivo: lib/features/trade/presentation/trade_hub_screen.dart

import 'package:album_26_sticker_collector/features/trade/data/trade_provider.dart';
import 'package:album_26_sticker_collector/features/trade/domain/trade_session.dart';
import 'package:album_26_sticker_collector/features/trade/presentation/find_partner_screen.dart';
import 'package:album_26_sticker_collector/features/trade/presentation/trade_delivery_screen.dart';
import 'package:album_26_sticker_collector/features/trade/presentation/trade_history_screen.dart';
import 'package:album_26_sticker_collector/features/trade/presentation/trade_negotiation_screen.dart';
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';
import 'package:album_26_sticker_collector/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TradeHubScreen extends ConsumerWidget {
  const TradeHubScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final myId = supabase.auth.currentUser?.id;
    final codeAsync = ref.watch(myTradeCodeProvider);
    final sessionsAsync = ref.watch(activeTradeSessionsProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: Text(
          l10n.tradeHubTitle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.amber),
        actions: [
          IconButton(
            icon: const Icon(Icons.history_rounded, color: Colors.amber),
            tooltip: l10n.tradeHubHistory,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const TradeHistoryScreen()),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _QrCard(codeAsync: codeAsync)
                .animate()
                .fadeIn(duration: 500.ms)
                .scaleXY(begin: 0.9, end: 1.0, curve: Curves.easeOutBack),

            const SizedBox(height: 20),

            // Botón siempre visible para iniciar nuevo intercambio
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.amber,
                side: const BorderSide(color: Colors.amber, width: 1.5),
                padding: const EdgeInsets.symmetric(vertical: 13),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              icon: const Icon(Icons.add_rounded),
              label: Text(
                l10n.tradeHubStartBtn,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const FindPartnerScreen()),
              ),
            ),

            const SizedBox(height: 28),

            sessionsAsync.when(
              loading: () => const _LoadingCard(),
              error: (e, _) => _ErrorCard(message: l10n.tradeErrorGeneric),
              data: (sessions) {
                if (sessions.isEmpty) {
                  return _EmptySessionsHint()
                      .animate()
                      .fadeIn(delay: 200.ms, duration: 400.ms)
                      .slideY(begin: 0.1, end: 0);
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header: "Intercambios activos (N)"
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.swap_horiz_rounded,
                            color: Colors.amber,
                            size: 16,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            l10n.tradeHubActiveLabel,
                            style: const TextStyle(
                              color: Colors.white54,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.3,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 1,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.amber.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              '${sessions.length}',
                              style: const TextStyle(
                                color: Colors.amber,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ...sessions.asMap().entries.map((entry) {
                      final i = entry.key;
                      final session = entry.value;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child:
                            _ActiveTradeCard(
                                  session: session,
                                  myId: myId ?? '',
                                  ref: ref,
                                )
                                .animate()
                                .fadeIn(delay: (i * 80).ms, duration: 350.ms)
                                .slideY(begin: 0.1, end: 0),
                      );
                    }),
                  ],
                );
              },
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Widgets internos
// ─────────────────────────────────────────────────────────────────────────────

class _QrCard extends ConsumerWidget {
  final AsyncValue<String> codeAsync;
  const _QrCard({required this.codeAsync});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.amber.shade700, Colors.amber.shade900],
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.amber.withValues(alpha: 0.35),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: codeAsync.when(
        loading: () => const SizedBox(
          height: 200,
          child: Center(child: CircularProgressIndicator(color: Colors.black)),
        ),
        error: (e, _) => Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            l10n.tradeErrorNotLoggedIn,
            style: const TextStyle(color: Colors.black87, fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ),
        data: (code) => Column(
          children: [
            Text(
              l10n.tradeHubMyCode,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 13,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 16),
            // QR code
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(12),
              child: QrImageView(
                data: code,
                version: QrVersions.auto,
                size: 180,
                backgroundColor: Colors.white,
                eyeStyle: const QrEyeStyle(
                  eyeShape: QrEyeShape.square,
                  color: Colors.black,
                ),
                dataModuleStyle: const QrDataModuleStyle(
                  dataModuleShape: QrDataModuleShape.square,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Código en texto grande
            GestureDetector(
              onTap: () {
                Clipboard.setData(ClipboardData(text: code));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      l10n.tradeHubCodeCopied,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    backgroundColor: Colors.amber,
                    behavior: SnackBarBehavior.floating,
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    code,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 8,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.copy_rounded,
                    color: Colors.black54,
                    size: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            Text(
              l10n.tradeHubShareHint,
              style: const TextStyle(color: Colors.black54, fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptySessionsHint extends StatelessWidget {
  const _EmptySessionsHint();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.swap_horiz_rounded, color: Colors.white24, size: 32),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.tradeHubNoActive,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  l10n.tradeHubNoActiveDesc,
                  style: const TextStyle(color: Colors.white38, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ActiveTradeCard extends StatelessWidget {
  final TradeSession session;
  final String myId;
  final WidgetRef ref;

  const _ActiveTradeCard({
    required this.session,
    required this.myId,
    required this.ref,
  });

  @override
  Widget build(BuildContext context) {
    final isInitiator = session.initiatorId == myId;

    // Solicitud ENTRANTE: el receptor debe aceptar o rechazar
    if (session.isPendingAcceptance && !isInitiator) {
      return _IncomingRequestCard(
        session: session,
        ref: ref,
      ).animate().fadeIn(delay: 150.ms).slideY(begin: 0.1, end: 0);
    }

    // Solicitud SALIENTE: el iniciador espera respuesta
    if (session.isPendingAcceptance && isInitiator) {
      return _OutgoingRequestCard(
        session: session,
        ref: ref,
      ).animate().fadeIn(delay: 150.ms).slideY(begin: 0.1, end: 0);
    }

    // Estado activo → tappable, navega a selección de cromos
    return _ActiveSessionTile(
      session: session,
      myId: myId,
    ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1, end: 0);
  }
}
// ─────────────────────────────────────────────────────────────────────────────
// Tile tappable para sesiones activas (no pending)
// ─────────────────────────────────────────────────────────────────────────────

class _ActiveSessionTile extends StatelessWidget {
  final TradeSession session;
  final String myId;

  const _ActiveSessionTile({required this.session, required this.myId});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final (icon, color, label) = _statusInfo(l10n);
    final dateStr = DateFormat(
      'dd/MM HH:mm',
    ).format(session.createdAt.toLocal());

    return GestureDetector(
      onTap: () {
        if (session.isReserved) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => TradeDeliveryScreen(session: session),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => TradeNegotiationScreen(session: session),
            ),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: color.withValues(alpha: 0.25), width: 1),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 22),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      color: color,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    dateStr,
                    style: const TextStyle(color: Colors.white38, fontSize: 11),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: Colors.amber,
              size: 22,
            ),
          ],
        ),
      ),
    );
  }

  (IconData, Color, String) _statusInfo(AppLocalizations l10n) {
    final isInitiator = session.initiatorId == myId;
    switch (session.status) {
      case 'selecting':
        return (
          Icons.checklist_rounded,
          Colors.blue,
          l10n.tradeStatusSelecting,
        );
      case 'initiator_confirmed':
        if (isInitiator) {
          return (
            Icons.check_circle_rounded,
            Colors.green,
            l10n.tradeStatusMyConfirmed,
          );
        }
        return (
          Icons.pending_rounded,
          Colors.amber,
          l10n.tradeStatusOtherConfirmed,
        );
      case 'receiver_confirmed':
        if (!isInitiator) {
          return (
            Icons.check_circle_rounded,
            Colors.green,
            l10n.tradeStatusMyConfirmed,
          );
        }
        return (
          Icons.pending_rounded,
          Colors.amber,
          l10n.tradeStatusOtherConfirmed,
        );
      case 'reserved':
        return (
          Icons.lock_rounded,
          Colors.purple,
          l10n.tradeStatusReservedLabel,
        );
      default:
        return (Icons.info_outline, Colors.white38, session.status);
    }
  }
}

class _CancelButton extends StatelessWidget {
  final String sessionId;
  final WidgetRef ref;

  const _CancelButton({required this.sessionId, required this.ref});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return TextButton.icon(
      style: TextButton.styleFrom(foregroundColor: Colors.red.shade300),
      icon: const Icon(Icons.cancel_outlined, size: 18),
      label: Text(l10n.tradeHubCancel),
      onPressed: () async {
        final confirm = await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            backgroundColor: const Color(0xFF1E1E1E),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Text(
              l10n.tradeHubCancelTitle,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(
              l10n.tradeHubCancelMsg,
              style: const TextStyle(color: Colors.white70),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: Text(
                  l10n.commonCancel,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () => Navigator.pop(ctx, true),
                child: Text(l10n.tradeHubCancelYes),
              ),
            ],
          ),
        );

        if (confirm == true) {
          await ref
              .read(tradeActionsProvider.notifier)
              .cancelSession(sessionId);
        }
      },
    );
  }
}

class _LoadingCard extends StatelessWidget {
  const _LoadingCard();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 120,
      child: Center(child: CircularProgressIndicator(color: Colors.amber)),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────────
// Solicitud entrante — Receiver
// ─────────────────────────────────────────────────────────────────────────────────

class _IncomingRequestCard extends StatelessWidget {
  final TradeSession session;
  final WidgetRef ref;

  const _IncomingRequestCard({required this.session, required this.ref});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.amber.shade700, Colors.orange.shade700],
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.amber.withValues(alpha: 0.4),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                    Icons.notifications_active_rounded,
                    color: Colors.black87,
                    size: 26,
                  )
                  .animate(onPlay: (c) => c.repeat())
                  .shake(duration: 700.ms, hz: 3)
                  .then(delay: 2500.ms),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.tradeStatusIncoming,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      l10n.tradeStatusIncomingDesc,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87,
                    foregroundColor: Colors.amber,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.check_circle_rounded, size: 16),
                  label: Text(
                    l10n.tradeAcceptBtn,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  onPressed: () async {
                    try {
                      await ref
                          .read(tradeActionsProvider.notifier)
                          .acceptSession(session.id);
                    } catch (_) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              l10n.tradeErrorGeneric,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            backgroundColor: Colors.red.shade900,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      }
                    }
                  },
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black87,
                    side: const BorderSide(color: Colors.black38, width: 1.5),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.cancel_rounded, size: 16),
                  label: Text(
                    l10n.tradeRejectBtn,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  onPressed: () async {
                    try {
                      await ref
                          .read(tradeActionsProvider.notifier)
                          .rejectSession(session.id);
                    } catch (_) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              l10n.tradeErrorGeneric,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            backgroundColor: Colors.red.shade900,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────────
// Solicitud saliente — Initiator
// ─────────────────────────────────────────────────────────────────────────────────

class _OutgoingRequestCard extends StatelessWidget {
  final TradeSession session;
  final WidgetRef ref;

  const _OutgoingRequestCard({required this.session, required this.ref});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.orange.withValues(alpha: 0.4),
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          const Icon(
                Icons.hourglass_empty_rounded,
                color: Colors.orange,
                size: 28,
              )
              .animate(onPlay: (c) => c.repeat())
              .rotate(duration: 1400.ms, begin: 0, end: 0.5)
              .then()
              .rotate(duration: 1400.ms, begin: 0.5, end: 1.0),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.tradeStatusPending,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  l10n.tradeStatusPendingDesc,
                  style: const TextStyle(color: Colors.white38, fontSize: 11),
                ),
              ],
            ),
          ),
          _CancelButton(sessionId: session.id, ref: ref),
        ],
      ),
    );
  }
}

class _ErrorCard extends StatelessWidget {
  final String message;
  const _ErrorCard({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(message, style: const TextStyle(color: Colors.redAccent)),
    );
  }
}
