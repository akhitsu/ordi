import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'database_migration.dart';

part 'app_database.g.dart';

class LocalUsers extends Table {
  TextColumn get uuid => text()();
  TextColumn get businessUuid => text().nullable()();
  TextColumn get name => text()();
  TextColumn get email => text()();
  TextColumn get role => text()();

  @override
  Set<Column<Object>> get primaryKey => {uuid};
}

class Businesses extends Table {
  TextColumn get uuid => text()();
  TextColumn get name => text()();
  TextColumn get timezone =>
      text().withDefault(const Constant('Asia/Jakarta'))();

  @override
  Set<Column<Object>> get primaryKey => {uuid};
}

class LocalDevices extends Table {
  TextColumn get uuid => text()();
  TextColumn get name => text()();
  TextColumn get platform => text().nullable()();
  TextColumn get appVersion => text().nullable()();
  DateTimeColumn get lastSeenAt => dateTime().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {uuid};
}

class AuthSessions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get tokenType => text().withDefault(const Constant('Bearer'))();
  TextColumn get accessToken => text()();
  TextColumn get userUuid => text()();
  TextColumn get businessUuid => text().nullable()();
  TextColumn get deviceUuid => text()();
  DateTimeColumn get createdAt => dateTime()();
}

class Outlets extends Table {
  TextColumn get uuid => text()();
  TextColumn get businessUuid => text().nullable()();
  TextColumn get name => text()();
  TextColumn get code => text().nullable()();
  TextColumn get role => text().nullable()();
  TextColumn get address => text().nullable()();
  TextColumn get phone => text().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  IntColumn get revision => integer().withDefault(const Constant(0))();
  BoolColumn get isSelected => boolean().withDefault(const Constant(false))();
  DateTimeColumn get updatedAt => dateTime().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {uuid};
}

class MenuCategories extends Table {
  TextColumn get uuid => text()();
  TextColumn get businessUuid => text().nullable()();
  TextColumn get outletUuid => text()();
  TextColumn get name => text()();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
  IntColumn get revision => integer().withDefault(const Constant(0))();
  DateTimeColumn get updatedAt => dateTime().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {uuid};
}

class MenuItems extends Table {
  TextColumn get uuid => text()();
  TextColumn get businessUuid => text().nullable()();
  TextColumn get outletUuid => text()();
  TextColumn get categoryUuid => text().nullable()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get sku => text().nullable()();
  TextColumn get imageUrl => text().named('image_url').nullable()();
  IntColumn get price => integer()();
  BoolColumn get isRetailReady =>
      boolean().withDefault(const Constant(false))();
  IntColumn get revision => integer().withDefault(const Constant(0))();
  DateTimeColumn get updatedAt => dateTime().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {uuid};
}

class PaymentMethods extends Table {
  TextColumn get uuid => text()();
  TextColumn get businessUuid => text().nullable()();
  TextColumn get name => text()();
  TextColumn get code => text()();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
  IntColumn get revision => integer().withDefault(const Constant(0))();
  DateTimeColumn get updatedAt => dateTime().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {uuid};
}

class DiningTables extends Table {
  TextColumn get uuid => text()();
  TextColumn get businessUuid => text().nullable()();
  TextColumn get outletUuid => text()();
  TextColumn get name => text()();
  TextColumn get number => text().nullable()();
  IntColumn get revision => integer().withDefault(const Constant(0))();
  DateTimeColumn get updatedAt => dateTime().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {uuid};
}

class Sales extends Table {
  TextColumn get uuid => text()();
  TextColumn get businessUuid => text().nullable()();
  TextColumn get checkoutGroupUuid => text().nullable()();
  TextColumn get outletUuid => text()();
  TextColumn get transactionType => text()
      .named('transaction_type')
      .withDefault(const Constant('take_away'))();
  TextColumn get diningTableUuid =>
      text().named('dining_table_uuid').nullable()();
  TextColumn get deviceUuid => text()();
  TextColumn get number => text().nullable()();
  TextColumn get status => text().withDefault(const Constant('completed'))();
  IntColumn get subtotal => integer()();
  IntColumn get discountTotal => integer().withDefault(const Constant(0))();
  IntColumn get taxTotal => integer().withDefault(const Constant(0))();
  IntColumn get serviceTotal => integer().withDefault(const Constant(0))();
  IntColumn get grandTotal => integer()();
  TextColumn get idempotencyKey => text()();
  TextColumn get syncStatus => text().withDefault(const Constant('pending'))();
  TextColumn get syncError => text().nullable()();
  DateTimeColumn get soldAt => dateTime()();
  DateTimeColumn get receivedAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {uuid};
}

