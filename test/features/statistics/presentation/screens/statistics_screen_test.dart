import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:album_26_sticker_collector/features/statistics/presentation/screens/statistics_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  testWidgets('StatisticsScreen displays title and content', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: StatisticsScreen(),
        ),
      ),
    );

    expect(find.text('Statistics'), findsOneWidget);
    expect(find.text('Your collection statistics will appear here.'), findsOneWidget);
  });

  testWidgets('Share button exists and is tappable', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: StatisticsScreen(),
        ),
      ),
    );

    final shareButton = find.byIcon(Icons.share);
    expect(shareButton, findsOneWidget);

    await tester.tap(shareButton);
    await tester.pump();

    // Add additional checks for share functionality if needed
  });
}
