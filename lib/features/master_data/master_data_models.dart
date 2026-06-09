class MasterDataQuery {
  const MasterDataQuery({this.outletUuid, this.menuCategoryUuid});

  final String? outletUuid;
  final String? menuCategoryUuid;

  Map<String, dynamic> toQueryParameters() {
    return <String, dynamic>{
      if (outletUuid != null && outletUuid!.isNotEmpty)
        'outlet_uuid': outletUuid,
      if (menuCategoryUuid != null && menuCategoryUuid!.isNotEmpty)
        'menu_category_uuid': menuCategoryUuid,
    };
  }
}

class ApiOutletRef {
  const ApiOutletRef({required this.uuid, required this.name, this.code});

  final String uuid;
  final String name;
  final String? code;

  factory ApiOutletRef.fromJson(Map<String, dynamic> json) {
    return ApiOutletRef(
      uuid: json['uuid']?.toString() ?? '',
      name: json['name']?.toString() ?? '-',
      code: json['code']?.toString(),
    );
  }
}

class MenuCategoryRef {
  const MenuCategoryRef({
    required this.uuid,
    required this.name,
    required this.sortOrder,
  });

  final String uuid;
  final String name;
  final int sortOrder;

  factory MenuCategoryRef.fromJson(Map<String, dynamic> json) {
    return MenuCategoryRef(
      uuid: json['uuid']?.toString() ?? '',
      name: json['name']?.toString() ?? '-',
      sortOrder: _asInt(json['sort_order']),
    );
  }
}

class RemoteMenuCategory {
  const RemoteMenuCategory({
    required this.uuid,
    required this.name,
    required this.sortOrder,
    required this.revision,
    required this.outlet,
    this.updatedAt,
  });

  final String uuid;
  final String name;
  final int sortOrder;
  final int revision;
  final DateTime? updatedAt;
  final ApiOutletRef outlet;

  factory RemoteMenuCategory.fromJson(Map<String, dynamic> json) {
    return RemoteMenuCategory(
      uuid: json['uuid']?.toString() ?? '',
      name: json['name']?.toString() ?? '-',
      sortOrder: _asInt(json['sort_order']),
      revision: _asInt(json['revision']),
      updatedAt: _parseDateTime(json['updated_at']),
      outlet: ApiOutletRef.fromJson(_asMap(json['outlet'])),
    );
  }
}

class RemoteMenuItem {
  const RemoteMenuItem({
    required this.uuid,
    required this.name,
    required this.price,
    required this.isRetailReady,
    required this.revision,
    required this.outlet,
    this.description,
    this.sku,
    this.imageUrl,
    this.category,
    this.updatedAt,
  });

  final String uuid;
  final String name;
  final String? description;
  final String? sku;
  final String? imageUrl;
  final int price;
  final bool isRetailReady;
  final int revision;
  final DateTime? updatedAt;
  final ApiOutletRef outlet;
  final MenuCategoryRef? category;

  factory RemoteMenuItem.fromJson(Map<String, dynamic> json) {
    final category = _asMap(json['category']);
    return RemoteMenuItem(
      uuid: json['uuid']?.toString() ?? '',
      name: json['name']?.toString() ?? '-',
      description: json['description']?.toString(),
      sku: json['sku']?.toString(),
      imageUrl: json['image_url']?.toString(),
      price: _asInt(json['price']),
      isRetailReady: _asBool(json['is_retail_ready']),
      revision: _asInt(json['revision']),
      updatedAt: _parseDateTime(json['updated_at']),
      outlet: ApiOutletRef.fromJson(_asMap(json['outlet'])),
      category: category.isEmpty ? null : MenuCategoryRef.fromJson(category),
    );
  }
}

class RemotePaymentMethod {
  const RemotePaymentMethod({
    required this.uuid,
    required this.name,
    required this.code,
    required this.sortOrder,
    required this.revision,
    this.updatedAt,
  });

  final String uuid;
  final String name;
  final String code;
  final int sortOrder;
  final int revision;
  final DateTime? updatedAt;

  factory RemotePaymentMethod.fromJson(Map<String, dynamic> json) {
    return RemotePaymentMethod(
      uuid: json['uuid']?.toString() ?? '',
      name: json['name']?.toString() ?? '-',
      code: json['code']?.toString() ?? '',
      sortOrder: _asInt(json['sort_order']),
      revision: _asInt(json['revision']),
      updatedAt: _parseDateTime(json['updated_at']),
    );
  }
}

class RemoteDiningTable {
  const RemoteDiningTable({
    required this.uuid,
    required this.name,
    required this.revision,
    required this.outlet,
    this.number,
    this.updatedAt,
  });

  final String uuid;
  final String name;
  final String? number;
  final int revision;
  final DateTime? updatedAt;
  final ApiOutletRef outlet;

  factory RemoteDiningTable.fromJson(Map<String, dynamic> json) {
    return RemoteDiningTable(
      uuid: json['uuid']?.toString() ?? '',
      name: json['name']?.toString() ?? '-',
      number: json['number']?.toString(),
      revision: _asInt(json['revision']),
      updatedAt: _parseDateTime(json['updated_at']),
      outlet: ApiOutletRef.fromJson(_asMap(json['outlet'])),
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
