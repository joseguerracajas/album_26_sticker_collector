// Archivo: lib/features/trade/presentation/trade_negotiation_screen.dart
//
// Pantalla de negociación:
//  - MI OFERTA   → Selecciono los cromos que voy a dar (auto ó manual)
//  - VOY A RECIBIR → Veo lo que el otro usuario va a darme (solo lectura)
//  - Botón "Confirmar mi oferta" cuando estoy listo

import 'package:album_26_sticker_collector/features/catalog/data/categories_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/data/stickers_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/domain/sticker.model.dart';
import 'package:album_26_sticker_collector/features/inventory/data/inventory_provider.dart';
import 'package:album_26_sticker_collector/features/trade/data/trade_provider.dart';
import 'package:album_26_sticker_collector/features/trade/domain/trade_offer.dart';
import 'package:album_26_sticker_collector/features/trade/domain/trade_session.dart';
import 'package:album_26_sticker_collector/features/trade/presentation/trade_delivery_screen.dart';
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';
import 'package:album_26_sticker_collector/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TradeNegotiationScreen extends ConsumerStatefulWidget {
  final TradeSession session;

  const TradeNegotiationScreen({super.key, required this.session});

  @override
  ConsumerState<TradeNegotiationScreen> createState() =>
      _TradeNegotiationScreenState();
}

