// GENERATED CODE EDIT WITH CAUTION
// THIS FILE **WILL NOT** BE REGENERATED
// This file should be version controlled and can be manually edited.
part of 'schema.g.dart';

// While migrations are intelligently created, the difference between some commands, such as
// DropTable vs. RenameTable, cannot be determined. For this reason, please review migrations after
// they are created to ensure the correct inference was made.

// The migration version must **always** mirror the file name

const List<MigrationCommand> _migration_20260324221334_up = [
  InsertTable('Category'),
  InsertTable('Sticker'),
  InsertTable('StickerVariant'),
  InsertTable('Inventory'),
  InsertColumn('id', Column.varchar, onTable: 'Category', unique: true),
  InsertColumn('name', Column.varchar, onTable: 'Category'),
  InsertColumn('order_index', Column.integer, onTable: 'Category'),
  InsertColumn('background_url', Column.varchar, onTable: 'Category'),
  InsertColumn('icon_url', Column.varchar, onTable: 'Category'),
  InsertColumn('emoji', Column.varchar, onTable: 'Category'),
  InsertColumn('id', Column.varchar, onTable: 'Sticker', unique: true),
  InsertColumn('category_id', Column.varchar, onTable: 'Sticker'),
  InsertColumn('sticker_code', Column.varchar, onTable: 'Sticker'),
  InsertColumn('description', Column.varchar, onTable: 'Sticker'),
  InsertColumn('order_index', Column.integer, onTable: 'Sticker'),
  InsertColumn('id', Column.varchar, onTable: 'StickerVariant', unique: true),
  InsertColumn('name', Column.varchar, onTable: 'StickerVariant'),
  InsertColumn('hex_color', Column.varchar, onTable: 'StickerVariant'),
  InsertColumn('is_special', Column.boolean, onTable: 'StickerVariant'),
  InsertColumn('icon_url', Column.varchar, onTable: 'StickerVariant'),
  InsertColumn('order_index', Column.integer, onTable: 'StickerVariant'),
  InsertColumn('user_id', Column.varchar, onTable: 'Inventory'),
  InsertColumn('sticker_id', Column.varchar, onTable: 'Inventory'),
  InsertColumn('variant_id', Column.varchar, onTable: 'Inventory'),
  InsertColumn('quantity', Column.integer, onTable: 'Inventory'),
  InsertColumn('last_updated', Column.datetime, onTable: 'Inventory'),
  CreateIndex(columns: ['id'], onTable: 'Category', unique: true),
  CreateIndex(columns: ['id'], onTable: 'Sticker', unique: true),
  CreateIndex(columns: ['id'], onTable: 'StickerVariant', unique: true)
];

const List<MigrationCommand> _migration_20260324221334_down = [
  DropTable('Category'),
  DropTable('Sticker'),
  DropTable('StickerVariant'),
  DropTable('Inventory'),
  DropColumn('id', onTable: 'Category'),
  DropColumn('name', onTable: 'Category'),
  DropColumn('order_index', onTable: 'Category'),
  DropColumn('background_url', onTable: 'Category'),
  DropColumn('icon_url', onTable: 'Category'),
  DropColumn('emoji', onTable: 'Category'),
  DropColumn('id', onTable: 'Sticker'),
  DropColumn('category_id', onTable: 'Sticker'),
  DropColumn('sticker_code', onTable: 'Sticker'),
  DropColumn('description', onTable: 'Sticker'),
  DropColumn('order_index', onTable: 'Sticker'),
  DropColumn('id', onTable: 'StickerVariant'),
  DropColumn('name', onTable: 'StickerVariant'),
  DropColumn('hex_color', onTable: 'StickerVariant'),
  DropColumn('is_special', onTable: 'StickerVariant'),
  DropColumn('icon_url', onTable: 'StickerVariant'),
  DropColumn('order_index', onTable: 'StickerVariant'),
  DropColumn('user_id', onTable: 'Inventory'),
  DropColumn('sticker_id', onTable: 'Inventory'),
  DropColumn('variant_id', onTable: 'Inventory'),
  DropColumn('quantity', onTable: 'Inventory'),
  DropColumn('last_updated', onTable: 'Inventory'),
  DropIndex('index_Category_on_id'),
  DropIndex('index_Sticker_on_id'),
  DropIndex('index_StickerVariant_on_id')
];

//
// DO NOT EDIT BELOW THIS LINE
//

@Migratable(
  version: '20260324221334',
  up: _migration_20260324221334_up,
  down: _migration_20260324221334_down,
)
class Migration20260324221334 extends Migration {
  const Migration20260324221334()
    : super(
        version: 20260324221334,
        up: _migration_20260324221334_up,
        down: _migration_20260324221334_down,
      );
}
