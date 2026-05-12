import 'package:flutter_riverpod/flutter_riverpod.dart';

// Bandeja temporal de stickers a QUITAR del inventario (solo repetidos).
// { stickerId → cantidad a quitar }
class PendingRemoveNotifier extends Notifier<Map<String, int>> {
  @override
  Map<String, int> build() => {};

  void addSticker(String code) {
    final current = state[code] ?? 0;
    state = {...state, code: current + 1};
  }

  void increment(String code) {
    if (state.containsKey(code)) {
      state = {...state, code: state[code]! + 1};
    }
  }

  void decrement(String code) {
    if (!state.containsKey(code)) return;
    final current = state[code]!;
    if (current > 1) {
      state = {...state, code: current - 1};
    } else {
      removeSticker(code);
    }
  }

  void removeSticker(String code) {
    final newState = Map<String, int>.from(state);
    newState.remove(code);
    state = newState;
  }

  void clear() => state = {};
}

final pendingRemoveProvider =
    NotifierProvider.autoDispose<PendingRemoveNotifier, Map<String, int>>(
      PendingRemoveNotifier.new,
    );
