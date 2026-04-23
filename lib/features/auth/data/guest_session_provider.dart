import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const guestInventoryUserId = '__guest_local_user__';
const _guestModeKey = 'guest_mode_enabled';

final guestSessionProvider = AsyncNotifierProvider<GuestSessionNotifier, bool>(
  GuestSessionNotifier.new,
);

class GuestSessionNotifier extends AsyncNotifier<bool> {
  @override
  Future<bool> build() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_guestModeKey) ?? false;
  }

  Future<void> enableGuestMode() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_guestModeKey, true);
    state = const AsyncData(true);
  }

  Future<void> disableGuestMode() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_guestModeKey, false);
    state = const AsyncData(false);
  }
}
