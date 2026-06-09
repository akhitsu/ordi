class SaleCreateRequest {
  const SaleCreateRequest({
    required this.uuid,
    required this.outletUuid,
    required this.transactionType,
    required this.subtotal,
    required this.discountTotal,
    required this.taxTotal,
    required this.serviceTotal,
    required this.grandTotal,
    required this.soldAt,
    required this.items,
    required this.idempotencyKey,
    this.checkoutGroupUuid,
    this.diningTableUuid,
    this.number,
    this.status = 'completed',
  });

  final String uuid;
  final String? checkoutGroupUuid;
  final String outletUuid;
  final String transactionType;
  final String? diningTableUuid;
  final String? number;
  final String status;
  final int subtotal;
  final int discountTotal;
  final int taxTotal;
  final int serviceTotal;
  final int grandTotal;
  final DateTime soldAt;
  final List<SaleItemCreateRequest> items;
  final String idempotencyKey;

  Map<String, dynamic> toJson({required String deviceUuid}) {
    return <String, dynamic>{
      'uuid': uuid,
      'checkout_group_uuid': checkoutGroupUuid,
      'outlet_uuid': outletUuid,
      'transaction_type': transactionType,
      'dining_table_uuid': diningTableUuid,
      'device_uuid': deviceUuid,
      'number': number,
      'status': status,
      'subtotal': subtotal,
      'discount_total': discountTotal,
      'tax_total': taxTotal,
      'service_total': serviceTotal,
      'grand_total': grandTotal,
      'sold_at': soldAt.toIso8601String(),
      'items': items.map((item) => item.toJson()).toList(),
    }..removeWhere((key, value) => value == null);
  }
}

class SaleItemCreateRequest {
  const SaleItemCreateRequest({
    required this.uuid,
    required this.name,
    required this.quantity,
    required this.unitPrice,
    required this.discountTotal,
    required this.lineTotal,
    this.menuItemUuid,
  });

  final String uuid;
  final String? menuItemUuid;
  final String name;
  final int quantity;
  final int unitPrice;
  final int discountTotal;
  final int lineTotal;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uuid': uuid,
      'menu_item_uuid': menuItemUuid,
      'name': name,
      'quantity': quantity,
      'unit_price': unitPrice,
      'discount_total': discountTotal,
      'line_total': lineTotal,
    }..removeWhere((key, value) => value == null);
  }
}

class SaleRecord {
  const SaleRecord({
    required this.uuid,
    required this.transactionType,
    required this.status,
    required this.subtotal,
    required this.discountTotal,
    required this.taxTotal,
    required this.serviceTotal,
    required this.grandTotal,
    required this.soldAt,
    required this.items,
    this.checkoutGroupUuid,
    this.number,
    this.receivedAt,
    this.outlet,
    this.diningTable,
    this.cashier,
  });

  final String uuid;
  final String? checkoutGroupUuid;
  final String? number;
  final String transactionType;
  final String status;
  final int subtotal;
  final int discountTotal;
  final int taxTotal;
  final int serviceTotal;
  final int grandTotal;
  final DateTime soldAt;
  final DateTime? receivedAt;
  final SaleRef? outlet;
  final SaleRef? diningTable;
  final SaleCashier? cashier;
  final List<SaleItemRecord> items;

  factory SaleRecord.fromJson(Map<String, dynamic> json) {
    return SaleRecord(
      uuid: json['uuid']?.toString() ?? '',
      checkoutGroupUuid: json['checkout_group_uuid']?.toString(),
      number: json['number']?.toString(),
      transactionType: json['transaction_type']?.toString() ?? 'take_away',
      status: json['status']?.toString() ?? 'completed',
      subtotal: _asInt(json['subtotal']),
      discountTotal: _asInt(json['discount_total']),
      taxTotal: _asInt(json['tax_total']),
      serviceTotal: _asInt(json['service_total']),
      grandTotal: _asInt(json['grand_total']),
      soldAt: _parseDateTime(json['sold_at']) ?? DateTime.now(),
      receivedAt: _parseDateTime(json['received_at']),
      outlet: _hasContent(json['outlet'])
          ? SaleRef.fromJson(_asMap(json['outlet']))
          : null,
      diningTable: _hasContent(json['dining_table'])
          ? SaleRef.fromJson(_asMap(json['dining_table']))
          : null,
      cashier: _hasContent(json['cashier'])
          ? SaleCashier.fromJson(_asMap(json['cashier']))
          : null,
      items: _asList(
        json['items'],
      ).map((item) => SaleItemRecord.fromJson(_asMap(item))).toList(),
    );
  }
}

class SaleItemRecord {
  const SaleItemRecord({
    required this.uuid,
    required this.name,
    required this.quantity,
    required this.unitPrice,
    required this.discountTotal,
    required this.lineTotal,
    this.menuItemUuid,
  });

  final String uuid;
  final String? menuItemUuid;
  final String name;
  final int quantity;
  final int unitPrice;
  final int discountTotal;
  final int lineTotal;

  factory SaleItemRecord.fromJson(Map<String, dynamic> json) {
    return SaleItemRecord(
      uuid: json['uuid']?.toString() ?? '',
      menuItemUuid: json['menu_item_uuid']?.toString(),
      name: json['name']?.toString() ?? '-',
      quantity: _asInt(json['quantity']),
      unitPrice: _asInt(json['unit_price']),
      discountTotal: _asInt(json['discount_total']),
      lineTotal: _asInt(json['line_total']),
    );
  }
}

class SaleRef {
  const SaleRef({
    required this.uuid,
    required this.name,
    this.code,
    this.number,
  });

  final String uuid;
  final String name;
  final String? code;
  final String? number;

  factory SaleRef.fromJson(Map<String, dynamic> json) {
    return SaleRef(
      uuid: json['uuid']?.toString() ?? '',
      name: json['name']?.toString() ?? '-',
      code: json['code']?.toString(),
      number: json['number']?.toString(),
    );
  }
}

class SaleCashier {
  const SaleCashier({required this.uuid, required this.name, this.email});

  final String uuid;
  final String name;
  final String? email;

  factory SaleCashier.fromJson(Map<String, dynamic> json) {
    return SaleCashier(
      uuid: json['uuid']?.toString() ?? '',
      name: json['name']?.toString() ?? '-',
      email: json['email']?.toString(),
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

bool _hasContent(Object? value) {
  return value is Map && value.isNotEmpty;
}

DateTime? _parseDateTime(Object? value) {
  final text = value?.toString();
  if (text == null || text.isEmpty) {
    return null;
  }
  return DateTime.tryParse(text);
}
