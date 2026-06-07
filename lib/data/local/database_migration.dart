class DatabaseMigrationEvent {
  const DatabaseMigrationEvent({required this.message, this.progress});

  final String message;
  final double? progress;
}

abstract class DatabaseMigrationLifecycleStore {
  Future<void> markPendingUpgrade({
    required int fromVersion,
    required int toVersion,
  });

  Future<bool> hasPendingUpgrade();

  Future<void> clearPendingUpgrade();
}
