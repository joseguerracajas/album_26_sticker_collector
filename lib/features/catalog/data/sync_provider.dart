// Archivo: lib/features/sync/data/sync_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:album_26_sticker_collector/features/catalog/data/stickers_provider.dart';
import 'package:album_26_sticker_collector/features/inventory/data/inventory_provider.dart';

// 1. Creamos el Provider global para este servicio
final syncServiceProvider = Provider<SyncService>((ref) {
  return SyncService(ref);
});

// 2. La clase que orquesta todo
class SyncService {
  final Ref _ref; // Usamos Ref puro, no WidgetRef

  SyncService(this._ref);

  Future<void> refreshAll() async {
    // Aquí centralizas toda tu lógica de limpieza y recarga
    _ref.invalidate(stickersByCategoryProvider);

    await Future.wait([
      _ref.refresh(inventoryProvider.future),
      // Si en el futuro agregas más cosas que refrescar (ej. perfil del usuario),
      // solo lo metes aquí y toda la app se beneficia.
    ]);
  }
}
