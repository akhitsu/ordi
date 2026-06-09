class SyncStatusQuery {
  const SyncStatusQuery({this.outletUuid});

  final String? outletUuid;

  Map<String, dynamic> toQueryParameters({required String deviceUuid}) {
    return <String, dynamic>{
      'device_uuid': deviceUuid,
      if (outletUuid != null && outletUuid!.isNotEmpty)
        'outlet_uuid': outletUuid,
    };
  }
}

class SyncStatusRecord {
  const SyncStatusRecord({
    required this.serverTime,
    required this.device,
    required this.outlets,
  });

  final DateTime? serverTime;
  final SyncStatusDevice device;
  final List<SyncStatusOutlet> outlets;

  factory SyncStatusRecord.fromJson(Map<String, dynamic> json) {
    return SyncStatusRecord(
      serverTime: _parseDateTime(json['server_time']),
      device: SyncStatusDevice.fromJson(_asMap(json['device'])),
      outlets: _asList(
        json['outlets'],
      ).map((item) => SyncStatusOutlet.fromJson(_asMap(item))).toList(),
    );
  }
}

class SyncStatusDevice {
  const SyncStatusDevice({
    required this.uuid,
    required this.name,
    this.lastSeenAt,
  });

  final String uuid;
  final String name;
  final DateTime? lastSeenAt;

  factory SyncStatusDevice.fromJson(Map<String, dynamic> json) {
    return SyncStatusDevice(
      uuid: json['uuid']?.toString() ?? '',
      name: json['name']?.toString() ?? '-',
      lastSeenAt: _parseDateTime(json['last_seen_at']),
    );
  }
}

class SyncStatusOutlet {
  const SyncStatusOutlet({
    required this.uuid,
    required this.name,
    required this.syncStates,
    this.code,
    this.lastSaleReceivedAt,
    this.lastPaymentPaidAt,
  });

  final String uuid;
  final String name;
  final String? code;
  final DateTime? lastSaleReceivedAt;
  final DateTime? lastPaymentPaidAt;
  final List<SyncEntityState> syncStates;

  factory SyncStatusOutlet.fromJson(Map<String, dynamic> json) {
    return SyncStatusOutlet(
      uuid: json['uuid']?.toString() ?? '',
      name: json['name']?.toString() ?? '-',
      code: json['code']?.toString(),
      lastSaleReceivedAt: _parseDateTime(json['last_sale_received_at']),
      lastPaymentPaidAt: _parseDateTime(json['last_payment_paid_at']),
      syncStates: _asList(
        json['sync_states'],
      ).map((item) => SyncEntityState.fromJson(_asMap(item))).toList(),
    );
  }
}

class SyncEntityState {
  const SyncEntityState({
    required this.entityType,
    required this.lastRevision,
    this.lastPulledAt,
    this.lastPushedAt,
  });

  final String entityType;
  final int lastRevision;
  final DateTime? lastPulledAt;
  final DateTime? lastPushedAt;

  factory SyncEntityState.fromJson(Map<String, dynamic> json) {
    return SyncEntityState(
      entityType: json['entity_type']?.toString() ?? '',
      lastRevision: _asInt(json['last_revision']),
      lastPulledAt: _parseDateTime(json['last_pulled_at']),
      lastPushedAt: _parseDateTime(json['last_pushed_at']),
    );
  }
}

Map<String, dynamic> _asMap(Object? value) {
  if (value is Map<String, dynamic>) {
    return value;
  }
  return <String, dynamic>{};
}

List<Object?> _asList(Object? value) {
  if (value is List) {
    return value;
  }
  return const [];
}

int _asInt(Object? value) {
  if (value is int) {
    return value;
  }
  return int.tryParse(value?.toString() ?? '') ?? 0;
}

DateTime? _parseDateTime(Object? value) {
  final text = value?.toString();
  if (text == null || text.isEmpty) {
    return null;
  }
  return DateTime.tryParse(text);
}
