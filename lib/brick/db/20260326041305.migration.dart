// GENERATED CODE EDIT WITH CAUTION
// THIS FILE **WILL NOT** BE REGENERATED
// This file should be version controlled and can be manually edited.
part of 'schema.g.dart';

// While migrations are intelligently created, the difference between some commands, such as
// DropTable vs. RenameTable, cannot be determined. For this reason, please review migrations after
// they are created to ensure the correct inference was made.

// The migration version must **always** mirror the file name

const List<MigrationCommand> _migration_20260326041305_up = [
  InsertColumn('id', Column.varchar, onTable: 'Inventory', unique: true),
  CreateIndex(columns: ['id'], onTable: 'Inventory', unique: true)
];

const List<MigrationCommand> _migration_20260326041305_down = [
  DropColumn('id', onTable: 'Inventory'),
  DropIndex('index_Inventory_on_id')
];

//
// DO NOT EDIT BELOW THIS LINE
//

@Migratable(
  version: '20260326041305',
  up: _migration_20260326041305_up,
  down: _migration_20260326041305_down,
)
class Migration20260326041305 extends Migration {
  const Migration20260326041305()
    : super(
        version: 20260326041305,
        up: _migration_20260326041305_up,
        down: _migration_20260326041305_down,
      );
}