class _TradeNegotiationScreenState extends ConsumerState<TradeNegotiationScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  // Mi oferta: { stickerId: quantity }
  Map<String, int> _myOffer = {};
  bool _autoMode = true;
  bool _isSaving = false;

  // Para detectar cambios de ofertas del partner
  String _lastPartnerOfferHash = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  bool _myTurnToEdit(TradeSession session) {
    final myId = supabase.auth.currentUser?.id ?? '';
    final isInitiator = session.initiatorId == myId;
    final status = session.status;
    if (status == 'selecting') return true;
    if (status == 'initiator_confirmed' && !isInitiator) return true;
    if (status == 'receiver_confirmed' && isInitiator) return true;
    return false;
  }

  bool _iAlreadyConfirmed(TradeSession session) {
    final myId = supabase.auth.currentUser?.id ?? '';
    final isInitiator = session.initiatorId == myId;
    final status = session.status;
    if (isInitiator && status == 'initiator_confirmed') return true;
    if (!isInitiator && status == 'receiver_confirmed') return true;
    if (status == 'reserved') return true;
    return false;
  }

  Future<void> _confirmOffer(TradeSession session) async {
    final l10n = AppLocalizations.of(context);
    if (_myOffer.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            l10n.tradeNegAtLeastOne,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.amber,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    setState(() => _isSaving = true);
    try {
      await ref
          .read(tradeActionsProvider.notifier)
          .confirmMyOffer(session, _myOffer);

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            l10n.tradeNegOfferConfirmed,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );
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

  Future<void> _modifyOffer(TradeSession session) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) {
        final dl10n = AppLocalizations.of(ctx);
        return AlertDialog(
          backgroundColor: const Color(0xFF1E1E1E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            dl10n.tradeNegModifyOffer,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            dl10n.tradeNegModifyOfferWarning,
            style: const TextStyle(color: Colors.white70),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: Text(
                dl10n.commonCancel,
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
              child: Text(dl10n.tradeNegModifyOffer),
            ),
          ],
        );
      },
    );
    if (confirm == true && mounted) {
      await ref
          .read(tradeActionsProvider.notifier)
          .resetMyConfirmation(session);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final myId = supabase.auth.currentUser?.id ?? '';

    // Sesión en tiempo real
    final sessionAsync = ref.watch(
      tradeSessionStreamProvider(widget.session.id),
    );
    final session = sessionAsync.asData?.value ?? widget.session;

    // Reaccionar a cambios de estado de la sesión
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
        Navigator.of(
          context,
        ).popUntil((r) => r.isFirst || r.settings.name == '/trade_hub');
      } else if (s.status == 'reserved') {
        // Ambos confirmaron → ir a entrega
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => TradeDeliveryScreen(session: s)),
        );
      } else if (s.status == 'completed') {
        // El otro usuario ya confirmó la entrega → volver al inicio
        Navigator.of(context).popUntil((r) => r.isFirst);
      }
    });

    // Detectar cuando el partner actualiza su oferta
    ref.listen(tradeOffersProvider(widget.session.id), (prev, next) {
      final offers = next.asData?.value;
      if (offers == null || !mounted) return;
      final partnerOffers = offers.where((o) => o.offererId != myId).toList();
      // Hash simple: lista de stickerId+quantity ordenada
      final hash =
          (partnerOffers..sort((a, b) => a.stickerId.compareTo(b.stickerId)))
              .map((o) => '${o.stickerId}:${o.quantity}')
              .join(',');
      if (hash != _lastPartnerOfferHash && _lastPartnerOfferHash.isNotEmpty) {
        _lastPartnerOfferHash = hash;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              l10n.tradeNegPartnerOfferUpdated,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.amber,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 3),
          ),
        );
      } else {
        _lastPartnerOfferHash = hash;
      }
    });

    final offersAsync = ref.watch(tradeOffersProvider(widget.session.id));
    final allStickersAsync = ref.watch(allStickersProvider);
    final categoriesAsync = ref.watch(categoriesProvider);
    final inventoryAsync = ref.watch(inventoryProvider);
    final otherOfferedAsync = ref.watch(
      offeredInOtherSessionsProvider(widget.session.id),
    );

    final canEdit = _myTurnToEdit(session);
    final alreadyConfirmed = _iAlreadyConfirmed(session);

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: Text(
          l10n.tradeNegTitle,
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
            onPressed: () async {
              final confirm = await showDialog<bool>(
                context: context,
                builder: (ctx) {
                  final dl10n = AppLocalizations.of(ctx);
                  return AlertDialog(
                    backgroundColor: const Color(0xFF1E1E1E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    title: Text(
                      dl10n.tradeHubCancelTitle,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    content: Text(
                      dl10n.tradeHubCancelMsg,
                      style: const TextStyle(color: Colors.white70),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(ctx, false),
                        child: Text(
                          dl10n.commonCancel,
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
                        child: Text(dl10n.tradeHubCancelYes),
                      ),
                    ],
                  );
                },
              );
              if (confirm == true && mounted) {
                await ref
                    .read(tradeActionsProvider.notifier)
                    .cancelSession(widget.session.id);
                if (mounted) Navigator.pop(context);
              }
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.amber,
          labelColor: Colors.amber,
          unselectedLabelColor: Colors.white38,
          tabs: [
            Tab(
              icon: const Icon(Icons.upload_rounded),
              text: l10n.tradeNegMyOfferTab,
            ),
            Tab(
              icon: const Icon(Icons.download_rounded),
              text: l10n.tradeNegReceivingTab,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: offersAsync.when(
              loading: () => const Center(
                child: CircularProgressIndicator(color: Colors.amber),
              ),
              error: (e, _) => Center(
                child: Text(
                  l10n.tradeErrorGeneric,
                  style: const TextStyle(color: Colors.redAccent),
                ),
              ),
              data: (offers) {
                final myOffers = offers
                    .where((o) => o.offererId == myId)
                    .toList();
                final partnerOffers = offers
                    .where((o) => o.offererId != myId)
                    .toList();

                return TabBarView(
                  controller: _tabController,
                  children: [
                    // ── Tab 1: Mi oferta ────────────────────────────────────
                    allStickersAsync.when(
                      loading: () => const Center(
                        child: CircularProgressIndicator(color: Colors.amber),
                      ),
                      error: (e, _) => Center(
                        child: Text(
                          l10n.tradeErrorGeneric,
                          style: const TextStyle(color: Colors.redAccent),
                        ),
                      ),
                      data: (allStickers) {
                        if (!inventoryAsync.hasValue) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.amber,
                            ),
                          );
                        }
                        final inventory = inventoryAsync.value!;

                        // Cargar selección desde las ofertas guardadas (si las hay)
                        if (_myOffer.isEmpty && myOffers.isNotEmpty) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            if (mounted) {
                              setState(() {
                                _myOffer = {
                                  for (final o in myOffers)
                                    o.stickerId: o.quantity,
                                };
                              });
                            }
                          });
                        }

                        // En modo auto, calcular duplicados
                        if (_autoMode && _myOffer.isEmpty) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            if (mounted) {
                              final dups = _getDuplicates(
                                inventory,
                                allStickers,
                              );
                              setState(() => _myOffer = dups);
                            }
                          });
                        }

                        return _MyOfferTab(
                          allStickers: allStickers,
                          inventory: inventory,
                          offer: _myOffer,
                          autoMode: _autoMode,
                          canEdit: canEdit,
                          alreadyConfirmed: alreadyConfirmed,
                          categoriesAsync: categoriesAsync,
                          lockedInOtherSessions:
                              otherOfferedAsync.asData?.value ?? {},
                          onToggle: canEdit
                              ? (id) {
                                  setState(() {
                                    if (_myOffer.containsKey(id)) {
                                      _myOffer.remove(id);
                                    } else {
                                      _myOffer[id] = 1;
                                    }
                                  });
                                }
                              : null,
                          onQuantityChange: canEdit
                              ? (id, qty) {
                                  setState(() {
                                    if (qty <= 0) {
                                      _myOffer.remove(id);
                                    } else {
                                      _myOffer[id] = qty;
                                    }
                                  });
                                }
                              : null,
                          onAutoModeToggle: canEdit
                              ? (val) {
                                  setState(() {
                                    _autoMode = val;
                                    if (val) {
                                      _myOffer = _getDuplicates(
                                        inventory,
                                        allStickers,
                                      );
                                    }
                                  });
                                }
                              : null,
                        );
                      },
                    ),

                    // ── Tab 2: Voy a recibir ────────────────────────────────
                    allStickersAsync.when(
                      loading: () => const Center(
                        child: CircularProgressIndicator(color: Colors.amber),
                      ),
                      error: (e, _) => const SizedBox.shrink(),
                      data: (allStickers) => _PartnerOfferTab(
                        partnerOffers: partnerOffers,
                        allStickers: allStickers,
                        categoriesAsync: categoriesAsync,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          // ── Barra inferior de acción ──────────────────────────────────────
          if (canEdit)
            _ConfirmBar(
              totalItems: _myOffer.values.fold(0, (a, b) => a + b),
              selectedStickers: _myOffer.length,
              isSaving: _isSaving,
              onConfirm: () => _confirmOffer(session),
            ),

          if (alreadyConfirmed)
            Builder(
              builder: (ctx) {
                final l10n = AppLocalizations.of(ctx);
                return Container(
                  width: double.infinity,
                  color: Colors.green.withValues(alpha: 0.12),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.check_circle_rounded,
                        color: Colors.green,
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          l10n.tradeNegAlreadyConfirmedBanner,
                          style: const TextStyle(
                            color: Colors.green,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      TextButton.icon(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.amber,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        icon: const Icon(Icons.edit_rounded, size: 14),
                        label: Text(
                          l10n.tradeNegModifyOffer,
                          style: const TextStyle(fontSize: 11),
                        ),
                        onPressed: () => _modifyOffer(session),
                      ),
                    ],
                  ),
                );
              },
            ),
        ],
      ),
    );
  }

  Map<String, int> _getDuplicates(
    Map<String, Map<String, int>> inventory,
    List<Sticker> allStickers,
  ) {
    final result = <String, int>{};
    for (final sticker in allStickers) {
      final variants = inventory[sticker.id] ?? {};
      int total = 0;
      for (final qty in variants.values) {
        total += qty;
      }
      // Ofrecer 1 de cada repetido (quedará 1 en inventario)
      if (total > 1) result[sticker.id] = 1;
    }
    return result;
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Tab: Mi oferta
// ─────────────────────────────────────────────────────────────────────────────

class _MyOfferTab extends StatelessWidget {
  final List<Sticker> allStickers;
  final Map<String, Map<String, int>> inventory;
  final Map<String, int> offer;
  final bool autoMode;
  final bool canEdit;
  final bool alreadyConfirmed;
  final AsyncValue<List<dynamic>> categoriesAsync;
  final Set<String> lockedInOtherSessions;
  final ValueChanged<String>? onToggle;
  final void Function(String id, int qty)? onQuantityChange;
  final ValueChanged<bool>? onAutoModeToggle;

  const _MyOfferTab({
    required this.allStickers,
    required this.inventory,
    required this.offer,
    required this.autoMode,
    required this.canEdit,
    required this.alreadyConfirmed,
    required this.categoriesAsync,
    required this.lockedInOtherSessions,
    required this.onToggle,
    required this.onQuantityChange,
    required this.onAutoModeToggle,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    // Solo mostrar stickers duplicados (cantidad > 1) para intercambio
    final myStickers = allStickers.where((s) {
      final qty = _totalQty(s.id);
      return qty > 1;
    }).toList();

    final selectedCount = offer.length;
    final totalItems = offer.values.fold(0, (a, b) => a + b);

    return Column(
      children: [
        // Header con modo y contador
        Container(
          color: const Color(0xFF1A1A1A),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      l10n.tradeNegSelectedCount(selectedCount),
                      style: const TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  if (totalItems != selectedCount)
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Text(
                        l10n.tradeNegTotalItems(totalItems),
                        style: const TextStyle(
                          color: Colors.amber,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  if (canEdit && onAutoModeToggle != null)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          autoMode
                              ? l10n.tradeNegAutoMode
                              : l10n.tradeNegManualMode,
                          style: TextStyle(
                            color: autoMode ? Colors.amber : Colors.white54,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Switch.adaptive(
                          value: autoMode,
                          onChanged: onAutoModeToggle,
                          activeThumbColor: Colors.amber,
                          activeTrackColor: Colors.amber.withValues(alpha: 0.4),
                          inactiveTrackColor: const Color(0xFF2A2A2A),
                        ),
                      ],
                    ),
                ],
              ),
              if (autoMode && canEdit)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    l10n.tradeNegAutoHint,
                    style: const TextStyle(color: Colors.white38, fontSize: 11),
                  ),
                ),
            ],
          ),
        ),

        // Lista
        Expanded(
          child: myStickers.isEmpty
              ? Center(
                  child: Text(
                    l10n.tradeNegNoStickers,
                    style: const TextStyle(color: Colors.white38, fontSize: 14),
                  ),
                )
              : _StickerGrid(
                  stickers: myStickers,
                  inventory: inventory,
                  offer: offer,
                  canSelect: canEdit,
                  onToggle: onToggle,
                  onQuantityChange: onQuantityChange,
                  categoriesAsync: categoriesAsync,
                  highlightDuplicates: true,
                  lockedIds: lockedInOtherSessions,
                ),
        ),
      ],
    );
  }

  int _totalQty(String stickerId) {
    final variants = inventory[stickerId] ?? {};
    return variants.values.fold(0, (a, b) => a + b);
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Tab: Voy a recibir
// ─────────────────────────────────────────────────────────────────────────────

class _PartnerOfferTab extends StatelessWidget {
  final List<TradeOffer> partnerOffers;
  final List<Sticker> allStickers;
  final AsyncValue<List<dynamic>> categoriesAsync;

  const _PartnerOfferTab({
    required this.partnerOffers,
    required this.allStickers,
    required this.categoriesAsync,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (partnerOffers.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.hourglass_empty_rounded,
              color: Colors.white24,
              size: 48,
            ),
            const SizedBox(height: 12),
            Text(
              l10n.tradeNegPartnerWaiting,
              style: const TextStyle(color: Colors.white38, fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    final stickerMap = {for (final s in allStickers) s.id: s};
    final offeredStickers = partnerOffers
        .map((o) => stickerMap[o.stickerId])
        .whereType<Sticker>()
        .toList();

    return Column(
      children: [
        Container(
          width: double.infinity,
          color: const Color(0xFF1A1A1A),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Text(
            l10n.tradeNegReceivingCount(offeredStickers.length),
            style: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        Expanded(
          child: _StickerGrid(
            stickers: offeredStickers,
            inventory: const {},
            offer: const {},
            canSelect: false,
            onToggle: null,
            categoriesAsync: categoriesAsync,
            highlightDuplicates: false,
            readOnly: true,
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Grid compartido
// ─────────────────────────────────────────────────────────────────────────────

class _StickerGrid extends StatelessWidget {
  final List<Sticker> stickers;
  final Map<String, Map<String, int>> inventory;
  final Map<String, int> offer;
  final bool canSelect;
  final bool highlightDuplicates;
  final bool readOnly;
  final Set<String> lockedIds;
  final ValueChanged<String>? onToggle;
  final void Function(String id, int qty)? onQuantityChange;
  final AsyncValue<List<dynamic>> categoriesAsync;

  const _StickerGrid({
    required this.stickers,
    required this.inventory,
    required this.offer,
    required this.canSelect,
    required this.onToggle,
    required this.categoriesAsync,
    required this.highlightDuplicates,
    this.readOnly = false,
    this.lockedIds = const {},
    this.onQuantityChange,
  });

  @override
  Widget build(BuildContext context) {
    // Agrupar por categoría
    final Map<String, List<Sticker>> grouped = {};
    for (final s in stickers) {
      grouped.putIfAbsent(s.categoryId, () => []).add(s);
    }

    final categoryMap = <String, dynamic>{};
    if (categoriesAsync.hasValue) {
      for (final c in categoriesAsync.value!) {
        categoryMap[c.id] = c;
      }
    }

    final sortedCategories = grouped.keys.toList()
      ..sort((a, b) {
        final orderA = categoryMap[a]?.orderIndex ?? 999;
        final orderB = categoryMap[b]?.orderIndex ?? 999;
        return orderA.compareTo(orderB);
      });

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: sortedCategories.length,
      itemBuilder: (context, index) {
        final catId = sortedCategories[index];
        final cat = categoryMap[catId];
        final catStickers = grouped[catId]!;

        final selectedInCat = catStickers
            .where((s) => offer.containsKey(s.id))
            .length;

        // total items ofrecidos en esta categoría
        final offeredInCat = catStickers
            .map((s) => offer[s.id] ?? 0)
            .fold(0, (a, b) => a + b);

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
                  if (canSelect && selectedInCat > 0)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.amber.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        offeredInCat == selectedInCat
                            ? '$selectedInCat'
                            : '$selectedInCat (×$offeredInCat)',
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
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: catStickers.map((s) {
                final totalQty = _totalQty(s.id);
                final isDuplicate = totalQty > 1;
                final offeredQty = offer[s.id] ?? 0;
                final isLocked = lockedIds.contains(s.id);
                // Máx que puede ofrecer: total - 1 (siempre quedar un ejemplar)
                // Guard: si totalQty == 0 (tab readOnly sin inventario), usar 1
                final maxOffer = totalQty > 1 ? totalQty - 1 : 1;

                return _StickerChip(
                  sticker: s,
                  totalQty: totalQty,
                  offeredQty: offeredQty,
                  maxOffer: maxOffer,
                  isDuplicate: highlightDuplicates && isDuplicate,
                  isLocked: isLocked,
                  canSelect: canSelect && !isLocked,
                  readOnly: readOnly,
                  onTap: canSelect && !isLocked && onToggle != null
                      ? () {
                          HapticFeedback.selectionClick();
                          onToggle!(s.id);
                        }
                      : null,
                  onQuantityChange:
                      canSelect && !isLocked && onQuantityChange != null
                      ? (qty) => onQuantityChange!(s.id, qty)
                      : null,
                );
              }).toList(),
            ),
            const SizedBox(height: 12),
          ],
        ).animate().fadeIn(delay: (index * 30).ms, duration: 300.ms);
      },
    );
  }

  int _totalQty(String stickerId) {
    final variants = inventory[stickerId] ?? {};
    return variants.values.fold(0, (a, b) => a + b);
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Chip individual de cromo
// ─────────────────────────────────────────────────────────────────────────────

class _StickerChip extends StatelessWidget {
  final Sticker sticker;
  final int totalQty;
  final int offeredQty;
  final int maxOffer;
  final bool isDuplicate;
  final bool isLocked;
  final bool canSelect;
  final bool readOnly;
  final VoidCallback? onTap;
  final ValueChanged<int>? onQuantityChange;

  const _StickerChip({
    required this.sticker,
    required this.totalQty,
    required this.offeredQty,
    required this.maxOffer,
    required this.isDuplicate,
    required this.isLocked,
    required this.canSelect,
    required this.readOnly,
    required this.onTap,
    this.onQuantityChange,
  });

  bool get isSelected => offeredQty > 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    Color bgColor;
    Color textColor;
    Color borderColor;

    if (readOnly) {
      bgColor = Colors.green.withValues(alpha: 0.15);
      textColor = Colors.green;
      borderColor = Colors.green.withValues(alpha: 0.5);
    } else if (isLocked) {
      bgColor = Colors.red.withValues(alpha: 0.08);
      textColor = Colors.red.shade300.withValues(alpha: 0.6);
      borderColor = Colors.red.withValues(alpha: 0.25);
    } else if (isSelected) {
      bgColor = Colors.amber.withValues(alpha: 0.2);
      textColor = Colors.amber;
      borderColor = Colors.amber;
    } else if (isDuplicate) {
      bgColor = Colors.blue.withValues(alpha: 0.08);
      textColor = Colors.blue.shade200;
      borderColor = Colors.blue.withValues(alpha: 0.3);
    } else {
      bgColor = const Color(0xFF2A2A2A);
      textColor = Colors.white70;
      borderColor = Colors.transparent;
    }

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: 180.ms,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: borderColor, width: 1.5),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isLocked)
                  Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: Icon(
                      Icons.lock_rounded,
                      color: Colors.red.shade300.withValues(alpha: 0.5),
                      size: 11,
                    ),
                  )
                else if (isSelected)
                  const Padding(
                    padding: EdgeInsets.only(right: 4),
                    child: Icon(
                      Icons.check_circle_rounded,
                      color: Colors.amber,
                      size: 14,
                    ),
                  ),
                Text(
                  '${sticker.categoryId} ${sticker.stickerCode}',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 12,
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                // Badge total copias
                if (totalQty > 1 && !readOnly) ...[
                  const SizedBox(width: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 1,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue.withValues(alpha: 0.25),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      'x$totalQty',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ],
            ),
            // Selector de cantidad (visible cuando está seleccionado y tiene más de 1 copia)
            if (isSelected && maxOffer > 1 && onQuantityChange != null)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _QtyButton(
                      icon: Icons.remove_rounded,
                      onTap: offeredQty > 1
                          ? () => onQuantityChange!(offeredQty - 1)
                          : null,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Text(
                        l10n.tradeNegOfferedQtyBadge(offeredQty),
                        style: const TextStyle(
                          color: Colors.amber,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    _QtyButton(
                      icon: Icons.add_rounded,
                      onTap: offeredQty < maxOffer
                          ? () => onQuantityChange!(offeredQty + 1)
                          : null,
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

class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  const _QtyButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 18,
        height: 18,
        decoration: BoxDecoration(
          color: onTap != null
              ? Colors.amber.withValues(alpha: 0.25)
              : Colors.white12,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(
          icon,
          size: 12,
          color: onTap != null ? Colors.amber : Colors.white24,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Barra de confirmación
// ─────────────────────────────────────────────────────────────────────────────

class _ConfirmBar extends StatelessWidget {
  final int totalItems;
  final int selectedStickers;
  final bool isSaving;
  final VoidCallback onConfirm;

  const _ConfirmBar({
    required this.totalItems,
    required this.selectedStickers,
    required this.isSaving,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
      decoration: const BoxDecoration(
        color: Color(0xFF1A1A1A),
        border: Border(top: BorderSide(color: Color(0xFF2A2A2A), width: 1)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.upload_rounded, color: Colors.amber, size: 18),
              const SizedBox(width: 8),
              Text(
                l10n.tradeNegOfferLabel(selectedStickers),
                style: const TextStyle(color: Colors.white70, fontSize: 13),
              ),
              if (totalItems != selectedStickers) ...[
                const SizedBox(width: 6),
                Text(
                  '• ${l10n.tradeNegTotalItems(totalItems)}',
                  style: const TextStyle(
                    color: Colors.amber,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
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
                        color: Colors.black,
                      ),
                    )
                  : const Icon(Icons.check_rounded),
              label: Text(
                isSaving ? l10n.tradeNegSaving : l10n.tradeNegConfirmBtn,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              onPressed: isSaving || totalItems == 0 ? null : onConfirm,
            ),
          ),
        ],
      ),
    );
  }
}
