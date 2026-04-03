import 'package:album_26_sticker_collector/features/inventory/domain/scanned_sticker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// --- EL ESTADO TEMPORAL (Bandeja de Escaneo) ---
// 🔥 CORRECCIÓN: En Riverpod 3.x manual, extendemos de Notifier a secas
class PendingScansNotifier extends Notifier<List<ScannedSticker>> {
  @override
  List<ScannedSticker> build() => [];

  void addSticker(String code) {
    // Evitamos agregar el mismo cromo en la bandeja repetidas veces seguidas por error
    if (state.isNotEmpty && state.last.code == code) return;

    state = [...state, ScannedSticker(code: code, timestamp: DateTime.now())];
  }

  void removeAt(int index) {
    final newState = List<ScannedSticker>.from(state);
    newState.removeAt(index);
    state = newState;
  }

  void clear() => state = [];
}

final pendingScansProvider =
    NotifierProvider.autoDispose<PendingScansNotifier, List<ScannedSticker>>(
      PendingScansNotifier.new,
    );
