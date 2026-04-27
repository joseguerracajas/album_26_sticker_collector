import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
import 'package:brick_sqlite/brick_sqlite.dart';
import 'package:brick_supabase/brick_supabase.dart';

@ConnectOfflineFirstWithSupabase(
  supabaseConfig: SupabaseSerializable(tableName: 'album_variants'),
)
class AlbumVariant extends OfflineFirstWithSupabaseModel {
  @Supabase(unique: true, name: 'id')
  @Sqlite(index: true, unique: true)
  final String id;

  @Supabase(name: 'album_id')
  final String albumId;

  /// Display name of the geographic variant. E.g. "LATAM", "Europa", "USA".
  @Supabase(name: 'name')
  final String name;

  /// Whether this variant is pre-selected when a user first picks this album.
  @Supabase(name: 'is_default')
  final bool isDefault;

  AlbumVariant({
    required this.id,
    required this.albumId,
    required this.name,
    required this.isDefault,
  });

  AlbumVariant copyWith({
    String? id,
    String? albumId,
    String? name,
    bool? isDefault,
  }) {
    return AlbumVariant(
      id: id ?? this.id,
      albumId: albumId ?? this.albumId,
      name: name ?? this.name,
      isDefault: isDefault ?? this.isDefault,
    );
  }
}
