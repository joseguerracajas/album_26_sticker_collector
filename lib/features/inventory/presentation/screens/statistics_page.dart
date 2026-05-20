import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:album_26_sticker_collector/features/inventory/presentation/widgets/statistics_share_service.dart';
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';

class StatisticsPage extends ConsumerWidget {
  final GlobalKey repaintBoundaryKey = GlobalKey();

  StatisticsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.statistics),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () async {
              await StatisticsShareService.shareStatisticsAsImage(context, repaintBoundaryKey);
            },
          ),
        ],
      ),
      body: RepaintBoundary(
        key: repaintBoundaryKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                l10n.statistics,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              // Add statistics widgets here
            ],
          ),
        ),
      ),
    );
  }
}