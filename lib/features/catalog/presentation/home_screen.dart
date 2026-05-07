// Archivo: lib/features/catalog/presentation/home_screen.dart

import 'package:album_26_sticker_collector/core/tutorial/home_tutorial.dart';
import 'package:album_26_sticker_collector/core/tutorial/tutorial_keys.dart';
import 'package:album_26_sticker_collector/core/tutorial/tutorial_service.dart';
import 'package:album_26_sticker_collector/features/auth/presentation/auth_screen.dart';
import 'package:album_26_sticker_collector/features/auth/presentation/profile_screen.dart';
import 'package:album_26_sticker_collector/features/catalog/data/album_variant_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/data/categories_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/data/stickers_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/data/sync_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/global_collection_screen.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/legal_notice_screen.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/statistics_screen.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/widgets/animated_expand_container.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/widgets/app_bar_actions.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/widgets/category_avatar.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/widgets/sticker_stat_row.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/widgets/variant_selector_sheet.dart';
import 'package:album_26_sticker_collector/features/inventory/data/inventory_provider.dart';
import 'package:album_26_sticker_collector/features/inventory/data/stats_provider.dart';
import 'package:album_26_sticker_collector/features/monetization/data/ads_provider.dart';
import 'package:album_26_sticker_collector/features/trade/data/trade_provider.dart';
import 'package:album_26_sticker_collector/features/trade/presentation/trade_hub_screen.dart';
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:album_26_sticker_collector/main.dart';
import 'category_detail_screen.dart';

// --- ESTADO DEL BUSCADOR ---
class SearchQueryNotifier extends Notifier<String> {
  @override
  String build() => '';

  void updateQuery(String query) => state = query;
}

final searchQueryProvider = NotifierProvider<SearchQueryNotifier, String>(
  SearchQueryNotifier.new,
);

