// Archivo: lib/features/catalog/presentation/statistics_screen.dart

import 'dart:math' as math;
import 'dart:ui' as ui;
import 'dart:io';

import 'package:album_26_sticker_collector/core/tutorial/statistics_tutorial.dart';
import 'package:album_26_sticker_collector/core/tutorial/tutorial_keys.dart';
import 'package:album_26_sticker_collector/core/tutorial/tutorial_service.dart';
import 'package:album_26_sticker_collector/features/catalog/data/sync_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/domain/category.model.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/widgets/sticker_stat_row.dart';
import 'package:album_26_sticker_collector/features/inventory/data/stats_provider.dart';
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

// ---------------------------------------------------------------------------
// Provider de activación de pestaña (igual que scanner/exchange/lookup)
// ---------------------------------------------------------------------------
class _StatisticsTabActiveNotifier extends Notifier<bool> {
  @override
  bool build() => false;

  void setActive(bool value) => state = value;
}

final statisticsTabActiveProvider =
    NotifierProvider<_StatisticsTabActiveNotifier, bool>(
      _StatisticsTabActiveNotifier.new,
    );

// ---------------------------------------------------------------------------
// Estado local de la pantalla
// ---------------------------------------------------------------------------
class _SelectedCategoryIdsNotifier extends Notifier<Set<String>?> {
  @override
  Set<String>? build() => null;

  void toggle(String id) {
    final current = Set<String>.from(state ?? {});
    if (current.contains(id)) {
      current.remove(id);
    } else {
      current.add(id);
    }
    state = current.isEmpty ? null : current;
  }

  void reset() => state = null;
}

final _selectedCategoryIdsProvider =
    NotifierProvider<_SelectedCategoryIdsNotifier, Set<String>?>(
      _SelectedCategoryIdsNotifier.new,
    );

// ---------------------------------------------------------------------------
// Estado de ordenamiento de categorías
// ---------------------------------------------------------------------------
enum _StatsSortOrder {
  category, // orden original (por defecto)
  progressDesc, // mayor progreso primero
  progressAsc, // menor progreso primero
  missingDesc, // más faltantes primero
  duplicatesDesc, // más repetidos primero
}

class _StatsSortNotifier extends Notifier<_StatsSortOrder> {
  @override
  _StatsSortOrder build() => _StatsSortOrder.category;

  void set(_StatsSortOrder order) => state = order;
}

final _statsSortProvider =
    NotifierProvider<_StatsSortNotifier, _StatsSortOrder>(
      _StatsSortNotifier.new,
    );

// ---------------------------------------------------------------------------
// Pantalla principal
// ---------------------------------------------------------------------------
class StatisticsScreen extends ConsumerStatefulWidget {
  const StatisticsScreen({super.key});

