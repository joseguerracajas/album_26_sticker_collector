import 'package:album_26_sticker_collector/brick/app_repository.dart';
import 'package:album_26_sticker_collector/features/catalog/domain/sticker_variant.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Usamos FutureProvider porque solo necesitamos leer esta lista una vez
final variantsProvider = FutureProvider<List<Map<String, dynamic>>>((
  ref,
) async {
  // 1. Le pedimos a nuestro Gerente todas las variantes (instantáneo desde SQLite/RAM)
  final allVariants = await AppRepository().get<StickerVariant>();

  // 2. Las ordenamos por ID ascendente usando Dart, tal como lo hacías en SQL
  allVariants.sort((a, b) => a.id.compareTo(b.id));

  // 3. Transformamos los objetos limpios al formato Map que tu pantalla espera
  return allVariants.map((variant) {
    return {'id': variant.id, 'name': variant.name};
  }).toList();
});
