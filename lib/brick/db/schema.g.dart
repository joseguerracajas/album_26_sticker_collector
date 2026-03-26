// GENERATED CODE DO NOT EDIT
// This file should be version controlled
import 'package:brick_sqlite/db.dart';
part '20260326041305.migration.dart';
part '20260324221334.migration.dart';

/// All intelligently-generated migrations from all `@Migratable` classes on disk
final migrations = <Migration>{
  const Migration20260326041305(),const Migration20260324221334()};

/// A consumable database structure including the latest generated migration.
final schema = Schema(
  20260324221334,
  generatorVersion: 1,
  tables: <SchemaTable>{
    SchemaTable(
      'Category',
      columns: <SchemaColumn>{
        SchemaColumn(
          '_brick_id',
          Column.integer,
          autoincrement: true,
          nullable: false,
          isPrimaryKey: true,
        ),
        SchemaColumn('id', Column.varchar, unique: true),
        SchemaColumn('name', Column.varchar),
        SchemaColumn('order_index', Column.integer),
        SchemaColumn('background_url', Column.varchar),
        SchemaColumn('icon_url', Column.varchar),
        SchemaColumn('emoji', Column.varchar),
      },
      indices: <SchemaIndex>{
        SchemaIndex(columns: ['id'], unique: true),
      },
    ),
    SchemaTable(
      'Sticker',
      columns: <SchemaColumn>{
        SchemaColumn(
          '_brick_id',
          Column.integer,
          autoincrement: true,
          nullable: false,
          isPrimaryKey: true,
        ),
        SchemaColumn('id', Column.varchar, unique: true),
        SchemaColumn('category_id', Column.varchar),
        SchemaColumn('sticker_code', Column.varchar),
        SchemaColumn('description', Column.varchar),
        SchemaColumn('order_index', Column.integer),
      },
      indices: <SchemaIndex>{
        SchemaIndex(columns: ['id'], unique: true),
      },
    ),
    SchemaTable(
      'StickerVariant',
      columns: <SchemaColumn>{
        SchemaColumn(
          '_brick_id',
          Column.integer,
          autoincrement: true,
          nullable: false,
          isPrimaryKey: true,
        ),
        SchemaColumn('id', Column.varchar, unique: true),
        SchemaColumn('name', Column.varchar),
        SchemaColumn('hex_color', Column.varchar),
        SchemaColumn('is_special', Column.boolean),
        SchemaColumn('icon_url', Column.varchar),
        SchemaColumn('order_index', Column.integer),
      },
      indices: <SchemaIndex>{
        SchemaIndex(columns: ['id'], unique: true),
      },
    ),
    SchemaTable(
      'Inventory',
      columns: <SchemaColumn>{
        SchemaColumn(
          '_brick_id',
          Column.integer,
          autoincrement: true,
          nullable: false,
          isPrimaryKey: true,
        ),
        SchemaColumn('id', Column.varchar, unique: true),
        SchemaColumn('user_id', Column.varchar),
        SchemaColumn('sticker_id', Column.varchar),
        SchemaColumn('variant_id', Column.varchar),
        SchemaColumn('quantity', Column.integer),
        SchemaColumn('last_updated', Column.datetime),
      },
      indices: <SchemaIndex>{
        SchemaIndex(columns: ['id'], unique: true),
      },
    ),
  },
);
