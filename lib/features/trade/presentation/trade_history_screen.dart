// Archivo: lib/features/trade/presentation/trade_history_screen.dart

import 'package:album_26_sticker_collector/features/trade/data/trade_provider.dart';
import 'package:album_26_sticker_collector/features/trade/domain/trade_session.dart';
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';
import 'package:album_26_sticker_collector/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class TradeHistoryScreen extends ConsumerWidget {
  const TradeHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final historyAsync = ref.watch(tradeHistoryProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: Text(
          l10n.tradeHistoryTitle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.amber),
      ),
      body: historyAsync.when(
        loading: () =>
            const Center(child: CircularProgressIndicator(color: Colors.amber)),
        error: (e, _) => Center(
          child: Text(
            l10n.tradeErrorGeneric,
            style: const TextStyle(color: Colors.redAccent),
          ),
        ),
        data: (sessions) {
          if (sessions.isEmpty) {
            return _EmptyHistory();
          }
          return _HistoryList(sessions: sessions);
        },
      ),
    );
  }
}

class _EmptyHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.history_rounded, color: Colors.white12, size: 72),
          const SizedBox(height: 16),
          Text(
            l10n.tradeHistoryEmpty,
            style: const TextStyle(
              color: Colors.white38,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.tradeHistoryEmptyDesc,
            style: const TextStyle(color: Colors.white24, fontSize: 13),
            textAlign: TextAlign.center,
          ),
        ],
      ).animate().fadeIn(duration: 500.ms),
    );
  }
}

class _HistoryList extends ConsumerWidget {
  final List<TradeSession> sessions;

  const _HistoryList({required this.sessions});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myId = supabase.auth.currentUser?.id ?? '';

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      itemCount: sessions.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final session = sessions[index];
        return _HistoryTile(session: session, myId: myId, ref: ref)
            .animate()
            .fadeIn(delay: (index * 40).ms, duration: 350.ms)
            .slideX(begin: -0.08, end: 0);
      },
    );
  }
}

class _HistoryTile extends ConsumerWidget {
  final TradeSession session;
  final String myId;
  final WidgetRef ref;

  const _HistoryTile({
    required this.session,
    required this.myId,
    required this.ref,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final offersAsync = ref.watch(tradeOffersProvider(session.id));
    final isInitiator = session.initiatorId == myId;
    final dateFormatter = DateFormat('dd/MM/yyyy HH:mm');

    final (statusIcon, statusColor, statusLabel) = _statusInfo(
      session.status,
      l10n,
    );

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: statusColor.withValues(alpha: 0.2), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(statusIcon, color: statusColor, size: 18),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      statusLabel,
                      style: TextStyle(
                        color: statusColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      dateFormatter.format(session.updatedAt.toLocal()),
                      style: const TextStyle(
                        color: Colors.white38,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  isInitiator
                      ? l10n.tradeHistoryStartedByMe
                      : l10n.tradeHistoryReceivedRequest,
                  style: const TextStyle(color: Colors.white54, fontSize: 10),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),
          const Divider(color: Color(0xFF2A2A2A), height: 1),
          const SizedBox(height: 12),

          // Estadísticas de ofertas
          offersAsync.when(
            loading: () => const SizedBox(
              height: 20,
              child: LinearProgressIndicator(
                color: Colors.amber,
                backgroundColor: Color(0xFF2A2A2A),
              ),
            ),
            error: (_, __) => const SizedBox.shrink(),
            data: (offers) {
              final myOffers = offers
                  .where((o) => o.offererId == myId)
                  .toList();
              final partnerOffers = offers
                  .where((o) => o.offererId != myId)
                  .toList();
              final myDelivered = myOffers.where((o) => o.delivered).length;
              final partnerDelivered = partnerOffers
                  .where((o) => o.delivered)
                  .length;

              return Row(
                children: [
                  _OfferStat(
                    label: l10n.tradeHistorySent,
                    count: myOffers.length,
                    delivered: myDelivered,
                    color: Colors.amber,
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    '⇄',
                    style: TextStyle(color: Colors.white24, fontSize: 18),
                  ),
                  const SizedBox(width: 12),
                  _OfferStat(
                    label: l10n.tradeHistoryReceivedLabel,
                    count: partnerOffers.length,
                    delivered: partnerDelivered,
                    color: Colors.green,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  (IconData, Color, String) _statusInfo(String status, AppLocalizations l10n) {
    switch (status) {
      case 'completed':
        return (
          Icons.check_circle_rounded,
          Colors.green,
          l10n.tradeHistoryCompleted,
        );
      case 'cancelled':
        return (
          Icons.cancel_rounded,
          Colors.red.shade300,
          l10n.tradeHistoryCancelled,
        );
      default:
        return (Icons.info_outline, Colors.white38, status);
    }
  }
}

class _OfferStat extends StatelessWidget {
  final String label;
  final int count;
  final int delivered;
  final Color color;

  const _OfferStat({
    required this.label,
    required this.count,
    required this.delivered,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 11,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.3,
              ),
            ),
            const SizedBox(height: 4),
            Builder(
              builder: (ctx) => Text(
                AppLocalizations.of(ctx).tradeHistoryStickerCount(count),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (delivered > 0)
              Builder(
                builder: (ctx) => Text(
                  AppLocalizations.of(ctx).tradeHistoryDelivered(delivered),
                  style: TextStyle(
                    color: color.withValues(alpha: 0.7),
                    fontSize: 11,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
