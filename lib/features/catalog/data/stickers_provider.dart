import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../main.dart'; // Tu instancia de supabase
import '../domain/sticker.dart';

// Usamos .family para poder pasarle un parámetro (el categoryId) al provider
final stickersByCategoryProvider = FutureProvider.family<List<Sticker>, String>(
  (ref, categoryId) async {
    final data = await supabase
        .from('stickers')
        .select()
        .eq('category_id', categoryId)
        .order('order_index', ascending: true);

    return (data as List<dynamic>).map((json) {
      return Sticker.fromMap(json as Map<String, dynamic>);
    }).toList();
  },
);
