// Archivo: lib/features/catalog/presentation/home_screen.dart

import 'package:album_26_sticker_collector/features/auth/presentation/auth_screen.dart';
import 'package:album_26_sticker_collector/features/auth/presentation/profile_screen.dart';
import 'package:album_26_sticker_collector/features/catalog/data/categories_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/data/stickers_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/data/sync_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/global_collection_screen.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/widgets/animated_expand_container.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/widgets/app_bar_actions.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/widgets/category_avatar.dart';
import 'package:album_26_sticker_collector/features/inventory/data/inventory_provider.dart';
import 'package:album_26_sticker_collector/features/inventory/data/stats_provider.dart';
import 'package:album_26_sticker_collector/features/monetization/data/ads_provider.dart';
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

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final totalCromosAsync = ref.watch(totalStickersCountProvider);
    final cromosUnicos = ref.watch(uniqueCollectedProvider);
    final categoriesAsync = ref.watch(categoriesProvider);
    final searchQuery = ref.watch(searchQueryProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: Text(
          l10n.homeTitle,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.account_circle, color: Colors.grey, size: 28),
          tooltip: l10n.homeProfileTooltip,
          onPressed: () {
            final isLoggedIn = supabase.auth.currentSession != null;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    isLoggedIn ? const ProfileScreen() : const LoginScreen(),
              ),
            );
          },
        ),
        actions: const [ScannerIconButton(), ShareMenuButton()],
      ),
      bottomNavigationBar: const AdBannerWidget(),
      body: RefreshIndicator(
        color: Colors.amber,
        backgroundColor: const Color(0xFF1E1E1E),
        onRefresh: ref.read(syncServiceProvider).refreshAll,
        child: CustomScrollView(
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
                                    color: Colors.amber.withValues(alpha: 0.3),
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
                                        borderRadius: BorderRadius.circular(8),
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
                                        child: Text(
                                          l10n.homeCollectedCount(
                                            cromosUnicos,
                                            total,
                                          ),
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                          ),
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
                                                shadowColor: Colors.transparent,
                                                foregroundColor: Colors.amber,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
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
                        child: Text(
                          l10n.homeTeamsTitle,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
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
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 4.0,
                        ),
                        child: TextField(
                          onChanged: (value) => ref
                              .read(searchQueryProvider.notifier)
                              .updateQuery(value),
                          style: const TextStyle(color: Colors.white),
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
                final filtered = categorias
                    .where(
                      (c) =>
                          c.name.toLowerCase().contains(
                            searchQuery.toLowerCase(),
                          ) ||
                          c.id.toLowerCase().contains(
                            searchQuery.toLowerCase(),
                          ),
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
    final l10n = AppLocalizations.of(context);
    final stickersAsync = ref.watch(stickersByCategoryProvider(category.id));
    final inventoryAsync = ref.watch(inventoryProvider);

    final int delayCascada = (index.clamp(0, 10) * 50);

    return Padding(
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
                                for (var s in stickers) {
                                  final inv = inventoryAsync.value?[s.id] ?? {};
                                  int sum = 0;
                                  for (var v in inv.values) {
                                    sum += v;
                                  }
                                  if (sum > 0) unicos++;
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
                                    const SizedBox(height: 4),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        l10n.homeObtainedCount(unicos, total),
                                        style: TextStyle(
                                          color: Colors.grey.shade500,
                                          fontSize: 11,
                                          fontStyle: FontStyle.italic,
                                        ),
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
