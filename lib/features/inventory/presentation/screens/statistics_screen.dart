import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:album_26_sticker_collector/features/inventory/presentation/providers/share_statistics_provider.dart';
// Assuming AppLocalizations is generated here based on standard Flutter intl setup
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StatisticsScreen extends ConsumerWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Mocking localization and progress for the sake of the feature implementation
    // final l10n = AppLocalizations.of(context)!;
    // Using hardcoded maps to simulate l10n since we can't import the generated file directly in this snippet
    final shareTooltip = 'Share Statistics'; // l10n.shareStatisticsTooltip
    final appTitle = 'Sticker Album 2026'; // l10n.appTitle
    final shareMessageTemplate = 'Check out my progress in {appTitle}! I have completed {percentage}% of my album. Download the app and collect with me: {appLink}'; // l10n.shareStatisticsMessage
    
    const double currentProgress = 45.5; // Mock progress
    final shareState = ref.watch(shareStatisticsProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E1E),
        elevation: 0,
        title: const Text('Statistics', style: TextStyle(color: Colors.white)),
        actions: [
          if (shareState.isLoading)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(color: Colors.amber, strokeWidth: 2),
                ),
              ),
            )
          else
            IconButton(
              icon: const Icon(Icons.share, color: Colors.amber),
              tooltip: shareTooltip,
              onPressed: () {
                final message = shareMessageTemplate
                    .replaceAll('{appTitle}', appTitle)
                    .replaceAll('{percentage}', currentProgress.toStringAsFixed(1))
                    .replaceAll('{appLink}', 'https://album26.com/download');

                ref.read(shareStatisticsProvider.notifier).shareProgress(
                  percentage: currentProgress,
                  appTitle: appTitle,
                  shareText: message,
                );
              },
            ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _GlobalProgressCard(percentage: currentProgress)
                  .animate()
                  .fadeIn(duration: 400.ms)
                  .slideY(begin: 0.1, end: 0),
            ],
          ),
        ),
      ),
    );
  }
}

class _GlobalProgressCard extends StatelessWidget {
  final double percentage;

  const _GlobalProgressCard({required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF1E1E1E),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Global Progress',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${percentage.toStringAsFixed(1)}%',
              style: const TextStyle(
                color: Colors.amber,
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: LinearProgressIndicator(
                value: percentage / 100,
                minHeight: 16,
                backgroundColor: const Color(0xFF121212),
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.amber),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
