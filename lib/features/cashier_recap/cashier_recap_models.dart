class CashierRecapQuery {
  const CashierRecapQuery({this.status, this.dateFrom, this.dateTo});

  final CashierRecapStatus? status;
  final DateTime? dateFrom;
  final DateTime? dateTo;

  Map<String, dynamic> toQueryParameters() {
    return <String, dynamic>{
      if (status != null) 'status': status!.apiValue,
      if (dateFrom != null) 'date_from': _toDateString(dateFrom!),
      if (dateTo != null) 'date_to': _toDateString(dateTo!),
    };
  }

  String _toDateString(DateTime value) {
    final normalized = value.toLocal();
    final month = normalized.month.toString().padLeft(2, '0');
    final day = normalized.day.toString().padLeft(2, '0');
    return '${normalized.year}-$month-$day';
  }
}

enum CashierRecapStatus {
  open('open'),
  closed('closed');

  const CashierRecapStatus(this.apiValue);

  final String apiValue;

  static CashierRecapStatus fromValue(String? value) {
    return values.where((item) => item.apiValue == value).firstOrNull ??
        CashierRecapStatus.closed;
  }
}

class CashierRecapOutlet {
  const CashierRecapOutlet({required this.uuid, required this.name, this.code});

  final String uuid;
  final String name;
  final String? code;

  factory CashierRecapOutlet.fromJson(Map<String, dynamic> json) {
    return CashierRecapOutlet(
      uuid: json['uuid']?.toString() ?? '',
      name: json['name']?.toString() ?? '-',
      code: json['code']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'uuid': uuid, 'name': name, 'code': code};
  }
}

class CashierRecapCashier {
  const CashierRecapCashier({
    required this.uuid,
    required this.name,
    this.email,
  });

  final String uuid;
  final String name;
  final String? email;

  factory CashierRecapCashier.fromJson(Map<String, dynamic> json) {
    return CashierRecapCashier(
      uuid: json['uuid']?.toString() ?? '',
      name: json['name']?.toString() ?? '-',
      email: json['email']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'uuid': uuid, 'name': name, 'email': email};
  }
}

class CashierRecapDevice {
  const CashierRecapDevice({required this.uuid, required this.name});

  final String uuid;
  final String name;

  factory CashierRecapDevice.fromJson(Map<String, dynamic> json) {
    return CashierRecapDevice(
      uuid: json['uuid']?.toString() ?? '',
      name: json['name']?.toString() ?? '-',
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'uuid': uuid, 'name': name};
  }
}

class CashierRecapOutletBreakdown {
  const CashierRecapOutletBreakdown({
    required this.outlet,
    required this.transactionCount,
    required this.grossSalesTotal,
    required this.discountTotal,
    required this.taxTotal,
    required this.serviceTotal,
    required this.netSalesTotal,
    required this.itemQuantityTotal,
    required this.items,
    required this.paymentMethods,
  });

  final CashierRecapOutlet outlet;
  final int transactionCount;
  final int grossSalesTotal;
  final int discountTotal;
  final int taxTotal;
  final int serviceTotal;
  final int netSalesTotal;
  final int itemQuantityTotal;
  final List<Map<String, dynamic>> items;
  final List<Map<String, dynamic>> paymentMethods;

  factory CashierRecapOutletBreakdown.fromJson(Map<String, dynamic> json) {
    return CashierRecapOutletBreakdown(
      outlet: CashierRecapOutlet.fromJson(_asMap(json['outlet'])),
      transactionCount: _asInt(json['transaction_count']),
      grossSalesTotal: _asInt(json['gross_sales_total']),
      discountTotal: _asInt(json['discount_total']),
      taxTotal: _asInt(json['tax_total']),
      serviceTotal: _asInt(json['service_total']),
      netSalesTotal: _asInt(json['net_sales_total']),
      itemQuantityTotal: _asInt(json['item_quantity_total']),
      items: _asMapList(json['items']),
      paymentMethods: _asMapList(json['payment_methods']),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'outlet': outlet.toJson(),
      'transaction_count': transactionCount,
      'gross_sales_total': grossSalesTotal,
      'discount_total': discountTotal,
      'tax_total': taxTotal,
      'service_total': serviceTotal,
      'net_sales_total': netSalesTotal,
      'item_quantity_total': itemQuantityTotal,
      'items': items,
      'payment_methods': paymentMethods,
    };
  }
}

