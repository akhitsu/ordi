import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'app_database.dart';
import 'database_migration.dart';

class DatabaseBootstrapState {
  const DatabaseBootstrapState({
    required this.isRunning,
    required this.message,
    this.progress,
  });

  const DatabaseBootstrapState.idle()
    : isRunning = false,
      message = 'Menyiapkan aplikasi...',
      progress = null;

  final bool isRunning;
  final String message;
  final double? progress;

  DatabaseBootstrapState copyWith({
    bool? isRunning,
    String? message,
    double? progress,
    bool clearProgress = false,
  }) {
    return DatabaseBootstrapState(
      isRunning: isRunning ?? this.isRunning,
      message: message ?? this.message,
      progress: clearProgress ? null : (progress ?? this.progress),
    );
  }
}

class SecureStorageDatabaseMigrationLifecycleStore
    implements DatabaseMigrationLifecycleStore {
  SecureStorageDatabaseMigrationLifecycleStore(this._storage);

  static const _pendingUpgradeKey = 'db_pending_upgrade';

  final FlutterSecureStorage _storage;

  @override
  Future<void> clearPendingUpgrade() {
    return _storage.delete(key: _pendingUpgradeKey);
  }

  @override
  Future<bool> hasPendingUpgrade() async {
    final value = await _storage.read(key: _pendingUpgradeKey);
    return value != null && value.isNotEmpty;
  }

  @override
  Future<void> markPendingUpgrade({
    required int fromVersion,
    required int toVersion,
  }) {
    return _storage.write(
      key: _pendingUpgradeKey,
      value: '$fromVersion->$toVersion',
    );
  }
}

class DatabaseBootstrapController
    extends StateNotifier<DatabaseBootstrapState> {
  DatabaseBootstrapController(this._read)
    : super(const DatabaseBootstrapState.idle());

  final T Function<T>(ProviderListenable<T> provider) _read;
  bool _didPrepare = false;

  Future<void> prepareDatabase() async {
    if (_didPrepare) {
      return;
    }

    final lifecycleStore = _read(databaseMigrationLifecycleStoreProvider);
    final hasPendingUpgrade = await lifecycleStore.hasPendingUpgrade();

    state = DatabaseBootstrapState(
      isRunning: true,
      message: hasPendingUpgrade
          ? 'Melanjutkan upgrade database lokal...'
          : 'Menyiapkan database lokal...',
      progress: hasPendingUpgrade ? 0.1 : 0.05,
    );

    final database = _read(databaseProvider);
    await database.ensureReady();

    _didPrepare = true;
    state = state.copyWith(
      isRunning: false,
      message: 'Database lokal siap.',
      progress: 1,
    );
  }

  void handleMigrationEvent(DatabaseMigrationEvent event) {
    state = state.copyWith(
      isRunning: true,
      message: event.message,
      progress: event.progress,
    );
  }

  void setMessage(
    String message, {
    double? progress,
    bool clearProgress = false,
  }) {
    state = state.copyWith(
      message: message,
      progress: progress,
      clearProgress: clearProgress,
    );
  }
}

final databaseMigrationLifecycleStoreProvider =
    Provider<DatabaseMigrationLifecycleStore>((ref) {
      return SecureStorageDatabaseMigrationLifecycleStore(
        const FlutterSecureStorage(),
      );
    });

final databaseBootstrapProvider =
    StateNotifierProvider<DatabaseBootstrapController, DatabaseBootstrapState>((
      ref,
    ) {
      return DatabaseBootstrapController(ref.read);
    });

final databaseProvider = Provider<AppDatabase>((ref) {
  final bootstrapController = ref.read(databaseBootstrapProvider.notifier);
  final database = AppDatabase(
    onMigrationEvent: bootstrapController.handleMigrationEvent,
    migrationLifecycleStore: ref.read(databaseMigrationLifecycleStoreProvider),
  );
  ref.onDispose(database.close);
  return database;
});
