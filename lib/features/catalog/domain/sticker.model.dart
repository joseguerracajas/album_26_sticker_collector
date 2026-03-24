import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
import 'package:brick_sqlite/brick_sqlite.dart';
import 'package:brick_supabase/brick_supabase.dart';

@ConnectOfflineFirstWithSupabase(
  supabaseConfig: SupabaseSerializable(tableName: 'stickers'),
)
class Sticker extends OfflineFirstWithSupabaseModel {
  @Supabase(unique: true, name: 'id')
  @Sqlite(index: true, unique: true)
  final String id;
  @Supabase(name: 'category_id')
  final String categoryId;
  @Supabase(name: 'sticker_code')
  final String stickerCode;
  @Supabase(name: 'description')
  final String? description;
  @Supabase(name: 'order_index')
  final int orderIndex;
  Sticker({
    required this.id,
    required this.categoryId,
    required this.stickerCode,
    this.description,
    required this.orderIndex,
  });
}
