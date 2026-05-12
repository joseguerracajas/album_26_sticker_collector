// Archivo: lib/core/tutorial/tutorial_service.dart
//
// Gestiona si cada tutorial ya fue visto (usando SharedPreferences).

import 'package:shared_preferences/shared_preferences.dart';

class TutorialService {
  static const _keyHomeTutorialDone = 'tutorial_home_v1';
  static const _keyGlobalTutorialDone = 'tutorial_global_v1';
  static const _keyCategoryTutorialDone = 'tutorial_category_v1';
  static const _keyLookupTutorialDone = 'tutorial_lookup_v1';
  // Compartido entre GlobalCollectionScreen y CategoryDetailScreen
  static const _keyStickerGridTutorialDone = 'tutorial_sticker_grid_v1';

  // ── Home tutorial ─────────────────────────────────────────────────────────
  static Future<bool> isHomeTutorialDone() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyHomeTutorialDone) ?? false;
  }

  static Future<void> markHomeTutorialDone() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyHomeTutorialDone, true);
  }

  // ── Global collection tutorial ────────────────────────────────────────────
  static Future<bool> isGlobalTutorialDone() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyGlobalTutorialDone) ?? false;
  }

  static Future<void> markGlobalTutorialDone() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyGlobalTutorialDone, true);
  }

  // ── Category detail tutorial ──────────────────────────────────────────────
  static Future<bool> isCategoryTutorialDone() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyCategoryTutorialDone) ?? false;
  }

  static Future<void> markCategoryTutorialDone() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyCategoryTutorialDone, true);
  }

  // ── Lookup tutorial ───────────────────────────────────────────────────────
  static Future<bool> isLookupTutorialDone() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyLookupTutorialDone) ?? false;
  }

  static Future<void> markLookupTutorialDone() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyLookupTutorialDone, true);
  }

  // ── Sticker grid tutorial (compartido: GlobalCollection + CategoryDetail) ───────
  static Future<bool> isStickerGridTutorialDone() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyStickerGridTutorialDone) ?? false;
  }

  static Future<void> markStickerGridTutorialDone() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyStickerGridTutorialDone, true);
  }

  /// Para development/testing: resetea todos los tutoriales.
  static Future<void> resetAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyHomeTutorialDone);
    await prefs.remove(_keyGlobalTutorialDone);
    await prefs.remove(_keyCategoryTutorialDone);
    await prefs.remove(_keyLookupTutorialDone);
    await prefs.remove(_keyStickerGridTutorialDone);
  }
}
