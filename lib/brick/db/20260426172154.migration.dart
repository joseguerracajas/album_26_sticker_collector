// GENERATED CODE EDIT WITH CAUTION
// THIS FILE **WILL NOT** BE REGENERATED
// This file should be version controlled and can be manually edited.
part of 'schema.g.dart';

// While migrations are intelligently created, the difference between some commands, such as
// DropTable vs. RenameTable, cannot be determined. For this reason, please review migrations after
// they are created to ensure the correct inference was made.

// The migration version must **always** mirror the file name

const List<MigrationCommand> _migration_20260426172154_up = [
  InsertTable('Album'),
  InsertTable('AlbumVariant'),
  InsertTable('AlbumVariantSticker'),
  InsertTable('UserVariantPreference'),
  InsertColumn('id', Column.varchar, onTable: 'Album', unique: true),
  InsertColumn('name', Column.varchar, onTable: 'Album'),
  InsertColumn('year', Column.integer, onTable: 'Album'),
  InsertColumn('is_active', Column.boolean, onTable: 'Album'),
  InsertColumn('cover_url', Column.varchar, onTable: 'Album'),
  InsertColumn('id', Column.varchar, onTable: 'AlbumVariant', unique: true),
  InsertColumn('album_id', Column.varchar, onTable: 'AlbumVariant'),
  InsertColumn('name', Column.varchar, onTable: 'AlbumVariant'),
  InsertColumn('is_default', Column.boolean, onTable: 'AlbumVariant'),
  InsertColumn('id', Column.varchar, onTable: 'AlbumVariantSticker', unique: true),
  InsertColumn('album_variant_id', Column.varchar, onTable: 'AlbumVariantSticker'),
  InsertColumn('sticker_id', Column.varchar, onTable: 'AlbumVariantSticker'),
  InsertColumn('album_id', Column.varchar, onTable: 'Category'),
  InsertColumn('id', Column.varchar, onTable: 'UserVariantPreference', unique: true),
  InsertColumn('user_id', Column.varchar, onTable: 'UserVariantPreference'),
  InsertColumn('album_id', Column.varchar, onTable: 'UserVariantPreference'),
  InsertColumn('album_variant_id', Column.varchar, onTable: 'UserVariantPreference'),
  InsertColumn('updated_at', Column.datetime, onTable: 'UserVariantPreference'),
  CreateIndex(columns: ['id'], onTable: 'Album', unique: true),
  CreateIndex(columns: ['id'], onTable: 'AlbumVariant', unique: true),
  CreateIndex(columns: ['id'], onTable: 'AlbumVariantSticker', unique: true),
  CreateIndex(columns: ['id'], onTable: 'UserVariantPreference', unique: true)
];

const List<MigrationCommand> _migration_20260426172154_down = [
  DropTable('Album'),
  DropTable('AlbumVariant'),
  DropTable('AlbumVariantSticker'),
  DropTable('UserVariantPreference'),
  DropColumn('id', onTable: 'Album'),
  DropColumn('name', onTable: 'Album'),
  DropColumn('year', onTable: 'Album'),
  DropColumn('is_active', onTable: 'Album'),
  DropColumn('cover_url', onTable: 'Album'),
  DropColumn('id', onTable: 'AlbumVariant'),
  DropColumn('album_id', onTable: 'AlbumVariant'),
  DropColumn('name', onTable: 'AlbumVariant'),
  DropColumn('is_default', onTable: 'AlbumVariant'),
  DropColumn('id', onTable: 'AlbumVariantSticker'),
  DropColumn('album_variant_id', onTable: 'AlbumVariantSticker'),
  DropColumn('sticker_id', onTable: 'AlbumVariantSticker'),
  DropColumn('album_id', onTable: 'Category'),
  DropColumn('id', onTable: 'UserVariantPreference'),
  DropColumn('user_id', onTable: 'UserVariantPreference'),
  DropColumn('album_id', onTable: 'UserVariantPreference'),
  DropColumn('album_variant_id', onTable: 'UserVariantPreference'),
  DropColumn('updated_at', onTable: 'UserVariantPreference'),
  DropIndex('index_Album_on_id'),
  DropIndex('index_AlbumVariant_on_id'),
  DropIndex('index_AlbumVariantSticker_on_id'),
  DropIndex('index_UserVariantPreference_on_id')
];

//
// DO NOT EDIT BELOW THIS LINE
//

@Migratable(
  version: '20260426172154',
  up: _migration_20260426172154_up,
  down: _migration_20260426172154_down,
)
class Migration20260426172154 extends Migration {
  const Migration20260426172154()
    : super(
        version: 20260426172154,
        up: _migration_20260426172154_up,
        down: _migration_20260426172154_down,
      );
}
