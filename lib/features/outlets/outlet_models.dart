class OutletQuery {
  const OutletQuery({
    this.businessUuid,
    this.updatedAfter,
    this.includeInactive = false,
  });

  final String? businessUuid;
  final DateTime? updatedAfter;
  final bool includeInactive;

  Map<String, dynamic> toQueryParameters() {
    return <String, dynamic>{
      if (businessUuid != null && businessUuid!.isNotEmpty)
        'business_uuid': businessUuid,
      if (updatedAfter != null)
        'updated_after': updatedAfter!.toIso8601String(),
      if (includeInactive) 'include_inactive': true,
    };
  }
}

class RemoteOutletBusiness {
  const RemoteOutletBusiness({
    required this.uuid,
    required this.name,
    required this.timezone,
  });

  final String uuid;
  final String name;
  final String timezone;

  factory RemoteOutletBusiness.fromJson(Map<String, dynamic> json) {
    return RemoteOutletBusiness(
      uuid: json['uuid']?.toString() ?? '',
      name: json['name']?.toString() ?? '-',
      timezone: json['timezone']?.toString() ?? 'Asia/Jakarta',
    );
  }
}

class RemoteOutlet {
  const RemoteOutlet({
    required this.uuid,
    required this.name,
    required this.code,
    required this.role,
    required this.isActive,
    required this.revision,
    required this.business,
    this.address,
    this.phone,
    this.updatedAt,
  });

  final String uuid;
  final String name;
  final String? code;
  final String? role;
  final String? address;
  final String? phone;
  final bool isActive;
  final int revision;
  final DateTime? updatedAt;
  final RemoteOutletBusiness business;

  factory RemoteOutlet.fromJson(Map<String, dynamic> json) {
    return RemoteOutlet(
      uuid: json['uuid']?.toString() ?? '',
      name: json['name']?.toString() ?? '-',
      code: json['code']?.toString(),
      role: json['role']?.toString(),
      address: json['address']?.toString(),
      phone: json['phone']?.toString(),
      isActive: _asBool(json['is_active']),
      revision: _asInt(json['revision']),
      updatedAt: _parseDateTime(json['updated_at']),
      business: RemoteOutletBusiness.fromJson(_asMap(json['business'])),
    );
  }
}

Map<String, dynamic> _asMap(Object? value) {
  if (value is Map<String, dynamic>) {
    return value;
  }
  return <String, dynamic>{};
}

int _asInt(Object? value) {
  if (value is int) {
    return value;
  }
  return int.tryParse(value?.toString() ?? '') ?? 0;
}

bool _asBool(Object? value) {
  if (value is bool) {
    return value;
  }
  return value?.toString() == 'true' || value?.toString() == '1';
}

DateTime? _parseDateTime(Object? value) {
  final text = value?.toString();
  if (text == null || text.isEmpty) {
    return null;
  }
  return DateTime.tryParse(text);
}
