import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
import 'package:brick_sqlite/brick_sqlite.dart';

import 'package:brick_supabase/brick_supabase.dart';

@ConnectOfflineFirstWithSupabase(
  supabaseConfig: SupabaseSerializable(tableName: 'sticker_variants'),
)
class StickerVariant extends OfflineFirstWithSupabaseModel {
  @Supabase(unique: true, name: 'id')
  @Sqlite(index: true, unique: true)
  final String id;
  final String name;
  @Supabase(name: 'hex_color')
  final String hexColor;
  @Supabase(name: 'is_special')
  final bool? isSpecial;
  @Supabase(name: 'icon_url')
  final String? iconUrl;
  @Supabase(name: 'order_index')
  final int orderIndex;

  StickerVariant({
    required this.id,
    required this.name,
    required this.hexColor,
    this.isSpecial = false,
    this.iconUrl,
    required this.orderIndex,
  });
}
