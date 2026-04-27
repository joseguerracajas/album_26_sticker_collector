import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
import 'package:brick_sqlite/brick_sqlite.dart';

import 'package:brick_supabase/brick_supabase.dart';

@ConnectOfflineFirstWithSupabase(
  supabaseConfig: SupabaseSerializable(tableName: 'categories'),
)
class Category extends OfflineFirstWithSupabaseModel {
  @Supabase(unique: true, name: 'id')
  @Sqlite(index: true, unique: true)
  final String id;
  @Supabase(name: 'name')
  final String name;
  @Supabase(name: 'order_index')
  final int orderIndex;
  @Supabase(name: 'background_url')
  final String? backgroundUrl;
  @Supabase(name: 'icon_url')
  final String? iconUrl;
  @Supabase(name: 'emoji')
  final String emoji;

  @Supabase(name: 'album_id')
  final String? albumId;

  Category({
    required this.id,
    required this.name,
    required this.orderIndex,
    this.backgroundUrl,
    this.iconUrl,
    required this.emoji,
    this.albumId,
  });

  Category copyWith({
    String? id,
    String? name,
    int? orderIndex,
    String? backgroundUrl,
    String? iconUrl,
    String? emoji,
    String? albumId,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      orderIndex: orderIndex ?? this.orderIndex,
      backgroundUrl: backgroundUrl ?? this.backgroundUrl,
      iconUrl: iconUrl ?? this.iconUrl,
      emoji: emoji ?? this.emoji,
      albumId: albumId ?? this.albumId,
    );
  }
}