String _normalize(String text) {
  const accents = 'áàäâãéèëêíìïîóòöôõúùüûñçÁÀÄÂÃÉÈËÊÍÌÏÎÓÒÖÔÕÚÙÜÛÑÇ';
  const normalized = 'aaaaaeeeeiiiioooooouuuuncAAAAaEEEEIIIIOOOOOUUUUNC';
  var result = text.toLowerCase();
  for (var i = 0; i < accents.length; i++) {
    result = result.replaceAll(accents[i], normalized[i]);
  }
  return result;
}

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool _variantDialogShown = false;
  bool _tutorialScheduled = false;
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  Future<void> _maybeShowTutorial() async {
    if (_tutorialScheduled || !mounted) return;
    _tutorialScheduled = true;
    final done = await TutorialService.isHomeTutorialDone();
    if (!done && mounted) HomeTutorial.show(context);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final totalCromosAsync = ref.watch(totalStickersCountProvider);
    final cromosUnicos = ref.watch(uniqueCollectedProvider);
    final duplicatesCount =
        ref.watch(duplicateCopiesCountProvider).asData?.value ?? 0;
    final categoriesAsync = ref.watch(categoriesProvider);
    final searchQuery = ref.watch(searchQueryProvider);

    // Cuando la preferencia de variante carga:
    // - Si es null  → mostrar sheet obligatorio; al cerrarse, lanzar tutorial
    // - Si ya tiene → lanzar tutorial directamente (primer uso sin sheet)
    ref.listen(activeVariantPreferenceProvider, (prev, next) {
      if (!next.hasValue) return;
      if (next.value == null) {
        if (!_variantDialogShown) {
          _variantDialogShown = true;
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            if (!mounted) return;
            await VariantSelectorSheet.show(context, mandatory: true);
            await _maybeShowTutorial();
          });
        }
      } else {
        // Variante ya seleccionada: mostrar tutorial si no lo ha visto
        if (!_variantDialogShown) {
          _variantDialogShown = true;
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => _maybeShowTutorial(),
          );
        }
      }
    });

    return PrimaryScrollController(
      controller: _scrollController,
      child: Scaffold(
        backgroundColor: const Color(0xFF121212),
        appBar: AppBar(
          title: Text(
            l10n.homeTitle,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: Builder(
            builder: (ctx) => Center(
              child: SizedBox(
                key: tutorialDrawerKey,
                width: 44,
                height: 44,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(Icons.menu, color: Colors.amber),
                  onPressed: () => Scaffold.of(ctx).openDrawer(),
                ),
              ),
            ),
          ),
          actions: const [
            ScannerIconButton(showTutorialKey: true),
            ShareMenuButton(showTutorialKey: true),
          ],
        ),
        drawer: const _AppDrawer(),
        bottomNavigationBar: const AdBannerWidget(),
        body: RefreshIndicator(
          color: Colors.amber,
          backgroundColor: const Color(0xFF1E1E1E),
          onRefresh: ref.read(syncServiceProvider).refreshAll,
          child: CustomScrollView(
            primary: true,
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- TARJETA DORADA GLOBAL ANIMADA ---
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 10,
                      ),
                      child:
                          Container(
                                key: tutorialProgressCardKey,
                                // ... (TODO EL CÓDIGO DE TU TARJETA DORADA SE QUEDA EXACTAMENTE IGUAL)
                                padding: const EdgeInsets.all(24),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Colors.amber.shade400,
                                      Colors.amber.shade800,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(24),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.amber.withValues(
                                        alpha: 0.3,
                                      ),
                                      blurRadius: 15,
                                      offset: const Offset(0, 8),
                                    ),
                                  ],
                                ),
                                child: totalCromosAsync.when(
                                  loading: () => const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.black,
                                    ),
                                  ),
                                  error: (e, s) => Text(
                                    l10n.homeProgressError,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  data: (total) {
                                    final porcentaje = total == 0
                                        ? 0.0
                                        : (cromosUnicos / total) * 100;
                                    final progresoDecimal = total == 0
                                        ? 0.0
                                        : (cromosUnicos / total);

                                    return Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                l10n.homeGlobalProgressTitle,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            FittedBox(
                                              fit: BoxFit.scaleDown,
                                              child: Text(
                                                '${porcentaje.toStringAsFixed(1)}%',
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 38,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 15),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          child: LinearProgressIndicator(
                                            value: progresoDecimal,
                                            backgroundColor: Colors.black12,
                                            valueColor:
                                                const AlwaysStoppedAnimation<
                                                  Color
                                                >(Colors.white),
                                            minHeight: 10,
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: StickerStatRow(
                                            collected: cromosUnicos,
                                            total: total,
                                            missing: total - cromosUnicos,
                                            duplicateCopies: duplicatesCount,
                                            collectedColor: Colors.black87,
                                            missingColor: Colors.black54,
                                            duplicatesColor: Colors.black45,
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        SizedBox(
                                          width: double.infinity,
                                          child: AnimatedExpandContainer(
                                            closedColor: Colors.black87,
                                            borderRadius: 12.0,
                                            openBuilder: (context, close) =>
                                                const GlobalCollectionScreen(),
                                            closedBuilder: (context, open) {
                                              return ElevatedButton.icon(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent,
                                                  foregroundColor: Colors.amber,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          12,
                                                        ),
                                                  ),
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        vertical: 12,
                                                      ),
                                                ),
                                                icon: const Icon(Icons.style),
                                                label: Text(
                                                  l10n.homeViewFullCollection,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  HapticFeedback.lightImpact();
                                                  open();
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              )
                              .animate()
                              .scaleXY(
                                begin: 0.9,
                                end: 1.0,
                                duration: 600.ms,
                                curve: Curves.easeOutBack,
                              )
                              .fadeIn(duration: 600.ms)
                              .shimmer(
                                delay: 800.ms,
                                duration: 1000.ms,
                                color: Colors.white.withValues(alpha: 0.5),
                                angle: 1.2,
                              ),
                    ),

                    // TÍTULO "EQUIPOS"
                    Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 24.0,
                            vertical: 8,
                          ),
                          child: Row(
                            children: [
                              Text(
                                l10n.homeTeamsTitle,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                        )
                        .animate()
                        .fadeIn(delay: 200.ms, duration: 400.ms)
                        .slideY(
                          begin: 0.2,
                          end: 0,
                          duration: 400.ms,
                          curve: Curves.easeOut,
                        ),

                    // BUSCADOR
                    Padding(
                          key: tutorialSearchBarKey,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 4.0,
                          ),
                          child: TextField(
                            controller: _searchController,
                            onChanged: (value) => ref
                                .read(searchQueryProvider.notifier)
                                .updateQuery(value),
                            style: const TextStyle(color: Colors.white),
                            autocorrect: false,
                            enableSuggestions: true,
                            decoration: InputDecoration(
                              hintText: l10n.homeSearchTeamsHint,
                              hintStyle: TextStyle(color: Colors.grey.shade600),
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.amber,
                                size: 20,
                              ),
                              filled: true,
                              fillColor: const Color(0xFF1E1E1E),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 0,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                              suffixIcon: searchQuery.isNotEmpty
                                  ? IconButton(
                                      icon: const Icon(
                                        Icons.close,
                                        color: Colors.grey,
                                        size: 18,
                                      ),
                                      onPressed: () {
                                        _searchController.clear();
                                        ref
                                            .read(searchQueryProvider.notifier)
                                            .updateQuery('');
                                        FocusScope.of(context).unfocus();
                                      },
                                    )
                                  : null,
                            ),
                          ),
                        )
                        .animate()
                        .fadeIn(delay: 300.ms, duration: 400.ms)
                        .slideY(
                          begin: 0.2,
                          end: 0,
                          duration: 400.ms,
                          curve: Curves.easeOut,
                        ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),

              // 🔥 3. LA LISTA DE EQUIPOS AHORA ES UN SliverList (Recuperamos el Lazy Loading)
              categoriesAsync.when(
                loading: () => const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 220,
                    child: Center(
                      child: CircularProgressIndicator(color: Colors.amber),
                    ),
                  ),
                ),
                error: (e, s) => SliverToBoxAdapter(
                  child: SizedBox(
                    height: 220,
                    child: Center(
                      child: Text(
                        l10n.commonErrorWithMessage(e),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                data: (categorias) {
                  final normalizedQuery = _normalize(searchQuery);
                  final filtered = categorias
                      .where(
                        (c) =>
                            _normalize(c.name).contains(normalizedQuery) ||
                            _normalize(c.id).contains(normalizedQuery),
                      )
                      .toList();

                  if (filtered.isEmpty) {
                    return SliverToBoxAdapter(
                      child: SizedBox(
                        height: 220,
                        child: Center(
                          child: Text(
                            l10n.homeNoResults,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    );
                  }

                  return SliverPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => _CategoryTile(
                          category: filtered[index],
                          index: index,
                        ),
                        childCount: filtered.length,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- WIDGET DE CADA PAÍS ---
class _CategoryTile extends ConsumerWidget {
  final dynamic category;
  final int index;

  const _CategoryTile({required this.category, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stickersAsync = ref.watch(stickersByCategoryProvider(category.id));
    final inventoryAsync = ref.watch(inventoryProvider);

    final int delayCascada = (index.clamp(0, 10) * 50);

    return Padding(
          key: index == 0 ? tutorialCategoryTileKey : null,
          padding: const EdgeInsets.only(bottom: 12),
          child: AnimatedExpandContainer(
            openBuilder: (context, close) =>
                CategoryDetailScreen(category: category),
            closedBuilder: (context, open) {
              return InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  HapticFeedback.lightImpact();
                  open();
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CategoryAvatar(
                        iconUrl: category.iconUrl,
                        text: category.id,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              category.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 8),
                            stickersAsync.when(
                              loading: () => const LinearProgressIndicator(
                                color: Colors.amber,
                                minHeight: 2,
                              ),
                              error: (e, s) => const SizedBox.shrink(),
                              data: (stickers) {
                                int total = stickers.length;
                                int unicos = 0;
                                int duplicateCopies = 0;
                                for (var s in stickers) {
                                  final inv = inventoryAsync.value?[s.id] ?? {};
                                  int sum = 0;
                                  for (var v in inv.values) {
                                    sum += v;
                                  }
                                  if (sum > 0) unicos++;
                                  if (sum > 1) duplicateCopies += sum - 1;
                                }
                                final double progreso = total == 0
                                    ? 0
                                    : unicos / total;

                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              4,
                                            ),
                                            child: LinearProgressIndicator(
                                              value: progreso,
                                              backgroundColor: Colors.black45,
                                              valueColor:
                                                  const AlwaysStoppedAnimation<
                                                    Color
                                                  >(Colors.amber),
                                              minHeight: 6,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          '${(progreso * 100).toStringAsFixed(0)}%',
                                          style: const TextStyle(
                                            color: Colors.white70,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 6),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: StickerStatRow(
                                        collected: unicos,
                                        total: total,
                                        missing: total - unicos,
                                        duplicateCopies: duplicateCopies,
                                        collectedColor: Colors.amber,
                                        missingColor: Colors.white54,
                                        duplicatesColor: Colors.white38,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white24,
                        size: 14,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
        .animate()
        .fadeIn(delay: delayCascada.ms, duration: 400.ms, curve: Curves.easeOut)
        .slideX(
          begin: -0.2,
          end: 0,
          delay: delayCascada.ms,
          duration: 400.ms,
          curve: Curves.easeOut,
        );
  }
}

// ---------------------------------------------------------------------------
// Drawer lateral con perfil y variante del álbum
// ---------------------------------------------------------------------------
class _AppDrawer extends ConsumerWidget {
  const _AppDrawer();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final prefAsync = ref.watch(activeVariantPreferenceProvider);
    final variantsAsync = ref.watch(activeAlbumVariantsProvider);
    final isLoggedIn = supabase.auth.currentSession != null;

    final variants = variantsAsync.asData?.value;
    final pref = prefAsync.asData?.value;
    final variantName = pref == null
        ? null
        : variants
              ?.firstWhere(
                (v) => v.id == pref.albumVariantId,
                orElse: () => variants.first,
              )
              .name;

    return Drawer(
      backgroundColor: const Color(0xFF1A1A1A),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cabecera
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
              child: Row(
                children: [
                  Image.asset(
                    'assets/icon/icon_transparent.png',
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 14),
                  Text(
                    l10n.appTitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(color: Color(0xFF2A2A2A)),

            // Opción: Perfil / Iniciar sesión
            ListTile(
              leading: Icon(
                isLoggedIn ? Icons.account_circle : Icons.login_rounded,
                color: Colors.amber,
              ),
              title: Text(
                isLoggedIn ? l10n.homeProfileTooltip : l10n.drawerSignIn,
                style: TextStyle(
                  color: isLoggedIn ? Colors.white : Colors.amber,
                  fontWeight: isLoggedIn ? FontWeight.normal : FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                HapticFeedback.lightImpact();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => isLoggedIn
                        ? const ProfileScreen()
                        : const LoginScreen(),
                  ),
                );
              },
            ),

            const Divider(color: Color(0xFF2A2A2A)),

            // Opción: Variante
            ListTile(
              leading: const Icon(Icons.public, color: Colors.amber),
              title: Text(
                l10n.variantSheetTitle,
                style: const TextStyle(color: Colors.white),
              ),
              subtitle: variantName != null
                  ? Text(
                      variantName,
                      style: const TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    )
                  : null,
              trailing: const Icon(
                Icons.chevron_right,
                color: Colors.white24,
                size: 18,
              ),
              onTap: () {
                Navigator.pop(context);
                HapticFeedback.selectionClick();
                VariantSelectorSheet.show(context);
              },
            ),

            // Opción: Intercambiar cromos
            const Divider(color: Color(0xFF2A2A2A)),
            const _TradeDrawerTile(),
            const Divider(color: Color(0xFF2A2A2A)),
            ListTile(
              leading: const Icon(Icons.bar_chart_rounded, color: Colors.amber),
              title: Text(
                l10n.drawerStats,
                style: const TextStyle(color: Colors.white),
              ),
              trailing: const Icon(
                Icons.chevron_right,
                color: Colors.white24,
                size: 18,
              ),
              onTap: () {
                Navigator.pop(context);
                HapticFeedback.lightImpact();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const StatisticsScreen()),
                );
              },
            ),

            const Spacer(),

            // Opción: Ver tutorial de nuevo
            const Divider(color: Color(0xFF2A2A2A)),
            ListTile(
              leading: const Icon(
                Icons.help_outline_rounded,
                color: Colors.amber,
              ),
              title: Text(
                l10n.drawerReplayTutorial,
                style: const TextStyle(color: Colors.white),
              ),
              onTap: () async {
                Navigator.pop(context);
                HapticFeedback.lightImpact();
                await TutorialService.resetAll();
                if (context.mounted) HomeTutorial.show(context);
              },
            ),

            // Aviso Legal
            const Divider(color: Color(0xFF2A2A2A)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const LegalNoticeScreen(),
                    ),
                  );
                },
                child: Text(
                  l10n.drawerLegalNotice,
                  style: const TextStyle(
                    color: Colors.white38,
                    fontSize: 12,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white38,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Tile de intercambio con badge de sesión activa
// ─────────────────────────────────────────────────────────────────────────────

class _TradeDrawerTile extends ConsumerWidget {
  const _TradeDrawerTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final myId = supabase.auth.currentUser?.id;
    final sessionsAsync = ref.watch(activeTradeSessionsProvider);

    final sessions = sessionsAsync.asData?.value ?? [];
    final hasActive = sessions.isNotEmpty;

    // Solicitud ENTRANTE: alguna sesión está en pending_acceptance y yo soy el receptor
    final hasIncomingRequest =
        hasActive &&
        myId != null &&
        sessions.any(
          (s) => s.status == 'pending_acceptance' && s.initiatorId != myId,
        );

    return ListTile(
      leading: Stack(
        clipBehavior: Clip.none,
        children: [
          Icon(
            hasIncomingRequest
                ? Icons.notifications_active_rounded
                : Icons.swap_horiz_rounded,
            color: Colors.amber,
          ),
          if (hasIncomingRequest)
            Positioned(
              top: -5,
              right: -5,
              child:
                  Container(
                        width: 14,
                        height: 14,
                        decoration: const BoxDecoration(
                          color: Colors.orange,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.priority_high_rounded,
                          size: 10,
                          color: Colors.white,
                        ),
                      )
                      .animate(onPlay: (c) => c.repeat())
                      .scaleXY(
                        begin: 0.8,
                        end: 1.25,
                        duration: 600.ms,
                        curve: Curves.easeInOut,
                      )
                      .then()
                      .scaleXY(
                        begin: 1.25,
                        end: 0.8,
                        duration: 600.ms,
                        curve: Curves.easeInOut,
                      ),
            )
          else if (hasActive)
            Positioned(
              top: -4,
              right: -4,
              child: Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
      title: Row(
        children: [
          Expanded(
            child: Text(
              l10n.tradeDrawerTitle,
              style: const TextStyle(color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (hasIncomingRequest) ...[
            const SizedBox(width: 8),
            Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orange.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: Colors.orange.withValues(alpha: 0.6),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    l10n.tradeDrawerRequestBadge,
                    style: const TextStyle(
                      color: Colors.orange,
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                )
                .animate(onPlay: (c) => c.repeat())
                .shimmer(
                  duration: 1400.ms,
                  color: Colors.orange.withValues(alpha: 0.4),
                ),
          ] else if (hasActive) ...[
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.green.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                l10n.tradeDrawerActiveBadge,
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ],
        ],
      ),
      trailing: const Icon(
        Icons.chevron_right,
        color: Colors.white24,
        size: 18,
      ),
      onTap: () {
        Navigator.pop(context);
        HapticFeedback.lightImpact();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const TradeHubScreen()),
        );
      },
    );
  }
}