class SaleItems extends Table {
  TextColumn get uuid => text()();
  TextColumn get saleUuid => text()();
  TextColumn get menuItemUuid => text().nullable()();
  TextColumn get name => text()();
  IntColumn get quantity => integer()();
  IntColumn get unitPrice => integer()();
  IntColumn get discountTotal => integer().withDefault(const Constant(0))();
  IntColumn get lineTotal => integer()();

  @override
  Set<Column<Object>> get primaryKey => {uuid};
}

class CashierRecaps extends Table {
  TextColumn get recapUuid => text().named('recap_uuid')();
  TextColumn get status => text()();
  DateTimeColumn get openedAt => dateTime().named('opened_at')();
  DateTimeColumn get closedAt => dateTime().named('closed_at').nullable()();
  IntColumn get outletCount => integer().withDefault(const Constant(0))();
  IntColumn get transactionCount => integer().withDefault(const Constant(0))();
  IntColumn get totalSales => integer().withDefault(const Constant(0))();
  DateTimeColumn get soldFrom => dateTime().named('sold_from').nullable()();
  DateTimeColumn get soldUntil => dateTime().named('sold_until').nullable()();
  TextColumn get notes => text().nullable()();
  TextColumn get outletsJson => text().named('outlets_json').nullable()();
  TextColumn get cashierJson => text().named('cashier_json').nullable()();
  TextColumn get deviceJson => text().named('device_json').nullable()();
  TextColumn get summaryJson => text().named('summary_json').nullable()();
  DateTimeColumn get syncedAt => dateTime().named('synced_at').nullable()();
  DateTimeColumn get updatedAt => dateTime().named('updated_at')();

  @override
  Set<Column<Object>> get primaryKey => {recapUuid};
}

class SyncQueueEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get entityType => text()();
  TextColumn get entityUuid => text()();
  TextColumn get idempotencyKey => text()();
  TextColumn get payloadJson => text()();
  TextColumn get status => text().withDefault(const Constant('pending'))();
  IntColumn get retryCount => integer().withDefault(const Constant(0))();
  TextColumn get lastError => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

@DriftDatabase(
  tables: [
    LocalUsers,
    Businesses,
    LocalDevices,
    AuthSessions,
    Outlets,
    MenuCategories,
    MenuItems,
    PaymentMethods,
    DiningTables,
    Sales,
    SaleItems,
    CashierRecaps,
    SyncQueueEntries,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase({this.onMigrationEvent, this.migrationLifecycleStore})
    : super(_openConnection());

  final void Function(DatabaseMigrationEvent event)? onMigrationEvent;
  final DatabaseMigrationLifecycleStore? migrationLifecycleStore;

  @override
  int get schemaVersion => 6;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onUpgrade: (migrator, from, to) async {
      await migrationLifecycleStore?.markPendingUpgrade(
        fromVersion: from,
        toVersion: to,
      );

      if (from < 4) {
        _emitMigrationEvent(
          'Memperbarui foto barang di database lokal...',
          progress: 0.25,
        );
        await migrator.addColumn(menuItems, menuItems.imageUrl);

        _emitMigrationEvent(
          'Menambahkan master meja ke database lokal...',
          progress: 0.55,
        );
        await migrator.createTable(diningTables);

        _emitMigrationEvent(
          'Merapikan struktur transaksi dine-in/take-away...',
          progress: 0.8,
        );
        await migrator.addColumn(sales, sales.transactionType);
        await migrator.addColumn(sales, sales.diningTableUuid);
      }

      if (from < 5) {
        _emitMigrationEvent(
          'Menambahkan cache rekap kasir ke database lokal...',
          progress: 0.9,
        );
        await migrator.createTable(cashierRecaps);
      }

      if (from < 6) {
        _emitMigrationEvent(
          'Memperbarui master outlet dari backend terbaru...',
          progress: 0.95,
        );
        await migrator.addColumn(outlets, outlets.address);
        await migrator.addColumn(outlets, outlets.phone);
        await migrator.addColumn(outlets, outlets.isActive);
        await migrator.addColumn(outlets, outlets.revision);
      }

      await migrationLifecycleStore?.clearPendingUpgrade();
    },
    beforeOpen: (details) async {
      if (details.wasCreated) {
        _emitMigrationEvent('Database lokal siap digunakan.', progress: 1);
      } else if (details.hadUpgrade) {
        await migrationLifecycleStore?.clearPendingUpgrade();
        _emitMigrationEvent('Upgrade database lokal selesai.', progress: 1);
      }
    },
  );

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'ordi_pos');
  }

  Future<void> ensureReady() async {
    await customSelect('SELECT 1').getSingle();
  }

  void _emitMigrationEvent(String message, {double? progress}) {
    onMigrationEvent?.call(
      DatabaseMigrationEvent(message: message, progress: progress),
    );
  }
}