  @override
  ConsumerState<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends ConsumerState<StatisticsScreen> {
  double _pointerDownX = 0;
  final ScrollController _scrollController = ScrollController();
  bool _tutorialScheduled = false;
  bool _isSharing = false;

  Future<void> _maybeShowStatsTutorial() async {
    if (_tutorialScheduled || !mounted) return;
    _tutorialScheduled = true;
    // Delay para que el CustomScrollView termine de renderizar sus slivers
    await Future.delayed(const Duration(milliseconds: 500));
    if (!mounted) return;
    final done = await TutorialService.isStatsTutorialDone();
    if (!done && mounted) StatisticsTutorial.show(context);
  }

  Future<void> _shareStats() async {
    if (_isSharing) return;
    setState(() => _isSharing = true);

    try {
      final l10n = AppLocalizations.of(context);
      final totalAsync = ref.read(totalStickersCountProvider);
      final uniqueCollected = ref.read(uniqueCollectedProvider);
      final categoryStatsAsync = ref.read(categoryStatsProvider);

      final total = totalAsync.value ?? 0;
      final progress = total == 0 ? 0.0 : uniqueCollected / total;
      final percentage = (progress * 100).toStringAsFixed(1);

      final stats = categoryStatsAsync.value ?? [];

      // Generate image
      final recorder = ui.PictureRecorder();
      final canvas = Canvas(recorder);
      const size = Size(1080, 1920);

      // Draw background
      final bgPaint = Paint()..color = const Color(0xFF121212);
      canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bgPaint);

      // Load and draw app icon
      try {
        final data = await rootBundle.load('assets/icon/app_icon.png');
        final list = data.buffer.asUint8List();
        final codec = await ui.instantiateImageCodec(
          list,
          targetWidth: 200,
          targetHeight: 200,
        );
        final frame = await codec.getNextFrame();
        final appIcon = frame.image;
        canvas.drawImage(
          appIcon,
          Offset((size.width - appIcon.width) / 2, 200),
          Paint(),
        );
      } catch (_) {
        // Ignore if icon fails to load
      }

      // Draw branding (App Title)
      final textPainter = TextPainter(
        text: TextSpan(
          text: l10n.appTitle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 64,
            fontWeight: FontWeight.bold,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset((size.width - textPainter.width) / 2, 440),
      );

      // Draw the card
      _drawStatsCardOnCanvas(canvas, size, total, uniqueCollected, stats, l10n);

      final picture = recorder.endRecording();
      final image = await picture.toImage(
        size.width.toInt(),
        size.height.toInt(),
      );
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      final buffer = byteData!.buffer.asUint8List();

      final tempDir = Directory.systemTemp;
      final file = File('${tempDir.path}/stats_share.png');
      await file.writeAsBytes(buffer);

      final appLink = 'https://album26.app';
      final message = l10n.shareStatisticsMessage(
        l10n.appTitle,
        percentage,
        appLink,
      );

      await SharePlus.instance.share(
        ShareParams(files: [XFile(file.path)], text: message),
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context).commonErrorWithMessage(e.toString()),
            ),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSharing = false);
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final selectedCategoryIds = ref.watch(_selectedCategoryIdsProvider);
    final sortOrder = ref.watch(_statsSortProvider);
    final categoryStatsAsync = ref.watch(categoryStatsProvider);
    final totalAsync = ref.watch(totalStickersCountProvider);
    final uniqueCollected = ref.watch(uniqueCollectedProvider);

    // Lanza el tutorial cuando el tab se activa por primera vez
    ref.listen<bool>(statisticsTabActiveProvider, (_, isActive) {
      if (isActive) _maybeShowStatsTutorial();
    });

    return PrimaryScrollController(
      controller: _scrollController,
      child: Listener(
        onPointerDown: (event) => _pointerDownX = event.localPosition.dx,
        child: GestureDetector(
          onHorizontalDragEnd: (details) {
            if (_pointerDownX < 30 &&
                details.primaryVelocity != null &&
                details.primaryVelocity! > 100) {
              Navigator.of(context).pop();
            }
          },
          child: Scaffold(
            backgroundColor: const Color(0xFF121212),
            appBar: AppBar(
              title: Text(
                l10n.statsTitle,
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
                if (_isSharing)
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Center(
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          color: Colors.amber,
                          strokeWidth: 2,
                        ),
                      ),
                    ),
                  )
                else
                  IconButton(
                    icon: const Icon(Icons.share, color: Colors.amber),
                    tooltip: l10n.shareStatisticsTooltip,
                    onPressed: _shareStats,
                  ),
              ],
            ),
            body: RefreshIndicator(
              color: Colors.amber,
              backgroundColor: const Color(0xFF1E1E1E),
              onRefresh: ref.read(syncServiceProvider).refreshAll,
              child: CustomScrollView(
                key: const PageStorageKey('statistics_scroll'),
                primary: true,
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  // 1. Sección global de progreso (tarjeta dorada)
                  SliverToBoxAdapter(
                    child: Container(
                      key: tutorialStatsGlobalKey,
                      child: _GlobalProgressCard(
                        totalAsync: totalAsync,
                        uniqueCollected: uniqueCollected,
                        categoryStatsAsync: categoryStatsAsync,
                        l10n: l10n,
                      ),
                    ),
                  ),

                  // 2. Chips de filtro por categoría
                  categoryStatsAsync.when(
                    loading: () =>
                        const SliverToBoxAdapter(child: SizedBox.shrink()),
                    error: (e, s) =>
                        const SliverToBoxAdapter(child: SizedBox.shrink()),
                    data: (stats) => SliverToBoxAdapter(
                      child: Container(
                        key: tutorialStatsFilterKey,
                        child: _CategoryFilterChips(
                          categories: stats.map((s) => s.category).toList(),
                          selectedIds: selectedCategoryIds,
                          l10n: l10n,
                        ),
                      ),
                    ),
                  ),

                  // 3. Lista de estadísticas por categoría
                  categoryStatsAsync.when(
                    loading: () => const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.all(48),
                        child: Center(
                          child: CircularProgressIndicator(color: Colors.amber),
                        ),
                      ),
                    ),
                    error: (e, _) => SliverToBoxAdapter(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(32),
                          child: Text(
                            l10n.commonErrorWithMessage(e.toString()),
                            style: const TextStyle(color: Colors.redAccent),
                          ),
                        ),
                      ),
                    ),
                    data: (stats) {
                      // Filtrar por categorías seleccionadas
                      var filtered =
                          (selectedCategoryIds == null ||
                              selectedCategoryIds.isEmpty)
                          ? stats
                          : stats
                                .where(
                                  (s) => selectedCategoryIds.contains(
                                    s.category.id,
                                  ),
                                )
                                .toList();

                      // Ordenar según la opción activa
                      final toShow = [...filtered];
                      switch (sortOrder) {
                        case _StatsSortOrder.progressDesc:
                          toShow.sort(
                            (a, b) => b.percentage.compareTo(a.percentage),
                          );
                        case _StatsSortOrder.progressAsc:
                          toShow.sort(
                            (a, b) => a.percentage.compareTo(b.percentage),
                          );
                        case _StatsSortOrder.missingDesc:
                          toShow.sort((a, b) => b.missing.compareTo(a.missing));
                        case _StatsSortOrder.duplicatesDesc:
                          toShow.sort(
                            (a, b) =>
                                b.duplicateCopies.compareTo(a.duplicateCopies),
                          );
                        case _StatsSortOrder.category:
                          break;
                      }

                      if (toShow.isEmpty) {
                        return SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 48),
                            child: Center(
                              child: Column(
                                children: [
                                  const Icon(
                                    Icons.inbox_outlined,
                                    color: Colors.white24,
                                    size: 48,
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    l10n.statsNoStatsYet,
                                    style: const TextStyle(
                                      color: Colors.white38,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }

                      return SliverPadding(
                        padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) => _CategoryStatCard(
                              stats: toShow[index],
                              index: index,
                              l10n: l10n,
                            ),
                            childCount: toShow.length,
                          ),
                        ),
                      );
                    },
                  ),

                  const SliverToBoxAdapter(child: SizedBox(height: 16)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Helper para dibujar la tarjeta en Canvas
// ---------------------------------------------------------------------------
void _drawStatsCardOnCanvas(
  Canvas canvas,
  Size size,
  int total,
  int uniqueCollected,
  List<CategoryStats> stats,
  AppLocalizations l10n,
) {
  final cardWidth = 900.0;
  final cardHeight = 600.0;
  final cardRect = Rect.fromCenter(
    center: Offset(size.width / 2, size.height / 2 + 100),
    width: cardWidth,
    height: cardHeight,
  );

  // Shadow
  canvas.drawRRect(
    RRect.fromRectAndRadius(
      cardRect.translate(0, 20),
      const Radius.circular(48),
    ),
    Paint()
      ..color = Colors.amber.withValues(alpha: 0.35)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 36),
  );

  // Card Background Gradient
  final gradient = ui.Gradient.linear(cardRect.topLeft, cardRect.bottomRight, [
    Colors.amber.shade400,
    Colors.amber.shade800,
  ]);
  canvas.drawRRect(
    RRect.fromRectAndRadius(cardRect, const Radius.circular(48)),
    Paint()..shader = gradient,
  );

  // Draw content inside card
  final progress = total == 0 ? 0.0 : uniqueCollected / total;
  final percentage = progress * 100;
  final missing = total - uniqueCollected;

  // Big Circular Progress
  final circleCenter = cardRect.topLeft + const Offset(180, 180);
  final circleRadius = 110.0;
  final strokeWidth = 24.0;

  // Bg Arc
  canvas.drawArc(
    Rect.fromCircle(center: circleCenter, radius: circleRadius),
    0,
    2 * math.pi,
    false,
    Paint()
      ..color = Colors.black26
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round,
  );

  // Fg Arc
  if (progress > 0) {
    canvas.drawArc(
      Rect.fromCircle(center: circleCenter, radius: circleRadius),
      -math.pi / 2,
      2 * math.pi * progress.clamp(0.0, 1.0),
      false,
      Paint()
        ..color = Colors.white
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round,
    );
  }

  // Percentage Text
  final pctPainter = TextPainter(
    text: TextSpan(
      text: '${percentage.toStringAsFixed(1)}%',
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 48,
      ),
    ),
    textDirection: TextDirection.ltr,
  );
  pctPainter.layout();
  pctPainter.paint(
    canvas,
    circleCenter - Offset(pctPainter.width / 2, pctPainter.height / 2),
  );

  // Texts on the right
  final textStartX = circleCenter.dx + circleRadius + 60;
  var textStartY = cardRect.top + 80;

  void drawText(String text, double size, FontWeight weight, Color color) {
    final tp = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(color: color, fontSize: size, fontWeight: weight),
      ),
      textDirection: TextDirection.ltr,
    );
    tp.layout();
    tp.paint(canvas, Offset(textStartX, textStartY));
    textStartY += tp.height + 16;
  }

  drawText(l10n.homeGlobalProgressTitle, 36, FontWeight.bold, Colors.black);
  textStartY += 16;
  drawText(
    '${l10n.statsTotalLabel}: $total',
    28,
    FontWeight.w600,
    Colors.black87,
  );
  drawText(
    '${l10n.statsCollectedLabel}: $uniqueCollected',
    28,
    FontWeight.w600,
    Colors.black87,
  );
  drawText(
    '${l10n.filterMissing}: $missing',
    28,
    FontWeight.w600,
    Colors.black87,
  );

  // Linear Progress
  final barRect = Rect.fromLTWH(
    cardRect.left + 60,
    cardRect.top + 360,
    cardWidth - 120,
    20,
  );
  canvas.drawRRect(
    RRect.fromRectAndRadius(barRect, const Radius.circular(10)),
    Paint()..color = Colors.black12,
  );
  if (progress > 0) {
    final progressRect = Rect.fromLTWH(
      barRect.left,
      barRect.top,
      barRect.width * progress.clamp(0.0, 1.0),
      barRect.height,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(progressRect, const Radius.circular(10)),
      Paint()..color = Colors.white,
    );
  }

  // Collected Count Text
  final countPainter = TextPainter(
    text: TextSpan(
      text: l10n.homeCollectedCount(uniqueCollected, total),
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    ),
    textDirection: TextDirection.ltr,
  );
  countPainter.layout();
  countPainter.paint(
    canvas,
    Offset(barRect.right - countPainter.width, barRect.bottom + 16),
  );

  // Divider
  final dividerY = barRect.bottom + 80;
  canvas.drawLine(
    Offset(cardRect.left + 60, dividerY),
    Offset(cardRect.right - 60, dividerY),
    Paint()
      ..color = Colors.black26
      ..strokeWidth = 2,
  );

  // Bottom Stats
  final duplicateCopies = stats.fold(0, (sum, s) => sum + s.duplicateCopies);
  final completedCategories = stats.where((s) => s.percentage >= 1.0).length;

  final bottomY = dividerY + 30;

  void drawBottomStat(String value, String label, double xCenter) {
    final valTp = TextPainter(
      text: TextSpan(
        text: value,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 36,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    valTp.layout();
    valTp.paint(canvas, Offset(xCenter - valTp.width / 2, bottomY));

    final lblTp = TextPainter(
      text: TextSpan(
        text: label,
        style: const TextStyle(color: Colors.black87, fontSize: 24),
      ),
      textDirection: TextDirection.ltr,
    );
    lblTp.layout();
    lblTp.paint(
      canvas,
      Offset(xCenter - lblTp.width / 2, bottomY + valTp.height + 8),
    );
  }

  drawBottomStat(
    '$duplicateCopies',
    l10n.statsDuplicateCopiesLabel,
    cardRect.left + cardWidth * 0.25,
  );
  drawBottomStat(
    '$completedCategories / ${stats.length}',
    l10n.statsCompletedCategories,
    cardRect.left + cardWidth * 0.75,
  );
}

// ---------------------------------------------------------------------------
// Tarjeta de progreso global
// ---------------------------------------------------------------------------
class _GlobalProgressCard extends StatelessWidget {
  final AsyncValue<int> totalAsync;
  final int uniqueCollected;
  final AsyncValue<List<CategoryStats>> categoryStatsAsync;
  final AppLocalizations l10n;

  const _GlobalProgressCard({
    required this.totalAsync,
    required this.uniqueCollected,
    required this.categoryStatsAsync,
    required this.l10n,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Tarjeta dorada principal ---
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.amber.shade400, Colors.amber.shade800],
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.amber.withValues(alpha: 0.35),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: totalAsync.when(
                  loading: () => const SizedBox(
                    height: 120,
                    child: Center(
                      child: CircularProgressIndicator(color: Colors.black54),
                    ),
                  ),
                  error: (e, s) => Text(
                    l10n.homeProgressError,
                    style: const TextStyle(color: Colors.black),
                  ),
                  data: (total) {
                    final progress = total == 0 ? 0.0 : uniqueCollected / total;
                    final percentage = progress * 100;
                    final missing = total - uniqueCollected;

                    return Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Círculo de progreso grande
                            _BigCircularProgress(
                              progress: progress,
                              percentage: percentage,
                            ),
                            const SizedBox(width: 24),
                            // Stats a la derecha del círculo
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    l10n.homeGlobalProgressTitle,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 14),
                                  _StatRowItem(
                                    icon: Icons.style_rounded,
                                    label: l10n.statsTotalLabel,
                                    value: '$total',
                                  ),
                                  const SizedBox(height: 8),
                                  _StatRowItem(
                                    icon: Icons.check_circle_rounded,
                                    label: l10n.statsCollectedLabel,
                                    value: '$uniqueCollected',
                                  ),
                                  const SizedBox(height: 8),
                                  _StatRowItem(
                                    icon: Icons.radio_button_unchecked_rounded,
                                    label: l10n.filterMissing,
                                    value: '$missing',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        // Barra de progreso lineal
                        const SizedBox(height: 18),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: LinearProgressIndicator(
                            value: progress,
                            backgroundColor: Colors.black12,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                            minHeight: 10,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            l10n.homeCollectedCount(uniqueCollected, total),
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),

                        // Separador y stats extras (duplicados / completas)
                        categoryStatsAsync.whenOrNull(
                              data: (stats) {
                                final duplicateCopies = stats.fold(
                                  0,
                                  (sum, s) => sum + s.duplicateCopies,
                                );
                                final completedCategories = stats
                                    .where((s) => s.percentage >= 1.0)
                                    .length;
                                return Column(
                                  children: [
                                    const SizedBox(height: 16),
                                    const Divider(
                                      color: Colors.black26,
                                      height: 1,
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        _BottomStatPill(
                                          icon: Icons.copy_all_rounded,
                                          label: l10n.statsDuplicateCopiesLabel,
                                          value: '$duplicateCopies',
                                        ),
                                        _BottomStatPill(
                                          icon: Icons.emoji_events_rounded,
                                          label: l10n.statsCompletedCategories,
                                          value:
                                              '$completedCategories / ${stats.length}',
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            ) ??
                            const SizedBox.shrink(),
                      ],
                    );
                  },
                ),
              ),

              // --- Tarjetas de mejor / peor categoría ---
              categoryStatsAsync.whenOrNull(
                    data: (stats) {
                      final valid = stats.where((s) => s.total > 0).toList();
                      if (valid.isEmpty) return null;

                      final sorted = [...valid]
                        ..sort((a, b) => b.percentage.compareTo(a.percentage));
                      final best = sorted.first;
                      final worst = sorted.last;

                      return Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Row(
                          children: [
                            Expanded(
                              child: _HighlightMiniCard(
                                icon: Icons.emoji_events_rounded,
                                accentColor: Colors.amber,
                                title: l10n.statsBestCategory,
                                name:
                                    '${best.category.emoji} ${best.category.name}',
                                value:
                                    '${(best.percentage * 100).toStringAsFixed(0)}%',
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _HighlightMiniCard(
                                icon: Icons.flag_rounded,
                                accentColor: Colors.redAccent,
                                title: l10n.statsWorstCategory,
                                name:
                                    '${worst.category.emoji} ${worst.category.name}',
                                value:
                                    '${worst.missing} ${l10n.filterMissing.toLowerCase()}',
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ) ??
                  const SizedBox.shrink(),
            ],
          ),
        )
        .animate()
        .fadeIn(duration: 600.ms)
        .slideY(begin: 0.08, end: 0, duration: 600.ms, curve: Curves.easeOut);
  }
}

// ---------------------------------------------------------------------------
// Círculo de progreso grande (CustomPainter)
// ---------------------------------------------------------------------------
class _BigCircularProgress extends StatelessWidget {
  final double progress;
  final double percentage;

  const _BigCircularProgress({
    required this.progress,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      height: 110,
      child: CustomPaint(
        painter: _ArcPainter(
          progress: progress,
          bgColor: Colors.black26,
          fgColor: Colors.white,
          strokeWidth: 12,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${percentage.toStringAsFixed(1)}%',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Círculo de progreso pequeño (para cada categoría)
// ---------------------------------------------------------------------------
class _SmallCircularProgress extends StatelessWidget {
  final double progress;
  final Color color;
  final double size;
  final double strokeWidth;
  final Widget? child;

  const _SmallCircularProgress({
    required this.progress,
    this.color = Colors.amber,
    this.size = 52,
    this.strokeWidth = 5,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _ArcPainter(
          progress: progress,
          bgColor: Colors.white10,
          fgColor: color,
          strokeWidth: strokeWidth,
        ),
        child: child != null ? Center(child: child) : null,
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// CustomPainter arco de progreso
// ---------------------------------------------------------------------------
class _ArcPainter extends CustomPainter {
  final double progress;
  final Color bgColor;
  final Color fgColor;
  final double strokeWidth;

  const _ArcPainter({
    required this.progress,
    required this.bgColor,
    required this.fgColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) - strokeWidth / 2;
    const startAngle = -math.pi / 2;

    // Fondo
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      0,
      2 * math.pi,
      false,
      Paint()
        ..color = bgColor
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round,
    );

    // Progreso
    if (progress > 0) {
      final sweepAngle = 2 * math.pi * progress.clamp(0.0, 1.0);
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        Paint()
          ..color = fgColor
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round,
      );
    }
  }

  @override
  bool shouldRepaint(_ArcPainter old) =>
      old.progress != progress || old.fgColor != fgColor;
}

// ---------------------------------------------------------------------------
// Fila de stat pequeña (dentro de la tarjeta dorada)
// ---------------------------------------------------------------------------
class _StatRowItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _StatRowItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.black54, size: 15),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(color: Colors.black87, fontSize: 13),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Pill de stat en la parte inferior de la tarjeta dorada
// ---------------------------------------------------------------------------
class _BottomStatPill extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _BottomStatPill({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.black54, size: 16),
            const SizedBox(width: 5),
            Text(
              value,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(color: Colors.black87, fontSize: 11),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Mini tarjeta de highlight (mejor / peor categoría)
// ---------------------------------------------------------------------------
class _HighlightMiniCard extends StatelessWidget {
  final IconData icon;
  final Color accentColor;
  final String title;
  final String name;
  final String value;

  const _HighlightMiniCard({
    required this.icon,
    required this.accentColor,
    required this.title,
    required this.name,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: accentColor.withValues(alpha: 0.3), width: 1),
      ),
      child: Row(
        children: [
          Icon(icon, color: accentColor, size: 22),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: accentColor,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(color: Colors.white54, fontSize: 11),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Helper para construir ítems del menú de ordenamiento
// ---------------------------------------------------------------------------
PopupMenuItem<_StatsSortOrder> _sortMenuItem(
  _StatsSortOrder value,
  IconData icon,
  String label,
  _StatsSortOrder current,
) {
  final isSelected = value == current;
  return PopupMenuItem<_StatsSortOrder>(
    value: value,
    child: Row(
      children: [
        Icon(icon, size: 16, color: isSelected ? Colors.amber : Colors.white54),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.amber : Colors.white70,
              fontSize: 13,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
        if (isSelected)
          const Icon(Icons.check_rounded, size: 14, color: Colors.amber),
      ],
    ),
  );
}

// ---------------------------------------------------------------------------
// Filtro de categorías — botón compacto que abre un bottom sheet
// ---------------------------------------------------------------------------
class _CategoryFilterChips extends ConsumerWidget {
  final List<Category> categories;
  final Set<String>? selectedIds;
  final AppLocalizations l10n;

  const _CategoryFilterChips({
    required this.categories,
    required this.selectedIds,
    required this.l10n,
  });

  void _openPicker(BuildContext context, WidgetRef ref) {
    HapticFeedback.lightImpact();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF1A1A1A),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => _CategoryPickerSheet(categories: categories, l10n: l10n),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allSelected = selectedIds == null || selectedIds!.isEmpty;
    final selectedCount = selectedIds?.length ?? 0;
    final currentSort = ref.watch(_statsSortProvider);
    final isCustomSort = currentSort != _StatsSortOrder.category;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Fila: título + botón ordenar + botón filtrar
          Row(
            children: [
              Text(
                l10n.statsCategoriesTitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              // Botón ordenar
              PopupMenuButton<_StatsSortOrder>(
                color: const Color(0xFF2A2A2A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                icon: Icon(
                  Icons.sort_rounded,
                  size: 20,
                  color: isCustomSort ? Colors.amber : Colors.white54,
                ),
                tooltip: l10n.statsSortTooltip,
                onSelected: (order) {
                  HapticFeedback.selectionClick();
                  ref.read(_statsSortProvider.notifier).set(order);
                },
                itemBuilder: (_) => [
                  _sortMenuItem(
                    _StatsSortOrder.category,
                    Icons.category_rounded,
                    l10n.statsSortByName,
                    currentSort,
                  ),
                  _sortMenuItem(
                    _StatsSortOrder.progressDesc,
                    Icons.arrow_upward_rounded,
                    l10n.statsSortByProgressDesc,
                    currentSort,
                  ),
                  _sortMenuItem(
                    _StatsSortOrder.progressAsc,
                    Icons.arrow_downward_rounded,
                    l10n.statsSortByProgressAsc,
                    currentSort,
                  ),
                  _sortMenuItem(
                    _StatsSortOrder.missingDesc,
                    Icons.radio_button_unchecked_rounded,
                    l10n.statsSortByMissing,
                    currentSort,
                  ),
                  _sortMenuItem(
                    _StatsSortOrder.duplicatesDesc,
                    Icons.copy_all_rounded,
                    l10n.statsSortByDuplicates,
                    currentSort,
                  ),
                ],
              ),
              const SizedBox(width: 4),
              // Botón filtrar por categoría
              GestureDetector(
                onTap: () => _openPicker(context, ref),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: allSelected ? const Color(0xFF2A2A2A) : Colors.amber,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.filter_list_rounded,
                        size: 15,
                        color: allSelected ? Colors.white70 : Colors.black,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        allSelected
                            ? l10n.statsCategoryPickerAll
                            : l10n.statsCategoryPickerSelected(selectedCount),
                        style: TextStyle(
                          color: allSelected ? Colors.white70 : Colors.black,
                          fontWeight: allSelected
                              ? FontWeight.normal
                              : FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      if (!allSelected) ...[
                        const SizedBox(width: 6),
                        GestureDetector(
                          onTap: () {
                            HapticFeedback.selectionClick();
                            ref
                                .read(_selectedCategoryIdsProvider.notifier)
                                .reset();
                          },
                          child: const Icon(
                            Icons.close_rounded,
                            size: 15,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Preview de categorías seleccionadas (chip row compacto)
          if (!allSelected) ...[
            const SizedBox(height: 10),
            SizedBox(
              height: 32,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: selectedCount,
                separatorBuilder: (context, index) => const SizedBox(width: 6),
                itemBuilder: (context, index) {
                  final id = selectedIds!.elementAt(index);
                  final cat = categories.firstWhere(
                    (c) => c.id == id,
                    orElse: () => categories.first,
                  );
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.amber.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.amber.withValues(alpha: 0.5),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(cat.emoji, style: const TextStyle(fontSize: 13)),
                        const SizedBox(width: 4),
                        Text(
                          cat.name,
                          style: const TextStyle(
                            color: Colors.amber,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Bottom sheet para seleccionar categorías con búsqueda
// ---------------------------------------------------------------------------
class _CategoryPickerSheet extends ConsumerStatefulWidget {
  final List<Category> categories;
  final AppLocalizations l10n;

  const _CategoryPickerSheet({required this.categories, required this.l10n});

  @override
  ConsumerState<_CategoryPickerSheet> createState() =>
      _CategoryPickerSheetState();
}

class _CategoryPickerSheetState extends ConsumerState<_CategoryPickerSheet> {
  final TextEditingController _searchCtrl = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedIds = ref.watch(_selectedCategoryIdsProvider);
    final allSelected = selectedIds == null || selectedIds.isEmpty;

    final filtered = _query.isEmpty
        ? widget.categories
        : widget.categories
              .where(
                (c) =>
                    c.name.toLowerCase().contains(_query.toLowerCase()) ||
                    c.emoji.contains(_query),
              )
              .toList();

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.7,
      minChildSize: 0.4,
      maxChildSize: 0.92,
      builder: (context, scrollCtrl) {
        return Column(
          children: [
            // Handle
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 8),
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),

            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 12),
              child: Row(
                children: [
                  Text(
                    widget.l10n.statsCategoriesTitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  if (!allSelected)
                    TextButton(
                      onPressed: () {
                        HapticFeedback.selectionClick();
                        ref.read(_selectedCategoryIdsProvider.notifier).reset();
                      },
                      child: Text(
                        widget.l10n.statsCategoryPickerClear,
                        style: const TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      widget.l10n.commonDone,
                      style: const TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Buscador
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: _searchCtrl,
                onChanged: (v) => setState(() => _query = v),
                style: const TextStyle(color: Colors.white),
                autocorrect: false,
                decoration: InputDecoration(
                  hintText: widget.l10n.statsCategoryPickerSearch,
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.amber,
                    size: 20,
                  ),
                  suffixIcon: _query.isNotEmpty
                      ? IconButton(
                          icon: const Icon(
                            Icons.close,
                            color: Colors.grey,
                            size: 18,
                          ),
                          onPressed: () {
                            _searchCtrl.clear();
                            setState(() => _query = '');
                          },
                        )
                      : null,
                  filled: true,
                  fillColor: const Color(0xFF2A2A2A),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // "Todas" chip siempre visible
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                onTap: () {
                  HapticFeedback.selectionClick();
                  ref.read(_selectedCategoryIdsProvider.notifier).reset();
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: allSelected ? Colors.amber : const Color(0xFF2A2A2A),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.select_all_rounded,
                        size: 18,
                        color: allSelected ? Colors.black : Colors.white54,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        widget.l10n.statsCategoryPickerAll,
                        style: TextStyle(
                          color: allSelected ? Colors.black : Colors.white70,
                          fontWeight: allSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Grid de categorías
            Expanded(
              child: filtered.isEmpty
                  ? Center(
                      child: Text(
                        widget.l10n.homeNoResults,
                        style: const TextStyle(color: Colors.white38),
                      ),
                    )
                  : GridView.builder(
                      controller: scrollCtrl,
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            childAspectRatio: 2.4,
                          ),
                      itemCount: filtered.length,
                      itemBuilder: (context, index) {
                        final cat = filtered[index];
                        final isSelected =
                            selectedIds != null && selectedIds.contains(cat.id);
                        return GestureDetector(
                          onTap: () {
                            HapticFeedback.selectionClick();
                            ref
                                .read(_selectedCategoryIdsProvider.notifier)
                                .toggle(cat.id);
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 180),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.amber
                                  : const Color(0xFF2A2A2A),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  cat.emoji,
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(width: 5),
                                Expanded(
                                  child: Text(
                                    cat.name,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: isSelected
                                          ? Colors.black
                                          : Colors.white70,
                                      fontWeight: isSelected
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                if (isSelected)
                                  const Icon(
                                    Icons.check_circle_rounded,
                                    size: 14,
                                    color: Colors.black,
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        );
      },
    );
  }
}

// ---------------------------------------------------------------------------
// Tarjeta de estadísticas por categoría
// ---------------------------------------------------------------------------
class _CategoryStatCard extends StatelessWidget {
  final CategoryStats stats;
  final int index;
  final AppLocalizations l10n;

  const _CategoryStatCard({
    required this.stats,
    required this.index,
    required this.l10n,
  });

  Color get _progressColor {
    final p = stats.percentage;
    if (p >= 1.0) return Colors.greenAccent.shade400;
    if (p >= 0.75) return Colors.lightGreen;
    if (p >= 0.5) return Colors.amber;
    if (p >= 0.25) return Colors.orange;
    return Colors.redAccent;
  }

  @override
  Widget build(BuildContext context) {
    final pct = (stats.percentage * 100).toStringAsFixed(0);
    final delay = (index.clamp(0, 12) * 40);

    return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: stats.percentage >= 1.0
                    ? Colors.greenAccent.withValues(alpha: 0.3)
                    : Colors.white.withValues(alpha: 0.04),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                // Círculo de progreso por categoría
                _SmallCircularProgress(
                  progress: stats.percentage,
                  color: _progressColor,
                  size: 56,
                  strokeWidth: 5,
                  child: Text(
                    stats.category.emoji,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(width: 14),

                // Contenido
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Nombre + porcentaje
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              stats.category.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '$pct%',
                            style: TextStyle(
                              color: _progressColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 7),

                      // Barra de progreso
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: stats.percentage,
                          backgroundColor: Colors.white10,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            _progressColor,
                          ),
                          minHeight: 5,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Línea de stats detalladas
                      StickerStatRow(
                        collected: stats.collected,
                        total: stats.total,
                        missing: stats.missing,
                        duplicateCopies: stats.duplicateCopies,
                        collectedColor: Colors.amber,
                        missingColor: Colors.redAccent,
                        duplicatesColor: Colors.white70,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
        .animate()
        .fadeIn(delay: delay.ms, duration: 350.ms, curve: Curves.easeOut)
        .slideX(
          begin: -0.08,
          end: 0,
          delay: delay.ms,
          duration: 350.ms,
          curve: Curves.easeOut,
        );
  }
}
