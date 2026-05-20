// Archivo: test/features/catalog/presentation/providers/statistics_notifier_test.dart

import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:share_plus/share_plus.dart';
import 'package:share_plus_platform_interface/share_plus_platform_interface.dart';

import 'package:album_26_sticker_collector/features/catalog/presentation/providers/statistics_notifier.dart';
import 'package:album_26_sticker_collector/features/inventory/data/stats_provider.dart';
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';

// Mocks
class MockPathProviderPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements PathProviderPlatform {}

class MockSharePlusPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements SharePlusPlatform {}

class MockRenderRepaintBoundary extends Mock implements RenderRepaintBoundary {}

class MockUiImage extends Mock implements ui.Image {}

class MockByteData extends Mock implements ByteData {}

void main() {
  group('StatisticsNotifier', () {
    late MockPathProviderPlatform mockPathProviderPlatform;
    late MockSharePlusPlatform mockSharePlusPlatform;
    late ProviderContainer container;

    setUp(() {
      mockPathProviderPlatform = MockPathProviderPlatform();
      mockSharePlusPlatform = MockSharePlusPlatform();

      PathProviderPlatform.instance = mockPathProviderPlatform;
      SharePlusPlatform.instance = mockSharePlusPlatform;

      when(() => mockPathProviderPlatform.getTemporaryPath())
          .thenAnswer((_) async => '/tmp');

      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('shareStatistics generates image and shares successfully', () async {
      final l10n = AppLocalizationsEn();
      final globalKey = GlobalKey();
      final mockRenderRepaintBoundary = MockRenderRepaintBoundary();
      final mockUiImage = MockUiImage();
      final mockByteData = MockByteData();

      // Mock the context and render object
      final element = Builder(builder: (context) {
        globalKey.currentContext?.findRenderObject = () => mockRenderRepaintBoundary;
        return const SizedBox();
      }).createElement();
      
      // Mock the toImage method
      when(() => mockRenderRepaintBoundary.toImage(pixelRatio: any(named: 'pixelRatio')))
          .thenAnswer((_) async => mockUiImage);
      when(() => mockUiImage.toByteData(format: ui.ImageByteFormat.png))
          .thenAnswer((_) async => mockByteData);
      when(() => mockByteData.buffer).thenReturn(Uint8List(0).buffer);

      // Mock stats providers
      container.read(totalStickersCountProvider.notifier).state = const AsyncData(100);
      container.read(uniqueCollectedProvider.notifier).state = 50;

      // Mock shareXFiles
      when(() => mockSharePlusPlatform.shareXFiles(
            any(),
            text: any(named: 'text'),
            subject: any(named: 'subject'),
            sharePositionOrigin: any(named: 'sharePositionOrigin'),
          )).thenAnswer((_) async => const ShareResult('share', ShareResultStatus.success));

      // Build a MaterialApp to provide a context for AppLocalizations
      await tester.pumpWidget(MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Builder(builder: (context) {
          return ProviderScope(
            parent: container,
            child: Scaffold(
              key: globalKey, // Assign the GlobalKey to a widget in the tree
              body: const Text('Test'),
            ),
          );
        }),
      ));

      // Ensure the element is mounted before calling findRenderObject
      await tester.pumpAndSettle();

      // Call the share method
      await container.read(statisticsNotifierProvider.notifier).shareStatistics(element, globalKey);

      // Verify interactions
      verify(() => mockRenderRepaintBoundary.toImage(pixelRatio: 3.0)).called(1);
      verify(() => mockUiImage.toByteData(format: ui.ImageByteFormat.png)).called(1);
      verify(() => mockPathProviderPlatform.getTemporaryPath()).called(1);
      verify(() => mockSharePlusPlatform.shareXFiles(
            any(that: isA<List<XFile>>().having((p) => p.first.path, 'path', '/tmp/statistics.png')),
            text: l10n.shareStatisticsMessage(percentage: '50', appLink: 'https://example.com/album26', appTitle: l10n.appTitle),
          )).called(1);

      expect(container.read(statisticsNotifierProvider), isA<AsyncData<void>>());
    });

    test('shareStatistics handles error gracefully', () async {
      final l10n = AppLocalizationsEn();
      final globalKey = GlobalKey();
      final mockRenderRepaintBoundary = MockRenderRepaintBoundary();

      // Mock the context and render object
      final element = Builder(builder: (context) {
        globalKey.currentContext?.findRenderObject = () => mockRenderRepaintBoundary;
        return const SizedBox();
      }).createElement();

      // Mock toImage to throw an error
      when(() => mockRenderRepaintBoundary.toImage(pixelRatio: any(named: 'pixelRatio')))
          .thenThrow(Exception('Image generation failed'));

      // Build a MaterialApp to provide a context for AppLocalizations and ScaffoldMessenger
      final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
      await tester.pumpWidget(MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        scaffoldMessengerKey: scaffoldMessengerKey,
        home: Builder(builder: (context) {
          return ProviderScope(
            parent: container,
            child: Scaffold(
              key: globalKey,
              body: const Text('Test'),
            ),
          );
        }),
      ));

      await tester.pumpAndSettle();

      // Call the share method and expect it to throw (caught by AsyncValue.guard)
      await container.read(statisticsNotifierProvider.notifier).shareStatistics(element, globalKey);

      // Verify that an error state is set and a SnackBar is shown
      expect(container.read(statisticsNotifierProvider), isA<AsyncError>());
      expect(scaffoldMessengerKey.currentState!.mounted, isTrue);
      expect(find.text(l10n.commonErrorWithMessage('Exception: Image generation failed')), findsOneWidget);
    });
  });
}
