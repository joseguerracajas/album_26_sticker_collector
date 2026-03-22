import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../main.dart';

// Usamos FutureProvider porque solo necesitamos leer esta lista una vez
final variantsProvider = FutureProvider<List<Map<String, dynamic>>>((
  ref,
) async {
  final response = await supabase
      .from('sticker_variants')
      .select('id, name')
      .order('id', ascending: true); // Puedes ordenarlo como prefieras

  return List<Map<String, dynamic>>.from(response);
});
