// Archivo: lib/features/trade/presentation/trade_delivery_screen.dart
//
// Pantalla de confirmación de recepción física de cromos.
// El usuario marca cuáles de los cromos que IBA A RECIBIR realmente recibió.
// Los marcados se añaden a su inventario.
// Los no marcados se devuelven al inventario del otro usuario (vía lógica de negocio).

import 'package:album_26_sticker_collector/features/catalog/data/categories_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/data/stickers_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/domain/sticker.model.dart';
import 'package:album_26_sticker_collector/features/inventory/data/inventory_provider.dart';
import 'package:album_26_sticker_collector/features/trade/data/trade_provider.dart';
import 'package:album_26_sticker_collector/features/trade/domain/trade_offer.dart';
import 'package:album_26_sticker_collector/features/trade/domain/trade_session.dart';
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';
import 'package:album_26_sticker_collector/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TradeDeliveryScreen extends ConsumerStatefulWidget {
  final TradeSession session;

  const TradeDeliveryScreen({super.key, required this.session});

  @override
  ConsumerState<TradeDeliveryScreen> createState() =>
      _TradeDeliveryScreenState();
}

class _TradeDeliveryScreenState extends ConsumerState<TradeDeliveryScreen> {
  // IDs de trade_offers que el usuario confirma recibir
  Set<String> _receivedOfferIds = {};
  bool _isSaving = false;

  String get _myId => supabase.auth.currentUser?.id ?? '';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final myId = _myId;
    final offersAsync = ref.watch(tradeOffersProvider(widget.session.id));
    final allStickersAsync = ref.watch(allStickersProvider);
    final categoriesAsync = ref.watch(categoriesProvider);

