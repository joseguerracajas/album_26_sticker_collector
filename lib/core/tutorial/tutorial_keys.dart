// Archivo: lib/core/tutorial/tutorial_keys.dart
//
// GlobalKeys usados para "apuntar" los coachmarks a widgets específicos.
// Importa este archivo desde home_screen.dart, home_tutorial.dart,
// global_collection_screen.dart y global_collection_tutorial.dart.

import 'package:flutter/material.dart';

// ── HomeScreen ────────────────────────────────────────────────────────────────
final GlobalKey tutorialProgressCardKey = GlobalKey(
  debugLabel: 'tutorialProgressCard',
);
final GlobalKey tutorialSearchBarKey = GlobalKey(
  debugLabel: 'tutorialSearchBar',
);
final GlobalKey tutorialDrawerKey = GlobalKey(debugLabel: 'tutorialDrawer');
final GlobalKey tutorialScannerKey = GlobalKey(debugLabel: 'tutorialScanner');
final GlobalKey tutorialShareKey = GlobalKey(debugLabel: 'tutorialShare');

// ── HomeScreen – primera categoría ───────────────────────────────────────────
final GlobalKey tutorialCategoryTileKey = GlobalKey(
  debugLabel: 'tutorialCategoryTile',
);

// ── GlobalCollectionScreen / CategoryDetailScreen ─────────────────────────────
final GlobalKey tutorialFilterBarKey = GlobalKey(
  debugLabel: 'tutorialFilterBar',
);
final GlobalKey tutorialStickerSearchKey = GlobalKey(
  debugLabel: 'tutorialStickerSearch',
);
final GlobalKey tutorialStickerCardKey = GlobalKey(
  debugLabel: 'tutorialStickerCard',
);
