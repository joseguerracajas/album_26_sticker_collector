import 'package:album_26_sticker_collector/brick/app_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/sticker.dart';

// Usamos .family para poder pasarle un parámetro (el categoryId) al provider

final stickersByCategoryProvider = FutureProvider.family<List<Sticker>, String>((
  ref,
  categoryId,
) async {
  // 1. Le pedimos TODOS los cromos a nuestro Gerente.
  // (La primera vez los saca de SQLite, las siguientes veces de la RAM al instante).
  final allStickers = await AppRepository().get<Sticker>();

  // 2. Filtramos usando Dart puro
  final categoryStickers = allStickers
      .where((sticker) => sticker.categoryId == categoryId)
      .toList();

  // 3. Ordenamos usando Dart puro
  categoryStickers.sort((a, b) => a.orderIndex.compareTo(b.orderIndex));

  return categoryStickers;
});