    // Tiempo real: reaccionar si el otro usuario cancela el intercambio
    ref.listen(tradeSessionStreamProvider(widget.session.id), (prev, next) {
      final s = next.asData?.value;
      if (s == null || !mounted) return;
      if (s.status == 'cancelled') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              l10n.tradeHubCancelTitle,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.red.shade900,
            behavior: SnackBarBehavior.floating,
          ),
        );
        Navigator.of(context).popUntil((r) => r.isFirst);
      }
    });

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: Text(
          l10n.tradeDeliveryTitle,
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
            icon: const Icon(Icons.cancel_outlined, color: Colors.red),
            tooltip: l10n.tradeHubCancel,
            onPressed: () => _cancelSession(context, l10n),
          ),
        ],
      ),
      body: offersAsync.when(
        loading: () =>
            const Center(child: CircularProgressIndicator(color: Colors.amber)),
        error: (e, _) => Center(
          child: Text(
            l10n.tradeErrorGeneric,
            style: const TextStyle(color: Colors.red),
          ),
        ),
        data: (offers) {
          // Los cromos que YO voy a recibir son los que el OTRO usuario ofreció
          final incomingOffers = offers
              .where((o) => o.offererId != myId)
              .toList();

          return allStickersAsync.when(
            loading: () => const Center(
              child: CircularProgressIndicator(color: Colors.amber),
            ),
            error: (e, _) => const SizedBox.shrink(),
            data: (allStickers) {
              final stickerMap = {for (final s in allStickers) s.id: s};

              return Column(
                children: [
                  // Instrucción
                  Container(
                    width: double.infinity,
                    color: const Color(0xFF1E1E1E),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.purple.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(
                                Icons.move_to_inbox_rounded,
                                color: Colors.purple,
                                size: 22,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Builder(
                              builder: (ctx) => Expanded(
                                child: Text(
                                  AppLocalizations.of(
                                    ctx,
                                  ).tradeDeliveryInstruction,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Builder(
                          builder: (ctx) => Text(
                            AppLocalizations.of(ctx).tradeDeliveryDesc,
                            style: const TextStyle(
                              color: Colors.white54,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Lista de cromos entrantes
                  Expanded(
                    child: incomingOffers.isEmpty
                        ? Center(
                            child: Builder(
                              builder: (ctx) => Text(
                                AppLocalizations.of(ctx).tradeDeliveryNoOffer,
                                style: const TextStyle(
                                  color: Colors.white38,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          )
                        : _DeliveryList(
                            offers: incomingOffers,
                            stickerMap: stickerMap,
                            receivedIds: _receivedOfferIds,
                            categoriesAsync: categoriesAsync,
                            onToggle: (offerId) {
                              HapticFeedback.selectionClick();
                              setState(() {
                                if (_receivedOfferIds.contains(offerId)) {
                                  _receivedOfferIds.remove(offerId);
                                } else {
                                  _receivedOfferIds.add(offerId);
                                }
                              });
                            },
                          ),
                  ),

                  // Barra de confirmación
                  _DeliveryConfirmBar(
                    totalCount: incomingOffers.length,
                    receivedCount: _receivedOfferIds.length,
                    isSaving: _isSaving,
                    onConfirm: () => _confirmDelivery(incomingOffers),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _cancelSession(
    BuildContext context,
    AppLocalizations l10n,
  ) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) {
        final dl = AppLocalizations.of(ctx);
        return AlertDialog(
          backgroundColor: const Color(0xFF1E1E1E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            dl.tradeHubCancelTitle,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            dl.tradeHubCancelMsg,
            style: const TextStyle(color: Colors.white70),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: Text(
                dl.commonCancel,
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
              child: Text(dl.tradeHubCancelYes),
            ),
          ],
        );
      },
    );
    if (confirm == true && mounted) {
      await ref
          .read(tradeActionsProvider.notifier)
          .cancelSession(widget.session.id);
      if (mounted) Navigator.of(context).popUntil((r) => r.isFirst);
    }
  }

  Future<void> _confirmDelivery(List<TradeOffer> incomingOffers) async {
    final l10n = AppLocalizations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) {
        final dl = AppLocalizations.of(ctx);
        return AlertDialog(
          backgroundColor: const Color(0xFF1E1E1E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            dl.tradeDeliveryConfirmTitle,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            dl.tradeDeliveryConfirmMsg(
              _receivedOfferIds.length,
              incomingOffers.length - _receivedOfferIds.length,
            ),
            style: const TextStyle(color: Colors.white70, fontSize: 13),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: Text(
                dl.commonCancel,
                style: const TextStyle(color: Colors.grey),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () => Navigator.pop(ctx, true),
              child: Text(dl.tradeDeliveryConfirmTitle),
            ),
          ],
        );
      },
    );

    if (confirmed != true || !mounted) return;

    setState(() => _isSaving = true);

    try {
      final allOfferIds = incomingOffers.map((o) => o.id).toList();
      final deliveredIds = _receivedOfferIds.toList();

      // 1. Marcar como entregados en Supabase
      await ref
          .read(tradeActionsProvider.notifier)
          .confirmDelivery(widget.session.id, deliveredIds, allOfferIds);

      // 2. Actualizar mi inventario vía provider (offline-first)
      final inventoryNotifier = ref.read(inventoryProvider.notifier);
      final myId = _myId;

      // Sumar los cromos que confirmé haber recibido
      for (final offer in incomingOffers) {
        if (!_receivedOfferIds.contains(offer.id)) continue;
        await inventoryNotifier.updateVariantQuantity(
          offer.stickerId,
          'normal',
          offer.quantity,
        );
      }

      // Restar TODOS los cromos que yo entregué — ya los di físicamente,
      // independientemente de si el partner confirmó recepción.
      final allOffers =
          ref.read(tradeOffersProvider(widget.session.id)).asData?.value ?? [];
      final myOutgoing = allOffers.where((o) => o.offererId == myId).toList();

      for (final offer in myOutgoing) {
        await inventoryNotifier.updateVariantQuantity(
          offer.stickerId,
          'normal',
          -offer.quantity,
        );
      }

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            l10n.tradeDeliverySuccess(_receivedOfferIds.length),
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );

      // Volver a la pantalla principal
      Navigator.of(context).popUntil((r) => r.isFirst);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context).tradeErrorGeneric,
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
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Lista de cromos con checkbox
// ─────────────────────────────────────────────────────────────────────────────

class _DeliveryList extends StatelessWidget {
  final List<TradeOffer> offers;
  final Map<String, Sticker> stickerMap;
  final Set<String> receivedIds;
  final AsyncValue<List<dynamic>> categoriesAsync;
  final ValueChanged<String> onToggle;

  const _DeliveryList({
    required this.offers,
    required this.stickerMap,
    required this.receivedIds,
    required this.categoriesAsync,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final categoryMap = <String, dynamic>{};
    if (categoriesAsync.hasValue) {
      for (final c in categoriesAsync.value!) {
        categoryMap[c.id] = c;
      }
    }

    // Agrupar por categoría
    final Map<String, List<TradeOffer>> grouped = {};
    for (final offer in offers) {
      final sticker = stickerMap[offer.stickerId];
      final catId = sticker?.categoryId ?? 'unknown';
      grouped.putIfAbsent(catId, () => []).add(offer);
    }

    final sortedCats = grouped.keys.toList()
      ..sort((a, b) {
        final orderA = categoryMap[a]?.orderIndex ?? 999;
        final orderB = categoryMap[b]?.orderIndex ?? 999;
        return orderA.compareTo(orderB);
      });

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: sortedCats.length,
      itemBuilder: (context, index) {
        final catId = sortedCats[index];
        final cat = categoryMap[catId];
        final catOffers = grouped[catId]!;

        final receivedInCat = catOffers
            .where((o) => receivedIds.contains(o.id))
            .length;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Text(
                    cat?.emoji ?? '🏳️',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      cat?.name ?? catId,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    '$receivedInCat / ${catOffers.length}',
                    style: TextStyle(
                      color: receivedInCat == catOffers.length
                          ? Colors.green
                          : Colors.white54,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ...catOffers.map((offer) {
              final sticker = stickerMap[offer.stickerId];
              final isReceived = receivedIds.contains(offer.id);
              final label = sticker != null
                  ? '${sticker.categoryId} ${sticker.stickerCode}'
                  : offer.stickerId;

              return _DeliveryTile(
                label: label,
                offerId: offer.id,
                isReceived: isReceived,
                onToggle: onToggle,
              ).animate().fadeIn(delay: (index * 20).ms, duration: 250.ms);
            }),
            const SizedBox(height: 8),
          ],
        );
      },
    );
  }
}

class _DeliveryTile extends StatelessWidget {
  final String label;
  final String offerId;
  final bool isReceived;
  final ValueChanged<String> onToggle;

  const _DeliveryTile({
    required this.label,
    required this.offerId,
    required this.isReceived,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onToggle(offerId),
      child: AnimatedContainer(
        duration: 180.ms,
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isReceived
              ? Colors.green.withValues(alpha: 0.12)
              : const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isReceived
                ? Colors.green.withValues(alpha: 0.5)
                : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            AnimatedSwitcher(
              duration: 180.ms,
              child: Icon(
                isReceived
                    ? Icons.check_circle_rounded
                    : Icons.radio_button_unchecked_rounded,
                key: ValueKey(isReceived),
                color: isReceived ? Colors.green : Colors.white38,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(
                color: isReceived ? Colors.green : Colors.white70,
                fontSize: 14,
                fontWeight: isReceived ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            const Spacer(),
            if (!isReceived)
              Builder(
                builder: (ctx) => Text(
                  AppLocalizations.of(ctx).tradeDeliveryNotReceived,
                  style: const TextStyle(color: Colors.white24, fontSize: 11),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Barra de confirmación
// ─────────────────────────────────────────────────────────────────────────────

class _DeliveryConfirmBar extends StatelessWidget {
  final int totalCount;
  final int receivedCount;
  final bool isSaving;
  final VoidCallback onConfirm;

  const _DeliveryConfirmBar({
    required this.totalCount,
    required this.receivedCount,
    required this.isSaving,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final allReceived = receivedCount == totalCount;

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
      decoration: const BoxDecoration(
        color: Color(0xFF1A1A1A),
        border: Border(top: BorderSide(color: Color(0xFF2A2A2A), width: 1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(
                allReceived
                    ? Icons.inventory_2_rounded
                    : Icons.warning_amber_rounded,
                color: allReceived ? Colors.green : Colors.orange,
                size: 18,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  allReceived
                      ? l10n.tradeDeliveryAllReceived(receivedCount, totalCount)
                      : l10n.tradeDeliveryPartial(
                          receivedCount,
                          totalCount,
                          totalCount - receivedCount,
                        ),
                  style: TextStyle(
                    color: allReceived ? Colors.green : Colors.orange,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            icon: isSaving
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Icon(Icons.check_rounded),
            label: Text(
              isSaving ? l10n.tradeNegSaving : l10n.tradeConfirmDeliveryBtn,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            onPressed: isSaving ? null : onConfirm,
          ),
        ],
      ),
    );
  }
}
