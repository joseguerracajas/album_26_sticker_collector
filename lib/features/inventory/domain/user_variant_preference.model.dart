import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
import 'package:brick_sqlite/brick_sqlite.dart';
import 'package:brick_supabase/brick_supabase.dart';
import 'package:uuid/uuid.dart';

/// Records which geographic album variant the user has selected for each album.
///
/// One row per (userId, albumId) pair.
/// Changing variant = UPDATE albumVariantId — inventory is NEVER modified.
@ConnectOfflineFirstWithSupabase(
  supabaseConfig: SupabaseSerializable(tableName: 'user_variant_preferences'),
)
class UserVariantPreference extends OfflineFirstWithSupabaseModel {
  @Supabase(unique: true, name: 'id')
  @Sqlite(index: true, unique: true)
  final String id;

  @Supabase(name: 'user_id')
  final String userId;

  @Supabase(name: 'album_id')
  final String albumId;

  @Supabase(name: 'album_variant_id')
  final String albumVariantId;

  @Supabase(name: 'updated_at')
  final DateTime? updatedAt;

  UserVariantPreference({
    String? id,
    required this.userId,
    required this.albumId,
    required this.albumVariantId,
    this.updatedAt,
  }) : id = id ?? const Uuid().v4();

  UserVariantPreference copyWith({
    String? id,
    String? userId,
    String? albumId,
    String? albumVariantId,
    DateTime? updatedAt,
  }) {
    return UserVariantPreference(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      albumId: albumId ?? this.albumId,
      albumVariantId: albumVariantId ?? this.albumVariantId,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