class CashierRecapSummary {
  const CashierRecapSummary({
    required this.transactionCount,
    required this.grossSalesTotal,
    required this.discountTotal,
    required this.taxTotal,
    required this.serviceTotal,
    required this.netSalesTotal,
    required this.outlets,
  });

  final int transactionCount;
  final int grossSalesTotal;
  final int discountTotal;
  final int taxTotal;
  final int serviceTotal;
  final int netSalesTotal;
  final List<CashierRecapOutletBreakdown> outlets;

  factory CashierRecapSummary.fromJson(Map<String, dynamic> json) {
    return CashierRecapSummary(
      transactionCount: _asInt(json['transaction_count']),
      grossSalesTotal: _asInt(json['gross_sales_total']),
      discountTotal: _asInt(json['discount_total']),
      taxTotal: _asInt(json['tax_total']),
      serviceTotal: _asInt(json['service_total']),
      netSalesTotal: _asInt(json['net_sales_total']),
      outlets: _asList(json['outlets'])
          .map((item) => CashierRecapOutletBreakdown.fromJson(_asMap(item)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'transaction_count': transactionCount,
      'gross_sales_total': grossSalesTotal,
      'discount_total': discountTotal,
      'tax_total': taxTotal,
      'service_total': serviceTotal,
      'net_sales_total': netSalesTotal,
      'outlets': outlets.map((item) => item.toJson()).toList(),
    };
  }
}

class CashierRecapRecord {
  const CashierRecapRecord({
    required this.recapUuid,
    required this.status,
    required this.openedAt,
    this.closedAt,
    required this.outletCount,
    required this.transactionCount,
    required this.totalSales,
    this.soldFrom,
    this.soldUntil,
    this.notes,
    this.outlets = const [],
    this.cashier,
    this.device,
    this.summary,
    this.syncedAt,
    this.updatedAt,
  });

  final String recapUuid;
  final CashierRecapStatus status;
  final DateTime openedAt;
  final DateTime? closedAt;
  final int outletCount;
  final int transactionCount;
  final int totalSales;
  final DateTime? soldFrom;
  final DateTime? soldUntil;
  final String? notes;
  final List<CashierRecapOutlet> outlets;
  final CashierRecapCashier? cashier;
  final CashierRecapDevice? device;
  final CashierRecapSummary? summary;
  final DateTime? syncedAt;
  final DateTime? updatedAt;

  bool get isOpen => status == CashierRecapStatus.open;

  factory CashierRecapRecord.fromIndexJson(Map<String, dynamic> json) {
    return CashierRecapRecord(
      recapUuid: json['recap_uuid']?.toString() ?? '',
      status: CashierRecapStatus.fromValue(json['status']?.toString()),
      openedAt: _parseDateTime(json['opened_at']) ?? DateTime.now(),
      closedAt: _parseDateTime(json['closed_at']),
      outletCount: _asInt(json['outlet_count']),
      transactionCount: _asInt(json['transaction_count']),
      totalSales: _asInt(json['total_sales']),
    );
  }

  factory CashierRecapRecord.fromOpenJson(Map<String, dynamic> json) {
    final outlets = _asList(
      json['outlets'],
    ).map((item) => CashierRecapOutlet.fromJson(_asMap(item))).toList();
    return CashierRecapRecord(
      recapUuid: json['recap_uuid']?.toString() ?? '',
      status: CashierRecapStatus.fromValue(json['status']?.toString()),
      openedAt: _parseDateTime(json['opened_at']) ?? DateTime.now(),
      outletCount: outlets.length,
      transactionCount: 0,
      totalSales: 0,
      outlets: outlets,
    );
  }

  factory CashierRecapRecord.fromDetailJson(Map<String, dynamic> json) {
    final outlets = _asList(
      json['outlets'],
    ).map((item) => CashierRecapOutlet.fromJson(_asMap(item))).toList();
    final summary = CashierRecapSummary.fromJson(_asMap(json['summary']));
    return CashierRecapRecord(
      recapUuid: json['recap_uuid']?.toString() ?? '',
      status: CashierRecapStatus.fromValue(json['status']?.toString()),
      openedAt: _parseDateTime(json['opened_at']) ?? DateTime.now(),
      closedAt: _parseDateTime(json['closed_at']),
      outletCount: outlets.length,
      transactionCount: summary.transactionCount,
      totalSales: summary.netSalesTotal,
      soldFrom: _parseDateTime(json['sold_from']),
      soldUntil: _parseDateTime(json['sold_until']),
      outlets: outlets,
      cashier: _hasContent(json['cashier'])
          ? CashierRecapCashier.fromJson(_asMap(json['cashier']))
          : null,
      device: _hasContent(json['device'])
          ? CashierRecapDevice.fromJson(_asMap(json['device']))
          : null,
      summary: summary,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'recap_uuid': recapUuid,
      'status': status.apiValue,
      'opened_at': openedAt.toIso8601String(),
      'closed_at': closedAt?.toIso8601String(),
      'outlet_count': outletCount,
      'transaction_count': transactionCount,
      'total_sales': totalSales,
      'sold_from': soldFrom?.toIso8601String(),
      'sold_until': soldUntil?.toIso8601String(),
      'notes': notes,
      'outlets': outlets.map((item) => item.toJson()).toList(),
      'cashier': cashier?.toJson(),
      'device': device?.toJson(),
      'summary': summary?.toJson(),
      'synced_at': syncedAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  CashierRecapRecord copyWith({
    CashierRecapStatus? status,
    DateTime? openedAt,
    DateTime? closedAt,
    bool clearClosedAt = false,
    int? outletCount,
    int? transactionCount,
    int? totalSales,
    DateTime? soldFrom,
    bool clearSoldFrom = false,
    DateTime? soldUntil,
    bool clearSoldUntil = false,
    String? notes,
    bool clearNotes = false,
    List<CashierRecapOutlet>? outlets,
    CashierRecapCashier? cashier,
    bool clearCashier = false,
    CashierRecapDevice? device,
    bool clearDevice = false,
    CashierRecapSummary? summary,
    bool clearSummary = false,
    DateTime? syncedAt,
    bool clearSyncedAt = false,
    DateTime? updatedAt,
  }) {
    return CashierRecapRecord(
      recapUuid: recapUuid,
      status: status ?? this.status,
      openedAt: openedAt ?? this.openedAt,
      closedAt: clearClosedAt ? null : (closedAt ?? this.closedAt),
      outletCount: outletCount ?? this.outletCount,
      transactionCount: transactionCount ?? this.transactionCount,
      totalSales: totalSales ?? this.totalSales,
      soldFrom: clearSoldFrom ? null : (soldFrom ?? this.soldFrom),
      soldUntil: clearSoldUntil ? null : (soldUntil ?? this.soldUntil),
      notes: clearNotes ? null : (notes ?? this.notes),
      outlets: outlets ?? this.outlets,
      cashier: clearCashier ? null : (cashier ?? this.cashier),
      device: clearDevice ? null : (device ?? this.device),
      summary: clearSummary ? null : (summary ?? this.summary),
      syncedAt: clearSyncedAt ? null : (syncedAt ?? this.syncedAt),
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

extension<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;
}

bool _hasContent(Object? value) {
  return value is Map && value.isNotEmpty;
}

Map<String, dynamic> _asMap(Object? value) {
  if (value is Map<String, dynamic>) {
    return value;
  }
  if (value is Map) {
    return value.map((key, item) => MapEntry(key.toString(), item));
  }
  return <String, dynamic>{};
}

List<Object?> _asList(Object? value) {
  if (value is List) {
    return value;
  }
  return const [];
}

List<Map<String, dynamic>> _asMapList(Object? value) {
  return _asList(value).map((item) => _asMap(item)).toList();
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
