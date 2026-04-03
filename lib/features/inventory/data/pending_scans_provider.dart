import 'package:flutter_riverpod/flutter_riverpod.dart';

// 🔥 Ahora usamos un Map: { "ECU 10": 2, "ARG 5": 1 }
class PendingScansNotifier extends Notifier<Map<String, int>> {
  @override
  Map<String, int> build() => {};

  void addSticker(String code) {
    // Si ya existe, le suma 1. Si no existe, lo crea con 1.
    final currentQuantity = state[code] ?? 0;
    state = {...state, code: currentQuantity + 1};
  }

  void increment(String code) {
    if (state.containsKey(code)) {
      state = {...state, code: state[code]! + 1};
    }
  }

  void decrement(String code) {
    if (!state.containsKey(code)) return;

    final currentQuantity = state[code]!;
    if (currentQuantity > 1) {
      state = {...state, code: currentQuantity - 1};
    } else {
      // Si llega a 0, lo eliminamos de la lista
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

final pendingScansProvider =
    NotifierProvider.autoDispose<PendingScansNotifier, Map<String, int>>(
      PendingScansNotifier.new,
    );
