import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

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

class Sales extends Table {
  TextColumn get uuid => text()();
  TextColumn get businessUuid => text().nullable()();
  TextColumn get checkoutGroupUuid => text().nullable()();
  TextColumn get outletUuid => text()();
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
    Sales,
    SaleItems,
    SyncQueueEntries,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'ordi_pos');
  }
}
