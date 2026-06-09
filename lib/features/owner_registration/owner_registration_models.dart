class OwnerRegisterRequest {
  const OwnerRegisterRequest({
    required this.ownerName,
    required this.ownerEmail,
    required this.password,
    required this.passwordConfirmation,
    required this.businessName,
    this.businessLegalName,
    this.businessPhone,
    this.businessEmail,
    this.timezone,
    this.outletName,
    this.outletCode,
    this.outletPhone,
    this.outletAddress,
  });

  final String ownerName;
  final String ownerEmail;
  final String password;
  final String passwordConfirmation;
  final String businessName;
  final String? businessLegalName;
  final String? businessPhone;
  final String? businessEmail;
  final String? timezone;
  final String? outletName;
  final String? outletCode;
  final String? outletPhone;
  final String? outletAddress;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'owner_name': ownerName,
      'owner_email': ownerEmail,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'business_name': businessName,
      'business_legal_name': businessLegalName,
      'business_phone': businessPhone,
      'business_email': businessEmail,
      'timezone': timezone,
      'outlet_name': outletName,
      'outlet_code': outletCode,
      'outlet_phone': outletPhone,
      'outlet_address': outletAddress,
    }..removeWhere((key, value) => value == null);
  }
}

class OwnerRegisterResponse {
  const OwnerRegisterResponse({
    required this.tokenType,
    required this.accessToken,
    required this.user,
    required this.business,
    required this.outlet,
  });

  final String tokenType;
  final String accessToken;
  final RegisteredUser user;
  final RegisteredBusiness business;
  final RegisteredOutlet outlet;

  factory OwnerRegisterResponse.fromJson(Map<String, dynamic> json) {
    return OwnerRegisterResponse(
      tokenType: json['token_type']?.toString() ?? 'Bearer',
      accessToken: json['access_token']?.toString() ?? '',
      user: RegisteredUser.fromJson(_asMap(json['user'])),
      business: RegisteredBusiness.fromJson(_asMap(json['business'])),
      outlet: RegisteredOutlet.fromJson(_asMap(json['outlet'])),
    );
  }
}

class RegisteredUser {
  const RegisteredUser({
    required this.uuid,
    required this.name,
    required this.email,
    required this.role,
  });

  final String uuid;
  final String name;
  final String email;
  final String role;

  factory RegisteredUser.fromJson(Map<String, dynamic> json) {
    return RegisteredUser(
      uuid: json['uuid']?.toString() ?? '',
      name: json['name']?.toString() ?? '-',
      email: json['email']?.toString() ?? '',
      role: json['role']?.toString() ?? 'owner',
    );
  }
}

class RegisteredBusiness {
  const RegisteredBusiness({
    required this.uuid,
    required this.name,
    required this.timezone,
  });

  final String uuid;
  final String name;
  final String timezone;

  factory RegisteredBusiness.fromJson(Map<String, dynamic> json) {
    return RegisteredBusiness(
      uuid: json['uuid']?.toString() ?? '',
      name: json['name']?.toString() ?? '-',
      timezone: json['timezone']?.toString() ?? 'Asia/Jakarta',
    );
  }
}

class RegisteredOutlet {
  const RegisteredOutlet({
    required this.uuid,
    required this.name,
    required this.code,
    this.role,
  });

  final String uuid;
  final String name;
  final String code;
  final RegisteredOutletRole? role;

  factory RegisteredOutlet.fromJson(Map<String, dynamic> json) {
    final role = _asMap(json['role']);
    return RegisteredOutlet(
      uuid: json['uuid']?.toString() ?? '',
      name: json['name']?.toString() ?? '-',
      code: json['code']?.toString() ?? '',
      role: role.isEmpty ? null : RegisteredOutletRole.fromJson(role),
    );
  }
}

class RegisteredOutletRole {
  const RegisteredOutletRole({
    required this.uuid,
    required this.name,
    required this.slug,
  });

  final String uuid;
  final String name;
  final String slug;

  factory RegisteredOutletRole.fromJson(Map<String, dynamic> json) {
    return RegisteredOutletRole(
      uuid: json['uuid']?.toString() ?? '',
      name: json['name']?.toString() ?? '-',
      slug: json['slug']?.toString() ?? '',
    );
  }
}

Map<String, dynamic> _asMap(Object? value) {
  if (value is Map<String, dynamic>) {
    return value;
  }
  return <String, dynamic>{};
}
