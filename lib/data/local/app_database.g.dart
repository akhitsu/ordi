// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $LocalUsersTable extends LocalUsers
    with TableInfo<$LocalUsersTable, LocalUser> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalUsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _businessUuidMeta = const VerificationMeta(
    'businessUuid',
  );
  @override
  late final GeneratedColumn<String> businessUuid = GeneratedColumn<String>(
    'business_uuid',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [uuid, businessUuid, name, email, role];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_users';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalUser> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('business_uuid')) {
      context.handle(
        _businessUuidMeta,
        businessUuid.isAcceptableOrUnknown(
          data['business_uuid']!,
          _businessUuidMeta,
        ),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  LocalUser map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalUser(
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      businessUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}business_uuid'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      )!,
    );
  }

  @override
  $LocalUsersTable createAlias(String alias) {
    return $LocalUsersTable(attachedDatabase, alias);
  }
}

class LocalUser extends DataClass implements Insertable<LocalUser> {
  final String uuid;
  final String? businessUuid;
  final String name;
  final String email;
  final String role;
  const LocalUser({
    required this.uuid,
    this.businessUuid,
    required this.name,
    required this.email,
    required this.role,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    if (!nullToAbsent || businessUuid != null) {
      map['business_uuid'] = Variable<String>(businessUuid);
    }
    map['name'] = Variable<String>(name);
    map['email'] = Variable<String>(email);
    map['role'] = Variable<String>(role);
    return map;
  }

  LocalUsersCompanion toCompanion(bool nullToAbsent) {
    return LocalUsersCompanion(
      uuid: Value(uuid),
      businessUuid: businessUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(businessUuid),
      name: Value(name),
      email: Value(email),
      role: Value(role),
    );
  }

  factory LocalUser.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalUser(
      uuid: serializer.fromJson<String>(json['uuid']),
      businessUuid: serializer.fromJson<String?>(json['businessUuid']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String>(json['email']),
      role: serializer.fromJson<String>(json['role']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'businessUuid': serializer.toJson<String?>(businessUuid),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String>(email),
      'role': serializer.toJson<String>(role),
    };
  }

  LocalUser copyWith({
    String? uuid,
    Value<String?> businessUuid = const Value.absent(),
    String? name,
    String? email,
    String? role,
  }) => LocalUser(
    uuid: uuid ?? this.uuid,
    businessUuid: businessUuid.present ? businessUuid.value : this.businessUuid,
    name: name ?? this.name,
    email: email ?? this.email,
    role: role ?? this.role,
  );
  LocalUser copyWithCompanion(LocalUsersCompanion data) {
    return LocalUser(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      businessUuid: data.businessUuid.present
          ? data.businessUuid.value
          : this.businessUuid,
      name: data.name.present ? data.name.value : this.name,
      email: data.email.present ? data.email.value : this.email,
      role: data.role.present ? data.role.value : this.role,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalUser(')
          ..write('uuid: $uuid, ')
          ..write('businessUuid: $businessUuid, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('role: $role')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uuid, businessUuid, name, email, role);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalUser &&
          other.uuid == this.uuid &&
          other.businessUuid == this.businessUuid &&
          other.name == this.name &&
          other.email == this.email &&
          other.role == this.role);
}

class LocalUsersCompanion extends UpdateCompanion<LocalUser> {
  final Value<String> uuid;
  final Value<String?> businessUuid;
  final Value<String> name;
  final Value<String> email;
  final Value<String> role;
  final Value<int> rowid;
  const LocalUsersCompanion({
    this.uuid = const Value.absent(),
    this.businessUuid = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.role = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocalUsersCompanion.insert({
    required String uuid,
    this.businessUuid = const Value.absent(),
    required String name,
    required String email,
    required String role,
    this.rowid = const Value.absent(),
  }) : uuid = Value(uuid),
       name = Value(name),
       email = Value(email),
       role = Value(role);
  static Insertable<LocalUser> custom({
    Expression<String>? uuid,
    Expression<String>? businessUuid,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? role,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (businessUuid != null) 'business_uuid': businessUuid,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (role != null) 'role': role,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalUsersCompanion copyWith({
    Value<String>? uuid,
    Value<String?>? businessUuid,
    Value<String>? name,
    Value<String>? email,
    Value<String>? role,
    Value<int>? rowid,
  }) {
    return LocalUsersCompanion(
      uuid: uuid ?? this.uuid,
      businessUuid: businessUuid ?? this.businessUuid,
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (businessUuid.present) {
      map['business_uuid'] = Variable<String>(businessUuid.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalUsersCompanion(')
          ..write('uuid: $uuid, ')
          ..write('businessUuid: $businessUuid, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('role: $role, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BusinessesTable extends Businesses
    with TableInfo<$BusinessesTable, BusinessesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BusinessesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timezoneMeta = const VerificationMeta(
    'timezone',
  );
  @override
  late final GeneratedColumn<String> timezone = GeneratedColumn<String>(
    'timezone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Asia/Jakarta'),
  );
  @override
  List<GeneratedColumn> get $columns => [uuid, name, timezone];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'businesses';
  @override
  VerificationContext validateIntegrity(
    Insertable<BusinessesData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('timezone')) {
      context.handle(
        _timezoneMeta,
        timezone.isAcceptableOrUnknown(data['timezone']!, _timezoneMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  BusinessesData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BusinessesData(
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      timezone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}timezone'],
      )!,
    );
  }

  @override
  $BusinessesTable createAlias(String alias) {
    return $BusinessesTable(attachedDatabase, alias);
  }
}

class BusinessesData extends DataClass implements Insertable<BusinessesData> {
  final String uuid;
  final String name;
  final String timezone;
  const BusinessesData({
    required this.uuid,
    required this.name,
    required this.timezone,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['name'] = Variable<String>(name);
    map['timezone'] = Variable<String>(timezone);
    return map;
  }

  BusinessesCompanion toCompanion(bool nullToAbsent) {
    return BusinessesCompanion(
      uuid: Value(uuid),
      name: Value(name),
      timezone: Value(timezone),
    );
  }

  factory BusinessesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BusinessesData(
      uuid: serializer.fromJson<String>(json['uuid']),
      name: serializer.fromJson<String>(json['name']),
      timezone: serializer.fromJson<String>(json['timezone']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'name': serializer.toJson<String>(name),
      'timezone': serializer.toJson<String>(timezone),
    };
  }

  BusinessesData copyWith({String? uuid, String? name, String? timezone}) =>
      BusinessesData(
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        timezone: timezone ?? this.timezone,
      );
  BusinessesData copyWithCompanion(BusinessesCompanion data) {
    return BusinessesData(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      name: data.name.present ? data.name.value : this.name,
      timezone: data.timezone.present ? data.timezone.value : this.timezone,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BusinessesData(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('timezone: $timezone')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uuid, name, timezone);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BusinessesData &&
          other.uuid == this.uuid &&
          other.name == this.name &&
          other.timezone == this.timezone);
}

class BusinessesCompanion extends UpdateCompanion<BusinessesData> {
  final Value<String> uuid;
  final Value<String> name;
  final Value<String> timezone;
  final Value<int> rowid;
  const BusinessesCompanion({
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.timezone = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BusinessesCompanion.insert({
    required String uuid,
    required String name,
    this.timezone = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : uuid = Value(uuid),
       name = Value(name);
  static Insertable<BusinessesData> custom({
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<String>? timezone,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (timezone != null) 'timezone': timezone,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BusinessesCompanion copyWith({
    Value<String>? uuid,
    Value<String>? name,
    Value<String>? timezone,
    Value<int>? rowid,
  }) {
    return BusinessesCompanion(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      timezone: timezone ?? this.timezone,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (timezone.present) {
      map['timezone'] = Variable<String>(timezone.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BusinessesCompanion(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('timezone: $timezone, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocalDevicesTable extends LocalDevices
    with TableInfo<$LocalDevicesTable, LocalDevice> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalDevicesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _platformMeta = const VerificationMeta(
    'platform',
  );
  @override
  late final GeneratedColumn<String> platform = GeneratedColumn<String>(
    'platform',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _appVersionMeta = const VerificationMeta(
    'appVersion',
  );
  @override
  late final GeneratedColumn<String> appVersion = GeneratedColumn<String>(
    'app_version',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastSeenAtMeta = const VerificationMeta(
    'lastSeenAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastSeenAt = GeneratedColumn<DateTime>(
    'last_seen_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    uuid,
    name,
    platform,
    appVersion,
    lastSeenAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_devices';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalDevice> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('platform')) {
      context.handle(
        _platformMeta,
        platform.isAcceptableOrUnknown(data['platform']!, _platformMeta),
      );
    }
    if (data.containsKey('app_version')) {
      context.handle(
        _appVersionMeta,
        appVersion.isAcceptableOrUnknown(data['app_version']!, _appVersionMeta),
      );
    }
    if (data.containsKey('last_seen_at')) {
      context.handle(
        _lastSeenAtMeta,
        lastSeenAt.isAcceptableOrUnknown(
          data['last_seen_at']!,
          _lastSeenAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  LocalDevice map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalDevice(
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      platform: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}platform'],
      ),
      appVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}app_version'],
      ),
      lastSeenAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_seen_at'],
      ),
    );
  }

  @override
  $LocalDevicesTable createAlias(String alias) {
    return $LocalDevicesTable(attachedDatabase, alias);
  }
}

class LocalDevice extends DataClass implements Insertable<LocalDevice> {
  final String uuid;
  final String name;
  final String? platform;
  final String? appVersion;
  final DateTime? lastSeenAt;
  const LocalDevice({
    required this.uuid,
    required this.name,
    this.platform,
    this.appVersion,
    this.lastSeenAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || platform != null) {
      map['platform'] = Variable<String>(platform);
    }
    if (!nullToAbsent || appVersion != null) {
      map['app_version'] = Variable<String>(appVersion);
    }
    if (!nullToAbsent || lastSeenAt != null) {
      map['last_seen_at'] = Variable<DateTime>(lastSeenAt);
    }
    return map;
  }

  LocalDevicesCompanion toCompanion(bool nullToAbsent) {
    return LocalDevicesCompanion(
      uuid: Value(uuid),
      name: Value(name),
      platform: platform == null && nullToAbsent
          ? const Value.absent()
          : Value(platform),
      appVersion: appVersion == null && nullToAbsent
          ? const Value.absent()
          : Value(appVersion),
      lastSeenAt: lastSeenAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSeenAt),
    );
  }

  factory LocalDevice.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalDevice(
      uuid: serializer.fromJson<String>(json['uuid']),
      name: serializer.fromJson<String>(json['name']),
      platform: serializer.fromJson<String?>(json['platform']),
      appVersion: serializer.fromJson<String?>(json['appVersion']),
      lastSeenAt: serializer.fromJson<DateTime?>(json['lastSeenAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'name': serializer.toJson<String>(name),
      'platform': serializer.toJson<String?>(platform),
      'appVersion': serializer.toJson<String?>(appVersion),
      'lastSeenAt': serializer.toJson<DateTime?>(lastSeenAt),
    };
  }

  LocalDevice copyWith({
    String? uuid,
    String? name,
    Value<String?> platform = const Value.absent(),
    Value<String?> appVersion = const Value.absent(),
    Value<DateTime?> lastSeenAt = const Value.absent(),
  }) => LocalDevice(
    uuid: uuid ?? this.uuid,
    name: name ?? this.name,
    platform: platform.present ? platform.value : this.platform,
    appVersion: appVersion.present ? appVersion.value : this.appVersion,
    lastSeenAt: lastSeenAt.present ? lastSeenAt.value : this.lastSeenAt,
  );
  LocalDevice copyWithCompanion(LocalDevicesCompanion data) {
    return LocalDevice(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      name: data.name.present ? data.name.value : this.name,
      platform: data.platform.present ? data.platform.value : this.platform,
      appVersion: data.appVersion.present
          ? data.appVersion.value
          : this.appVersion,
      lastSeenAt: data.lastSeenAt.present
          ? data.lastSeenAt.value
          : this.lastSeenAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalDevice(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('platform: $platform, ')
          ..write('appVersion: $appVersion, ')
          ..write('lastSeenAt: $lastSeenAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uuid, name, platform, appVersion, lastSeenAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalDevice &&
          other.uuid == this.uuid &&
          other.name == this.name &&
          other.platform == this.platform &&
          other.appVersion == this.appVersion &&
          other.lastSeenAt == this.lastSeenAt);
}

class LocalDevicesCompanion extends UpdateCompanion<LocalDevice> {
  final Value<String> uuid;
  final Value<String> name;
  final Value<String?> platform;
  final Value<String?> appVersion;
  final Value<DateTime?> lastSeenAt;
  final Value<int> rowid;
  const LocalDevicesCompanion({
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.platform = const Value.absent(),
    this.appVersion = const Value.absent(),
    this.lastSeenAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocalDevicesCompanion.insert({
    required String uuid,
    required String name,
    this.platform = const Value.absent(),
    this.appVersion = const Value.absent(),
    this.lastSeenAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : uuid = Value(uuid),
       name = Value(name);
  static Insertable<LocalDevice> custom({
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<String>? platform,
    Expression<String>? appVersion,
    Expression<DateTime>? lastSeenAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (platform != null) 'platform': platform,
      if (appVersion != null) 'app_version': appVersion,
      if (lastSeenAt != null) 'last_seen_at': lastSeenAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalDevicesCompanion copyWith({
    Value<String>? uuid,
    Value<String>? name,
    Value<String?>? platform,
    Value<String?>? appVersion,
    Value<DateTime?>? lastSeenAt,
    Value<int>? rowid,
  }) {
    return LocalDevicesCompanion(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      platform: platform ?? this.platform,
      appVersion: appVersion ?? this.appVersion,
      lastSeenAt: lastSeenAt ?? this.lastSeenAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (platform.present) {
      map['platform'] = Variable<String>(platform.value);
    }
    if (appVersion.present) {
      map['app_version'] = Variable<String>(appVersion.value);
    }
    if (lastSeenAt.present) {
      map['last_seen_at'] = Variable<DateTime>(lastSeenAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalDevicesCompanion(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('platform: $platform, ')
          ..write('appVersion: $appVersion, ')
          ..write('lastSeenAt: $lastSeenAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AuthSessionsTable extends AuthSessions
    with TableInfo<$AuthSessionsTable, AuthSession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuthSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _tokenTypeMeta = const VerificationMeta(
    'tokenType',
  );
  @override
  late final GeneratedColumn<String> tokenType = GeneratedColumn<String>(
    'token_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Bearer'),
  );
  static const VerificationMeta _accessTokenMeta = const VerificationMeta(
    'accessToken',
  );
  @override
  late final GeneratedColumn<String> accessToken = GeneratedColumn<String>(
    'access_token',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userUuidMeta = const VerificationMeta(
    'userUuid',
  );
  @override
  late final GeneratedColumn<String> userUuid = GeneratedColumn<String>(
    'user_uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _businessUuidMeta = const VerificationMeta(
    'businessUuid',
  );
  @override
  late final GeneratedColumn<String> businessUuid = GeneratedColumn<String>(
    'business_uuid',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deviceUuidMeta = const VerificationMeta(
    'deviceUuid',
  );
  @override
  late final GeneratedColumn<String> deviceUuid = GeneratedColumn<String>(
    'device_uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    tokenType,
    accessToken,
    userUuid,
    businessUuid,
    deviceUuid,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'auth_sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<AuthSession> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('token_type')) {
      context.handle(
        _tokenTypeMeta,
        tokenType.isAcceptableOrUnknown(data['token_type']!, _tokenTypeMeta),
      );
    }
    if (data.containsKey('access_token')) {
      context.handle(
        _accessTokenMeta,
        accessToken.isAcceptableOrUnknown(
          data['access_token']!,
          _accessTokenMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_accessTokenMeta);
    }
    if (data.containsKey('user_uuid')) {
      context.handle(
        _userUuidMeta,
        userUuid.isAcceptableOrUnknown(data['user_uuid']!, _userUuidMeta),
      );
    } else if (isInserting) {
      context.missing(_userUuidMeta);
    }
    if (data.containsKey('business_uuid')) {
      context.handle(
        _businessUuidMeta,
        businessUuid.isAcceptableOrUnknown(
          data['business_uuid']!,
          _businessUuidMeta,
        ),
      );
    }
    if (data.containsKey('device_uuid')) {
      context.handle(
        _deviceUuidMeta,
        deviceUuid.isAcceptableOrUnknown(data['device_uuid']!, _deviceUuidMeta),
      );
    } else if (isInserting) {
      context.missing(_deviceUuidMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AuthSession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuthSession(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      tokenType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}token_type'],
      )!,
      accessToken: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}access_token'],
      )!,
      userUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_uuid'],
      )!,
      businessUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}business_uuid'],
      ),
      deviceUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_uuid'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $AuthSessionsTable createAlias(String alias) {
    return $AuthSessionsTable(attachedDatabase, alias);
  }
}

class AuthSession extends DataClass implements Insertable<AuthSession> {
  final int id;
  final String tokenType;
  final String accessToken;
  final String userUuid;
  final String? businessUuid;
  final String deviceUuid;
  final DateTime createdAt;
  const AuthSession({
    required this.id,
    required this.tokenType,
    required this.accessToken,
    required this.userUuid,
    this.businessUuid,
    required this.deviceUuid,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['token_type'] = Variable<String>(tokenType);
    map['access_token'] = Variable<String>(accessToken);
    map['user_uuid'] = Variable<String>(userUuid);
    if (!nullToAbsent || businessUuid != null) {
      map['business_uuid'] = Variable<String>(businessUuid);
    }
    map['device_uuid'] = Variable<String>(deviceUuid);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AuthSessionsCompanion toCompanion(bool nullToAbsent) {
    return AuthSessionsCompanion(
      id: Value(id),
      tokenType: Value(tokenType),
      accessToken: Value(accessToken),
      userUuid: Value(userUuid),
      businessUuid: businessUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(businessUuid),
      deviceUuid: Value(deviceUuid),
      createdAt: Value(createdAt),
    );
  }

  factory AuthSession.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuthSession(
      id: serializer.fromJson<int>(json['id']),
      tokenType: serializer.fromJson<String>(json['tokenType']),
      accessToken: serializer.fromJson<String>(json['accessToken']),
      userUuid: serializer.fromJson<String>(json['userUuid']),
      businessUuid: serializer.fromJson<String?>(json['businessUuid']),
      deviceUuid: serializer.fromJson<String>(json['deviceUuid']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tokenType': serializer.toJson<String>(tokenType),
      'accessToken': serializer.toJson<String>(accessToken),
      'userUuid': serializer.toJson<String>(userUuid),
      'businessUuid': serializer.toJson<String?>(businessUuid),
      'deviceUuid': serializer.toJson<String>(deviceUuid),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  AuthSession copyWith({
    int? id,
    String? tokenType,
    String? accessToken,
    String? userUuid,
    Value<String?> businessUuid = const Value.absent(),
    String? deviceUuid,
    DateTime? createdAt,
  }) => AuthSession(
    id: id ?? this.id,
    tokenType: tokenType ?? this.tokenType,
    accessToken: accessToken ?? this.accessToken,
    userUuid: userUuid ?? this.userUuid,
    businessUuid: businessUuid.present ? businessUuid.value : this.businessUuid,
    deviceUuid: deviceUuid ?? this.deviceUuid,
    createdAt: createdAt ?? this.createdAt,
  );
  AuthSession copyWithCompanion(AuthSessionsCompanion data) {
    return AuthSession(
      id: data.id.present ? data.id.value : this.id,
      tokenType: data.tokenType.present ? data.tokenType.value : this.tokenType,
      accessToken: data.accessToken.present
          ? data.accessToken.value
          : this.accessToken,
      userUuid: data.userUuid.present ? data.userUuid.value : this.userUuid,
      businessUuid: data.businessUuid.present
          ? data.businessUuid.value
          : this.businessUuid,
      deviceUuid: data.deviceUuid.present
          ? data.deviceUuid.value
          : this.deviceUuid,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AuthSession(')
          ..write('id: $id, ')
          ..write('tokenType: $tokenType, ')
          ..write('accessToken: $accessToken, ')
          ..write('userUuid: $userUuid, ')
          ..write('businessUuid: $businessUuid, ')
          ..write('deviceUuid: $deviceUuid, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    tokenType,
    accessToken,
    userUuid,
    businessUuid,
    deviceUuid,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuthSession &&
          other.id == this.id &&
          other.tokenType == this.tokenType &&
          other.accessToken == this.accessToken &&
          other.userUuid == this.userUuid &&
          other.businessUuid == this.businessUuid &&
          other.deviceUuid == this.deviceUuid &&
          other.createdAt == this.createdAt);
}

class AuthSessionsCompanion extends UpdateCompanion<AuthSession> {
  final Value<int> id;
  final Value<String> tokenType;
  final Value<String> accessToken;
  final Value<String> userUuid;
  final Value<String?> businessUuid;
  final Value<String> deviceUuid;
  final Value<DateTime> createdAt;
  const AuthSessionsCompanion({
    this.id = const Value.absent(),
    this.tokenType = const Value.absent(),
    this.accessToken = const Value.absent(),
    this.userUuid = const Value.absent(),
    this.businessUuid = const Value.absent(),
    this.deviceUuid = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  AuthSessionsCompanion.insert({
    this.id = const Value.absent(),
    this.tokenType = const Value.absent(),
    required String accessToken,
    required String userUuid,
    this.businessUuid = const Value.absent(),
    required String deviceUuid,
    required DateTime createdAt,
  }) : accessToken = Value(accessToken),
       userUuid = Value(userUuid),
       deviceUuid = Value(deviceUuid),
       createdAt = Value(createdAt);
  static Insertable<AuthSession> custom({
    Expression<int>? id,
    Expression<String>? tokenType,
    Expression<String>? accessToken,
    Expression<String>? userUuid,
    Expression<String>? businessUuid,
    Expression<String>? deviceUuid,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tokenType != null) 'token_type': tokenType,
      if (accessToken != null) 'access_token': accessToken,
      if (userUuid != null) 'user_uuid': userUuid,
      if (businessUuid != null) 'business_uuid': businessUuid,
      if (deviceUuid != null) 'device_uuid': deviceUuid,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  AuthSessionsCompanion copyWith({
    Value<int>? id,
    Value<String>? tokenType,
    Value<String>? accessToken,
    Value<String>? userUuid,
    Value<String?>? businessUuid,
    Value<String>? deviceUuid,
    Value<DateTime>? createdAt,
  }) {
    return AuthSessionsCompanion(
      id: id ?? this.id,
      tokenType: tokenType ?? this.tokenType,
      accessToken: accessToken ?? this.accessToken,
      userUuid: userUuid ?? this.userUuid,
      businessUuid: businessUuid ?? this.businessUuid,
      deviceUuid: deviceUuid ?? this.deviceUuid,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tokenType.present) {
      map['token_type'] = Variable<String>(tokenType.value);
    }
    if (accessToken.present) {
      map['access_token'] = Variable<String>(accessToken.value);
    }
    if (userUuid.present) {
      map['user_uuid'] = Variable<String>(userUuid.value);
    }
    if (businessUuid.present) {
      map['business_uuid'] = Variable<String>(businessUuid.value);
    }
    if (deviceUuid.present) {
      map['device_uuid'] = Variable<String>(deviceUuid.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuthSessionsCompanion(')
          ..write('id: $id, ')
          ..write('tokenType: $tokenType, ')
          ..write('accessToken: $accessToken, ')
          ..write('userUuid: $userUuid, ')
          ..write('businessUuid: $businessUuid, ')
          ..write('deviceUuid: $deviceUuid, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $OutletsTable extends Outlets with TableInfo<$OutletsTable, Outlet> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OutletsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _businessUuidMeta = const VerificationMeta(
    'businessUuid',
  );
  @override
  late final GeneratedColumn<String> businessUuid = GeneratedColumn<String>(
    'business_uuid',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isSelectedMeta = const VerificationMeta(
    'isSelected',
  );
  @override
  late final GeneratedColumn<bool> isSelected = GeneratedColumn<bool>(
    'is_selected',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_selected" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    uuid,
    businessUuid,
    name,
    code,
    role,
    isSelected,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'outlets';
  @override
  VerificationContext validateIntegrity(
    Insertable<Outlet> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('business_uuid')) {
      context.handle(
        _businessUuidMeta,
        businessUuid.isAcceptableOrUnknown(
          data['business_uuid']!,
          _businessUuidMeta,
        ),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    }
    if (data.containsKey('is_selected')) {
      context.handle(
        _isSelectedMeta,
        isSelected.isAcceptableOrUnknown(data['is_selected']!, _isSelectedMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  Outlet map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Outlet(
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      businessUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}business_uuid'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      ),
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      ),
      isSelected: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_selected'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $OutletsTable createAlias(String alias) {
    return $OutletsTable(attachedDatabase, alias);
  }
}

class Outlet extends DataClass implements Insertable<Outlet> {
  final String uuid;
  final String? businessUuid;
  final String name;
  final String? code;
  final String? role;
  final bool isSelected;
  final DateTime? updatedAt;
  const Outlet({
    required this.uuid,
    this.businessUuid,
    required this.name,
    this.code,
    this.role,
    required this.isSelected,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    if (!nullToAbsent || businessUuid != null) {
      map['business_uuid'] = Variable<String>(businessUuid);
    }
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || code != null) {
      map['code'] = Variable<String>(code);
    }
    if (!nullToAbsent || role != null) {
      map['role'] = Variable<String>(role);
    }
    map['is_selected'] = Variable<bool>(isSelected);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  OutletsCompanion toCompanion(bool nullToAbsent) {
    return OutletsCompanion(
      uuid: Value(uuid),
      businessUuid: businessUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(businessUuid),
      name: Value(name),
      code: code == null && nullToAbsent ? const Value.absent() : Value(code),
      role: role == null && nullToAbsent ? const Value.absent() : Value(role),
      isSelected: Value(isSelected),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory Outlet.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Outlet(
      uuid: serializer.fromJson<String>(json['uuid']),
      businessUuid: serializer.fromJson<String?>(json['businessUuid']),
      name: serializer.fromJson<String>(json['name']),
      code: serializer.fromJson<String?>(json['code']),
      role: serializer.fromJson<String?>(json['role']),
      isSelected: serializer.fromJson<bool>(json['isSelected']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'businessUuid': serializer.toJson<String?>(businessUuid),
      'name': serializer.toJson<String>(name),
      'code': serializer.toJson<String?>(code),
      'role': serializer.toJson<String?>(role),
      'isSelected': serializer.toJson<bool>(isSelected),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  Outlet copyWith({
    String? uuid,
    Value<String?> businessUuid = const Value.absent(),
    String? name,
    Value<String?> code = const Value.absent(),
    Value<String?> role = const Value.absent(),
    bool? isSelected,
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => Outlet(
    uuid: uuid ?? this.uuid,
    businessUuid: businessUuid.present ? businessUuid.value : this.businessUuid,
    name: name ?? this.name,
    code: code.present ? code.value : this.code,
    role: role.present ? role.value : this.role,
    isSelected: isSelected ?? this.isSelected,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  Outlet copyWithCompanion(OutletsCompanion data) {
    return Outlet(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      businessUuid: data.businessUuid.present
          ? data.businessUuid.value
          : this.businessUuid,
      name: data.name.present ? data.name.value : this.name,
      code: data.code.present ? data.code.value : this.code,
      role: data.role.present ? data.role.value : this.role,
      isSelected: data.isSelected.present
          ? data.isSelected.value
          : this.isSelected,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Outlet(')
          ..write('uuid: $uuid, ')
          ..write('businessUuid: $businessUuid, ')
          ..write('name: $name, ')
          ..write('code: $code, ')
          ..write('role: $role, ')
          ..write('isSelected: $isSelected, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(uuid, businessUuid, name, code, role, isSelected, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Outlet &&
          other.uuid == this.uuid &&
          other.businessUuid == this.businessUuid &&
          other.name == this.name &&
          other.code == this.code &&
          other.role == this.role &&
          other.isSelected == this.isSelected &&
          other.updatedAt == this.updatedAt);
}

class OutletsCompanion extends UpdateCompanion<Outlet> {
  final Value<String> uuid;
  final Value<String?> businessUuid;
  final Value<String> name;
  final Value<String?> code;
  final Value<String?> role;
  final Value<bool> isSelected;
  final Value<DateTime?> updatedAt;
  final Value<int> rowid;
  const OutletsCompanion({
    this.uuid = const Value.absent(),
    this.businessUuid = const Value.absent(),
    this.name = const Value.absent(),
    this.code = const Value.absent(),
    this.role = const Value.absent(),
    this.isSelected = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  OutletsCompanion.insert({
    required String uuid,
    this.businessUuid = const Value.absent(),
    required String name,
    this.code = const Value.absent(),
    this.role = const Value.absent(),
    this.isSelected = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : uuid = Value(uuid),
       name = Value(name);
  static Insertable<Outlet> custom({
    Expression<String>? uuid,
    Expression<String>? businessUuid,
    Expression<String>? name,
    Expression<String>? code,
    Expression<String>? role,
    Expression<bool>? isSelected,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (businessUuid != null) 'business_uuid': businessUuid,
      if (name != null) 'name': name,
      if (code != null) 'code': code,
      if (role != null) 'role': role,
      if (isSelected != null) 'is_selected': isSelected,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OutletsCompanion copyWith({
    Value<String>? uuid,
    Value<String?>? businessUuid,
    Value<String>? name,
    Value<String?>? code,
    Value<String?>? role,
    Value<bool>? isSelected,
    Value<DateTime?>? updatedAt,
    Value<int>? rowid,
  }) {
    return OutletsCompanion(
      uuid: uuid ?? this.uuid,
      businessUuid: businessUuid ?? this.businessUuid,
      name: name ?? this.name,
      code: code ?? this.code,
      role: role ?? this.role,
      isSelected: isSelected ?? this.isSelected,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (businessUuid.present) {
      map['business_uuid'] = Variable<String>(businessUuid.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (isSelected.present) {
      map['is_selected'] = Variable<bool>(isSelected.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OutletsCompanion(')
          ..write('uuid: $uuid, ')
          ..write('businessUuid: $businessUuid, ')
          ..write('name: $name, ')
          ..write('code: $code, ')
          ..write('role: $role, ')
          ..write('isSelected: $isSelected, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MenuCategoriesTable extends MenuCategories
    with TableInfo<$MenuCategoriesTable, MenuCategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MenuCategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _businessUuidMeta = const VerificationMeta(
    'businessUuid',
  );
  @override
  late final GeneratedColumn<String> businessUuid = GeneratedColumn<String>(
    'business_uuid',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _outletUuidMeta = const VerificationMeta(
    'outletUuid',
  );
  @override
  late final GeneratedColumn<String> outletUuid = GeneratedColumn<String>(
    'outlet_uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _revisionMeta = const VerificationMeta(
    'revision',
  );
  @override
  late final GeneratedColumn<int> revision = GeneratedColumn<int>(
    'revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    uuid,
    businessUuid,
    outletUuid,
    name,
    sortOrder,
    revision,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'menu_categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<MenuCategory> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('business_uuid')) {
      context.handle(
        _businessUuidMeta,
        businessUuid.isAcceptableOrUnknown(
          data['business_uuid']!,
          _businessUuidMeta,
        ),
      );
    }
    if (data.containsKey('outlet_uuid')) {
      context.handle(
        _outletUuidMeta,
        outletUuid.isAcceptableOrUnknown(data['outlet_uuid']!, _outletUuidMeta),
      );
    } else if (isInserting) {
      context.missing(_outletUuidMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    if (data.containsKey('revision')) {
      context.handle(
        _revisionMeta,
        revision.isAcceptableOrUnknown(data['revision']!, _revisionMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  MenuCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MenuCategory(
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      businessUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}business_uuid'],
      ),
      outletUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}outlet_uuid'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      revision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}revision'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $MenuCategoriesTable createAlias(String alias) {
    return $MenuCategoriesTable(attachedDatabase, alias);
  }
}

class MenuCategory extends DataClass implements Insertable<MenuCategory> {
  final String uuid;
  final String? businessUuid;
  final String outletUuid;
  final String name;
  final int sortOrder;
  final int revision;
  final DateTime? updatedAt;
  const MenuCategory({
    required this.uuid,
    this.businessUuid,
    required this.outletUuid,
    required this.name,
    required this.sortOrder,
    required this.revision,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    if (!nullToAbsent || businessUuid != null) {
      map['business_uuid'] = Variable<String>(businessUuid);
    }
    map['outlet_uuid'] = Variable<String>(outletUuid);
    map['name'] = Variable<String>(name);
    map['sort_order'] = Variable<int>(sortOrder);
    map['revision'] = Variable<int>(revision);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  MenuCategoriesCompanion toCompanion(bool nullToAbsent) {
    return MenuCategoriesCompanion(
      uuid: Value(uuid),
      businessUuid: businessUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(businessUuid),
      outletUuid: Value(outletUuid),
      name: Value(name),
      sortOrder: Value(sortOrder),
      revision: Value(revision),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory MenuCategory.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MenuCategory(
      uuid: serializer.fromJson<String>(json['uuid']),
      businessUuid: serializer.fromJson<String?>(json['businessUuid']),
      outletUuid: serializer.fromJson<String>(json['outletUuid']),
      name: serializer.fromJson<String>(json['name']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      revision: serializer.fromJson<int>(json['revision']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'businessUuid': serializer.toJson<String?>(businessUuid),
      'outletUuid': serializer.toJson<String>(outletUuid),
      'name': serializer.toJson<String>(name),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'revision': serializer.toJson<int>(revision),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  MenuCategory copyWith({
    String? uuid,
    Value<String?> businessUuid = const Value.absent(),
    String? outletUuid,
    String? name,
    int? sortOrder,
    int? revision,
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => MenuCategory(
    uuid: uuid ?? this.uuid,
    businessUuid: businessUuid.present ? businessUuid.value : this.businessUuid,
    outletUuid: outletUuid ?? this.outletUuid,
    name: name ?? this.name,
    sortOrder: sortOrder ?? this.sortOrder,
    revision: revision ?? this.revision,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  MenuCategory copyWithCompanion(MenuCategoriesCompanion data) {
    return MenuCategory(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      businessUuid: data.businessUuid.present
          ? data.businessUuid.value
          : this.businessUuid,
      outletUuid: data.outletUuid.present
          ? data.outletUuid.value
          : this.outletUuid,
      name: data.name.present ? data.name.value : this.name,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      revision: data.revision.present ? data.revision.value : this.revision,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MenuCategory(')
          ..write('uuid: $uuid, ')
          ..write('businessUuid: $businessUuid, ')
          ..write('outletUuid: $outletUuid, ')
          ..write('name: $name, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('revision: $revision, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uuid,
    businessUuid,
    outletUuid,
    name,
    sortOrder,
    revision,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MenuCategory &&
          other.uuid == this.uuid &&
          other.businessUuid == this.businessUuid &&
          other.outletUuid == this.outletUuid &&
          other.name == this.name &&
          other.sortOrder == this.sortOrder &&
          other.revision == this.revision &&
          other.updatedAt == this.updatedAt);
}

class MenuCategoriesCompanion extends UpdateCompanion<MenuCategory> {
  final Value<String> uuid;
  final Value<String?> businessUuid;
  final Value<String> outletUuid;
  final Value<String> name;
  final Value<int> sortOrder;
  final Value<int> revision;
  final Value<DateTime?> updatedAt;
  final Value<int> rowid;
  const MenuCategoriesCompanion({
    this.uuid = const Value.absent(),
    this.businessUuid = const Value.absent(),
    this.outletUuid = const Value.absent(),
    this.name = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.revision = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MenuCategoriesCompanion.insert({
    required String uuid,
    this.businessUuid = const Value.absent(),
    required String outletUuid,
    required String name,
    this.sortOrder = const Value.absent(),
    this.revision = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : uuid = Value(uuid),
       outletUuid = Value(outletUuid),
       name = Value(name);
  static Insertable<MenuCategory> custom({
    Expression<String>? uuid,
    Expression<String>? businessUuid,
    Expression<String>? outletUuid,
    Expression<String>? name,
    Expression<int>? sortOrder,
    Expression<int>? revision,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (businessUuid != null) 'business_uuid': businessUuid,
      if (outletUuid != null) 'outlet_uuid': outletUuid,
      if (name != null) 'name': name,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (revision != null) 'revision': revision,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MenuCategoriesCompanion copyWith({
    Value<String>? uuid,
    Value<String?>? businessUuid,
    Value<String>? outletUuid,
    Value<String>? name,
    Value<int>? sortOrder,
    Value<int>? revision,
    Value<DateTime?>? updatedAt,
    Value<int>? rowid,
  }) {
    return MenuCategoriesCompanion(
      uuid: uuid ?? this.uuid,
      businessUuid: businessUuid ?? this.businessUuid,
      outletUuid: outletUuid ?? this.outletUuid,
      name: name ?? this.name,
      sortOrder: sortOrder ?? this.sortOrder,
      revision: revision ?? this.revision,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (businessUuid.present) {
      map['business_uuid'] = Variable<String>(businessUuid.value);
    }
    if (outletUuid.present) {
      map['outlet_uuid'] = Variable<String>(outletUuid.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (revision.present) {
      map['revision'] = Variable<int>(revision.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MenuCategoriesCompanion(')
          ..write('uuid: $uuid, ')
          ..write('businessUuid: $businessUuid, ')
          ..write('outletUuid: $outletUuid, ')
          ..write('name: $name, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('revision: $revision, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MenuItemsTable extends MenuItems
    with TableInfo<$MenuItemsTable, MenuItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MenuItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _businessUuidMeta = const VerificationMeta(
    'businessUuid',
  );
  @override
  late final GeneratedColumn<String> businessUuid = GeneratedColumn<String>(
    'business_uuid',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _outletUuidMeta = const VerificationMeta(
    'outletUuid',
  );
  @override
  late final GeneratedColumn<String> outletUuid = GeneratedColumn<String>(
    'outlet_uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryUuidMeta = const VerificationMeta(
    'categoryUuid',
  );
  @override
  late final GeneratedColumn<String> categoryUuid = GeneratedColumn<String>(
    'category_uuid',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _skuMeta = const VerificationMeta('sku');
  @override
  late final GeneratedColumn<String> sku = GeneratedColumn<String>(
    'sku',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<int> price = GeneratedColumn<int>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isRetailReadyMeta = const VerificationMeta(
    'isRetailReady',
  );
  @override
  late final GeneratedColumn<bool> isRetailReady = GeneratedColumn<bool>(
    'is_retail_ready',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_retail_ready" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _revisionMeta = const VerificationMeta(
    'revision',
  );
  @override
  late final GeneratedColumn<int> revision = GeneratedColumn<int>(
    'revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    uuid,
    businessUuid,
    outletUuid,
    categoryUuid,
    name,
    description,
    sku,
    imageUrl,
    price,
    isRetailReady,
    revision,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'menu_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<MenuItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('business_uuid')) {
      context.handle(
        _businessUuidMeta,
        businessUuid.isAcceptableOrUnknown(
          data['business_uuid']!,
          _businessUuidMeta,
        ),
      );
    }
    if (data.containsKey('outlet_uuid')) {
      context.handle(
        _outletUuidMeta,
        outletUuid.isAcceptableOrUnknown(data['outlet_uuid']!, _outletUuidMeta),
      );
    } else if (isInserting) {
      context.missing(_outletUuidMeta);
    }
    if (data.containsKey('category_uuid')) {
      context.handle(
        _categoryUuidMeta,
        categoryUuid.isAcceptableOrUnknown(
          data['category_uuid']!,
          _categoryUuidMeta,
        ),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('sku')) {
      context.handle(
        _skuMeta,
        sku.isAcceptableOrUnknown(data['sku']!, _skuMeta),
      );
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('is_retail_ready')) {
      context.handle(
        _isRetailReadyMeta,
        isRetailReady.isAcceptableOrUnknown(
          data['is_retail_ready']!,
          _isRetailReadyMeta,
        ),
      );
    }
    if (data.containsKey('revision')) {
      context.handle(
        _revisionMeta,
        revision.isAcceptableOrUnknown(data['revision']!, _revisionMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  MenuItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MenuItem(
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      businessUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}business_uuid'],
      ),
      outletUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}outlet_uuid'],
      )!,
      categoryUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_uuid'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      sku: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sku'],
      ),
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      ),
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}price'],
      )!,
      isRetailReady: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_retail_ready'],
      )!,
      revision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}revision'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $MenuItemsTable createAlias(String alias) {
    return $MenuItemsTable(attachedDatabase, alias);
  }
}

class MenuItem extends DataClass implements Insertable<MenuItem> {
  final String uuid;
  final String? businessUuid;
  final String outletUuid;
  final String? categoryUuid;
  final String name;
  final String? description;
  final String? sku;
  final String? imageUrl;
  final int price;
  final bool isRetailReady;
  final int revision;
  final DateTime? updatedAt;
  const MenuItem({
    required this.uuid,
    this.businessUuid,
    required this.outletUuid,
    this.categoryUuid,
    required this.name,
    this.description,
    this.sku,
    this.imageUrl,
    required this.price,
    required this.isRetailReady,
    required this.revision,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    if (!nullToAbsent || businessUuid != null) {
      map['business_uuid'] = Variable<String>(businessUuid);
    }
    map['outlet_uuid'] = Variable<String>(outletUuid);
    if (!nullToAbsent || categoryUuid != null) {
      map['category_uuid'] = Variable<String>(categoryUuid);
    }
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || sku != null) {
      map['sku'] = Variable<String>(sku);
    }
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    map['price'] = Variable<int>(price);
    map['is_retail_ready'] = Variable<bool>(isRetailReady);
    map['revision'] = Variable<int>(revision);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  MenuItemsCompanion toCompanion(bool nullToAbsent) {
    return MenuItemsCompanion(
      uuid: Value(uuid),
      businessUuid: businessUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(businessUuid),
      outletUuid: Value(outletUuid),
      categoryUuid: categoryUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryUuid),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      sku: sku == null && nullToAbsent ? const Value.absent() : Value(sku),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      price: Value(price),
      isRetailReady: Value(isRetailReady),
      revision: Value(revision),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory MenuItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MenuItem(
      uuid: serializer.fromJson<String>(json['uuid']),
      businessUuid: serializer.fromJson<String?>(json['businessUuid']),
      outletUuid: serializer.fromJson<String>(json['outletUuid']),
      categoryUuid: serializer.fromJson<String?>(json['categoryUuid']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      sku: serializer.fromJson<String?>(json['sku']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      price: serializer.fromJson<int>(json['price']),
      isRetailReady: serializer.fromJson<bool>(json['isRetailReady']),
      revision: serializer.fromJson<int>(json['revision']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'businessUuid': serializer.toJson<String?>(businessUuid),
      'outletUuid': serializer.toJson<String>(outletUuid),
      'categoryUuid': serializer.toJson<String?>(categoryUuid),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'sku': serializer.toJson<String?>(sku),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'price': serializer.toJson<int>(price),
      'isRetailReady': serializer.toJson<bool>(isRetailReady),
      'revision': serializer.toJson<int>(revision),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  MenuItem copyWith({
    String? uuid,
    Value<String?> businessUuid = const Value.absent(),
    String? outletUuid,
    Value<String?> categoryUuid = const Value.absent(),
    String? name,
    Value<String?> description = const Value.absent(),
    Value<String?> sku = const Value.absent(),
    Value<String?> imageUrl = const Value.absent(),
    int? price,
    bool? isRetailReady,
    int? revision,
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => MenuItem(
    uuid: uuid ?? this.uuid,
    businessUuid: businessUuid.present ? businessUuid.value : this.businessUuid,
    outletUuid: outletUuid ?? this.outletUuid,
    categoryUuid: categoryUuid.present ? categoryUuid.value : this.categoryUuid,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    sku: sku.present ? sku.value : this.sku,
    imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
    price: price ?? this.price,
    isRetailReady: isRetailReady ?? this.isRetailReady,
    revision: revision ?? this.revision,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  MenuItem copyWithCompanion(MenuItemsCompanion data) {
    return MenuItem(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      businessUuid: data.businessUuid.present
          ? data.businessUuid.value
          : this.businessUuid,
      outletUuid: data.outletUuid.present
          ? data.outletUuid.value
          : this.outletUuid,
      categoryUuid: data.categoryUuid.present
          ? data.categoryUuid.value
          : this.categoryUuid,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      sku: data.sku.present ? data.sku.value : this.sku,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      price: data.price.present ? data.price.value : this.price,
      isRetailReady: data.isRetailReady.present
          ? data.isRetailReady.value
          : this.isRetailReady,
      revision: data.revision.present ? data.revision.value : this.revision,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MenuItem(')
          ..write('uuid: $uuid, ')
          ..write('businessUuid: $businessUuid, ')
          ..write('outletUuid: $outletUuid, ')
          ..write('categoryUuid: $categoryUuid, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('sku: $sku, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('price: $price, ')
          ..write('isRetailReady: $isRetailReady, ')
          ..write('revision: $revision, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uuid,
    businessUuid,
    outletUuid,
    categoryUuid,
    name,
    description,
    sku,
    imageUrl,
    price,
    isRetailReady,
    revision,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MenuItem &&
          other.uuid == this.uuid &&
          other.businessUuid == this.businessUuid &&
          other.outletUuid == this.outletUuid &&
          other.categoryUuid == this.categoryUuid &&
          other.name == this.name &&
          other.description == this.description &&
          other.sku == this.sku &&
          other.imageUrl == this.imageUrl &&
          other.price == this.price &&
          other.isRetailReady == this.isRetailReady &&
          other.revision == this.revision &&
          other.updatedAt == this.updatedAt);
}

class MenuItemsCompanion extends UpdateCompanion<MenuItem> {
  final Value<String> uuid;
  final Value<String?> businessUuid;
  final Value<String> outletUuid;
  final Value<String?> categoryUuid;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> sku;
  final Value<String?> imageUrl;
  final Value<int> price;
  final Value<bool> isRetailReady;
  final Value<int> revision;
  final Value<DateTime?> updatedAt;
  final Value<int> rowid;
  const MenuItemsCompanion({
    this.uuid = const Value.absent(),
    this.businessUuid = const Value.absent(),
    this.outletUuid = const Value.absent(),
    this.categoryUuid = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.sku = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.price = const Value.absent(),
    this.isRetailReady = const Value.absent(),
    this.revision = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MenuItemsCompanion.insert({
    required String uuid,
    this.businessUuid = const Value.absent(),
    required String outletUuid,
    this.categoryUuid = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.sku = const Value.absent(),
    this.imageUrl = const Value.absent(),
    required int price,
    this.isRetailReady = const Value.absent(),
    this.revision = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : uuid = Value(uuid),
       outletUuid = Value(outletUuid),
       name = Value(name),
       price = Value(price);
  static Insertable<MenuItem> custom({
    Expression<String>? uuid,
    Expression<String>? businessUuid,
    Expression<String>? outletUuid,
    Expression<String>? categoryUuid,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? sku,
    Expression<String>? imageUrl,
    Expression<int>? price,
    Expression<bool>? isRetailReady,
    Expression<int>? revision,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (businessUuid != null) 'business_uuid': businessUuid,
      if (outletUuid != null) 'outlet_uuid': outletUuid,
      if (categoryUuid != null) 'category_uuid': categoryUuid,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (sku != null) 'sku': sku,
      if (imageUrl != null) 'image_url': imageUrl,
      if (price != null) 'price': price,
      if (isRetailReady != null) 'is_retail_ready': isRetailReady,
      if (revision != null) 'revision': revision,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MenuItemsCompanion copyWith({
    Value<String>? uuid,
    Value<String?>? businessUuid,
    Value<String>? outletUuid,
    Value<String?>? categoryUuid,
    Value<String>? name,
    Value<String?>? description,
    Value<String?>? sku,
    Value<String?>? imageUrl,
    Value<int>? price,
    Value<bool>? isRetailReady,
    Value<int>? revision,
    Value<DateTime?>? updatedAt,
    Value<int>? rowid,
  }) {
    return MenuItemsCompanion(
      uuid: uuid ?? this.uuid,
      businessUuid: businessUuid ?? this.businessUuid,
      outletUuid: outletUuid ?? this.outletUuid,
      categoryUuid: categoryUuid ?? this.categoryUuid,
      name: name ?? this.name,
      description: description ?? this.description,
      sku: sku ?? this.sku,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      isRetailReady: isRetailReady ?? this.isRetailReady,
      revision: revision ?? this.revision,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (businessUuid.present) {
      map['business_uuid'] = Variable<String>(businessUuid.value);
    }
    if (outletUuid.present) {
      map['outlet_uuid'] = Variable<String>(outletUuid.value);
    }
    if (categoryUuid.present) {
      map['category_uuid'] = Variable<String>(categoryUuid.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (sku.present) {
      map['sku'] = Variable<String>(sku.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (price.present) {
      map['price'] = Variable<int>(price.value);
    }
    if (isRetailReady.present) {
      map['is_retail_ready'] = Variable<bool>(isRetailReady.value);
    }
    if (revision.present) {
      map['revision'] = Variable<int>(revision.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MenuItemsCompanion(')
          ..write('uuid: $uuid, ')
          ..write('businessUuid: $businessUuid, ')
          ..write('outletUuid: $outletUuid, ')
          ..write('categoryUuid: $categoryUuid, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('sku: $sku, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('price: $price, ')
          ..write('isRetailReady: $isRetailReady, ')
          ..write('revision: $revision, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PaymentMethodsTable extends PaymentMethods
    with TableInfo<$PaymentMethodsTable, PaymentMethod> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PaymentMethodsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _businessUuidMeta = const VerificationMeta(
    'businessUuid',
  );
  @override
  late final GeneratedColumn<String> businessUuid = GeneratedColumn<String>(
    'business_uuid',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _revisionMeta = const VerificationMeta(
    'revision',
  );
  @override
  late final GeneratedColumn<int> revision = GeneratedColumn<int>(
    'revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    uuid,
    businessUuid,
    name,
    code,
    sortOrder,
    revision,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'payment_methods';
  @override
  VerificationContext validateIntegrity(
    Insertable<PaymentMethod> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('business_uuid')) {
      context.handle(
        _businessUuidMeta,
        businessUuid.isAcceptableOrUnknown(
          data['business_uuid']!,
          _businessUuidMeta,
        ),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    if (data.containsKey('revision')) {
      context.handle(
        _revisionMeta,
        revision.isAcceptableOrUnknown(data['revision']!, _revisionMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  PaymentMethod map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PaymentMethod(
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      businessUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}business_uuid'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      revision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}revision'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $PaymentMethodsTable createAlias(String alias) {
    return $PaymentMethodsTable(attachedDatabase, alias);
  }
}

class PaymentMethod extends DataClass implements Insertable<PaymentMethod> {
  final String uuid;
  final String? businessUuid;
  final String name;
  final String code;
  final int sortOrder;
  final int revision;
  final DateTime? updatedAt;
  const PaymentMethod({
    required this.uuid,
    this.businessUuid,
    required this.name,
    required this.code,
    required this.sortOrder,
    required this.revision,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    if (!nullToAbsent || businessUuid != null) {
      map['business_uuid'] = Variable<String>(businessUuid);
    }
    map['name'] = Variable<String>(name);
    map['code'] = Variable<String>(code);
    map['sort_order'] = Variable<int>(sortOrder);
    map['revision'] = Variable<int>(revision);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  PaymentMethodsCompanion toCompanion(bool nullToAbsent) {
    return PaymentMethodsCompanion(
      uuid: Value(uuid),
      businessUuid: businessUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(businessUuid),
      name: Value(name),
      code: Value(code),
      sortOrder: Value(sortOrder),
      revision: Value(revision),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory PaymentMethod.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PaymentMethod(
      uuid: serializer.fromJson<String>(json['uuid']),
      businessUuid: serializer.fromJson<String?>(json['businessUuid']),
      name: serializer.fromJson<String>(json['name']),
      code: serializer.fromJson<String>(json['code']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      revision: serializer.fromJson<int>(json['revision']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'businessUuid': serializer.toJson<String?>(businessUuid),
      'name': serializer.toJson<String>(name),
      'code': serializer.toJson<String>(code),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'revision': serializer.toJson<int>(revision),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  PaymentMethod copyWith({
    String? uuid,
    Value<String?> businessUuid = const Value.absent(),
    String? name,
    String? code,
    int? sortOrder,
    int? revision,
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => PaymentMethod(
    uuid: uuid ?? this.uuid,
    businessUuid: businessUuid.present ? businessUuid.value : this.businessUuid,
    name: name ?? this.name,
    code: code ?? this.code,
    sortOrder: sortOrder ?? this.sortOrder,
    revision: revision ?? this.revision,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  PaymentMethod copyWithCompanion(PaymentMethodsCompanion data) {
    return PaymentMethod(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      businessUuid: data.businessUuid.present
          ? data.businessUuid.value
          : this.businessUuid,
      name: data.name.present ? data.name.value : this.name,
      code: data.code.present ? data.code.value : this.code,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      revision: data.revision.present ? data.revision.value : this.revision,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PaymentMethod(')
          ..write('uuid: $uuid, ')
          ..write('businessUuid: $businessUuid, ')
          ..write('name: $name, ')
          ..write('code: $code, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('revision: $revision, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uuid,
    businessUuid,
    name,
    code,
    sortOrder,
    revision,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PaymentMethod &&
          other.uuid == this.uuid &&
          other.businessUuid == this.businessUuid &&
          other.name == this.name &&
          other.code == this.code &&
          other.sortOrder == this.sortOrder &&
          other.revision == this.revision &&
          other.updatedAt == this.updatedAt);
}

class PaymentMethodsCompanion extends UpdateCompanion<PaymentMethod> {
  final Value<String> uuid;
  final Value<String?> businessUuid;
  final Value<String> name;
  final Value<String> code;
  final Value<int> sortOrder;
  final Value<int> revision;
  final Value<DateTime?> updatedAt;
  final Value<int> rowid;
  const PaymentMethodsCompanion({
    this.uuid = const Value.absent(),
    this.businessUuid = const Value.absent(),
    this.name = const Value.absent(),
    this.code = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.revision = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PaymentMethodsCompanion.insert({
    required String uuid,
    this.businessUuid = const Value.absent(),
    required String name,
    required String code,
    this.sortOrder = const Value.absent(),
    this.revision = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : uuid = Value(uuid),
       name = Value(name),
       code = Value(code);
  static Insertable<PaymentMethod> custom({
    Expression<String>? uuid,
    Expression<String>? businessUuid,
    Expression<String>? name,
    Expression<String>? code,
    Expression<int>? sortOrder,
    Expression<int>? revision,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (businessUuid != null) 'business_uuid': businessUuid,
      if (name != null) 'name': name,
      if (code != null) 'code': code,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (revision != null) 'revision': revision,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PaymentMethodsCompanion copyWith({
    Value<String>? uuid,
    Value<String?>? businessUuid,
    Value<String>? name,
    Value<String>? code,
    Value<int>? sortOrder,
    Value<int>? revision,
    Value<DateTime?>? updatedAt,
    Value<int>? rowid,
  }) {
    return PaymentMethodsCompanion(
      uuid: uuid ?? this.uuid,
      businessUuid: businessUuid ?? this.businessUuid,
      name: name ?? this.name,
      code: code ?? this.code,
      sortOrder: sortOrder ?? this.sortOrder,
      revision: revision ?? this.revision,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (businessUuid.present) {
      map['business_uuid'] = Variable<String>(businessUuid.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (revision.present) {
      map['revision'] = Variable<int>(revision.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PaymentMethodsCompanion(')
          ..write('uuid: $uuid, ')
          ..write('businessUuid: $businessUuid, ')
          ..write('name: $name, ')
          ..write('code: $code, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('revision: $revision, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DiningTablesTable extends DiningTables
    with TableInfo<$DiningTablesTable, DiningTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DiningTablesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _businessUuidMeta = const VerificationMeta(
    'businessUuid',
  );
  @override
  late final GeneratedColumn<String> businessUuid = GeneratedColumn<String>(
    'business_uuid',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _outletUuidMeta = const VerificationMeta(
    'outletUuid',
  );
  @override
  late final GeneratedColumn<String> outletUuid = GeneratedColumn<String>(
    'outlet_uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<String> number = GeneratedColumn<String>(
    'number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _revisionMeta = const VerificationMeta(
    'revision',
  );
  @override
  late final GeneratedColumn<int> revision = GeneratedColumn<int>(
    'revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    uuid,
    businessUuid,
    outletUuid,
    name,
    number,
    revision,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dining_tables';
  @override
  VerificationContext validateIntegrity(
    Insertable<DiningTable> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('business_uuid')) {
      context.handle(
        _businessUuidMeta,
        businessUuid.isAcceptableOrUnknown(
          data['business_uuid']!,
          _businessUuidMeta,
        ),
      );
    }
    if (data.containsKey('outlet_uuid')) {
      context.handle(
        _outletUuidMeta,
        outletUuid.isAcceptableOrUnknown(data['outlet_uuid']!, _outletUuidMeta),
      );
    } else if (isInserting) {
      context.missing(_outletUuidMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('number')) {
      context.handle(
        _numberMeta,
        number.isAcceptableOrUnknown(data['number']!, _numberMeta),
      );
    }
    if (data.containsKey('revision')) {
      context.handle(
        _revisionMeta,
        revision.isAcceptableOrUnknown(data['revision']!, _revisionMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  DiningTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DiningTable(
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      businessUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}business_uuid'],
      ),
      outletUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}outlet_uuid'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      number: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}number'],
      ),
      revision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}revision'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $DiningTablesTable createAlias(String alias) {
    return $DiningTablesTable(attachedDatabase, alias);
  }
}

class DiningTable extends DataClass implements Insertable<DiningTable> {
  final String uuid;
  final String? businessUuid;
  final String outletUuid;
  final String name;
  final String? number;
  final int revision;
  final DateTime? updatedAt;
  const DiningTable({
    required this.uuid,
    this.businessUuid,
    required this.outletUuid,
    required this.name,
    this.number,
    required this.revision,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    if (!nullToAbsent || businessUuid != null) {
      map['business_uuid'] = Variable<String>(businessUuid);
    }
    map['outlet_uuid'] = Variable<String>(outletUuid);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || number != null) {
      map['number'] = Variable<String>(number);
    }
    map['revision'] = Variable<int>(revision);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  DiningTablesCompanion toCompanion(bool nullToAbsent) {
    return DiningTablesCompanion(
      uuid: Value(uuid),
      businessUuid: businessUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(businessUuid),
      outletUuid: Value(outletUuid),
      name: Value(name),
      number: number == null && nullToAbsent
          ? const Value.absent()
          : Value(number),
      revision: Value(revision),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory DiningTable.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DiningTable(
      uuid: serializer.fromJson<String>(json['uuid']),
      businessUuid: serializer.fromJson<String?>(json['businessUuid']),
      outletUuid: serializer.fromJson<String>(json['outletUuid']),
      name: serializer.fromJson<String>(json['name']),
      number: serializer.fromJson<String?>(json['number']),
      revision: serializer.fromJson<int>(json['revision']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'businessUuid': serializer.toJson<String?>(businessUuid),
      'outletUuid': serializer.toJson<String>(outletUuid),
      'name': serializer.toJson<String>(name),
      'number': serializer.toJson<String?>(number),
      'revision': serializer.toJson<int>(revision),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  DiningTable copyWith({
    String? uuid,
    Value<String?> businessUuid = const Value.absent(),
    String? outletUuid,
    String? name,
    Value<String?> number = const Value.absent(),
    int? revision,
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => DiningTable(
    uuid: uuid ?? this.uuid,
    businessUuid: businessUuid.present ? businessUuid.value : this.businessUuid,
    outletUuid: outletUuid ?? this.outletUuid,
    name: name ?? this.name,
    number: number.present ? number.value : this.number,
    revision: revision ?? this.revision,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  DiningTable copyWithCompanion(DiningTablesCompanion data) {
    return DiningTable(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      businessUuid: data.businessUuid.present
          ? data.businessUuid.value
          : this.businessUuid,
      outletUuid: data.outletUuid.present
          ? data.outletUuid.value
          : this.outletUuid,
      name: data.name.present ? data.name.value : this.name,
      number: data.number.present ? data.number.value : this.number,
      revision: data.revision.present ? data.revision.value : this.revision,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DiningTable(')
          ..write('uuid: $uuid, ')
          ..write('businessUuid: $businessUuid, ')
          ..write('outletUuid: $outletUuid, ')
          ..write('name: $name, ')
          ..write('number: $number, ')
          ..write('revision: $revision, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uuid,
    businessUuid,
    outletUuid,
    name,
    number,
    revision,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DiningTable &&
          other.uuid == this.uuid &&
          other.businessUuid == this.businessUuid &&
          other.outletUuid == this.outletUuid &&
          other.name == this.name &&
          other.number == this.number &&
          other.revision == this.revision &&
          other.updatedAt == this.updatedAt);
}

class DiningTablesCompanion extends UpdateCompanion<DiningTable> {
  final Value<String> uuid;
  final Value<String?> businessUuid;
  final Value<String> outletUuid;
  final Value<String> name;
  final Value<String?> number;
  final Value<int> revision;
  final Value<DateTime?> updatedAt;
  final Value<int> rowid;
  const DiningTablesCompanion({
    this.uuid = const Value.absent(),
    this.businessUuid = const Value.absent(),
    this.outletUuid = const Value.absent(),
    this.name = const Value.absent(),
    this.number = const Value.absent(),
    this.revision = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DiningTablesCompanion.insert({
    required String uuid,
    this.businessUuid = const Value.absent(),
    required String outletUuid,
    required String name,
    this.number = const Value.absent(),
    this.revision = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : uuid = Value(uuid),
       outletUuid = Value(outletUuid),
       name = Value(name);
  static Insertable<DiningTable> custom({
    Expression<String>? uuid,
    Expression<String>? businessUuid,
    Expression<String>? outletUuid,
    Expression<String>? name,
    Expression<String>? number,
    Expression<int>? revision,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (businessUuid != null) 'business_uuid': businessUuid,
      if (outletUuid != null) 'outlet_uuid': outletUuid,
      if (name != null) 'name': name,
      if (number != null) 'number': number,
      if (revision != null) 'revision': revision,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DiningTablesCompanion copyWith({
    Value<String>? uuid,
    Value<String?>? businessUuid,
    Value<String>? outletUuid,
    Value<String>? name,
    Value<String?>? number,
    Value<int>? revision,
    Value<DateTime?>? updatedAt,
    Value<int>? rowid,
  }) {
    return DiningTablesCompanion(
      uuid: uuid ?? this.uuid,
      businessUuid: businessUuid ?? this.businessUuid,
      outletUuid: outletUuid ?? this.outletUuid,
      name: name ?? this.name,
      number: number ?? this.number,
      revision: revision ?? this.revision,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (businessUuid.present) {
      map['business_uuid'] = Variable<String>(businessUuid.value);
    }
    if (outletUuid.present) {
      map['outlet_uuid'] = Variable<String>(outletUuid.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (number.present) {
      map['number'] = Variable<String>(number.value);
    }
    if (revision.present) {
      map['revision'] = Variable<int>(revision.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DiningTablesCompanion(')
          ..write('uuid: $uuid, ')
          ..write('businessUuid: $businessUuid, ')
          ..write('outletUuid: $outletUuid, ')
          ..write('name: $name, ')
          ..write('number: $number, ')
          ..write('revision: $revision, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SalesTable extends Sales with TableInfo<$SalesTable, Sale> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SalesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _businessUuidMeta = const VerificationMeta(
    'businessUuid',
  );
  @override
  late final GeneratedColumn<String> businessUuid = GeneratedColumn<String>(
    'business_uuid',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _checkoutGroupUuidMeta = const VerificationMeta(
    'checkoutGroupUuid',
  );
  @override
  late final GeneratedColumn<String> checkoutGroupUuid =
      GeneratedColumn<String>(
        'checkout_group_uuid',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _outletUuidMeta = const VerificationMeta(
    'outletUuid',
  );
  @override
  late final GeneratedColumn<String> outletUuid = GeneratedColumn<String>(
    'outlet_uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _transactionTypeMeta = const VerificationMeta(
    'transactionType',
  );
  @override
  late final GeneratedColumn<String> transactionType = GeneratedColumn<String>(
    'transaction_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('take_away'),
  );
  static const VerificationMeta _diningTableUuidMeta = const VerificationMeta(
    'diningTableUuid',
  );
  @override
  late final GeneratedColumn<String> diningTableUuid = GeneratedColumn<String>(
    'dining_table_uuid',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deviceUuidMeta = const VerificationMeta(
    'deviceUuid',
  );
  @override
  late final GeneratedColumn<String> deviceUuid = GeneratedColumn<String>(
    'device_uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<String> number = GeneratedColumn<String>(
    'number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('completed'),
  );
  static const VerificationMeta _subtotalMeta = const VerificationMeta(
    'subtotal',
  );
  @override
  late final GeneratedColumn<int> subtotal = GeneratedColumn<int>(
    'subtotal',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _discountTotalMeta = const VerificationMeta(
    'discountTotal',
  );
  @override
  late final GeneratedColumn<int> discountTotal = GeneratedColumn<int>(
    'discount_total',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _taxTotalMeta = const VerificationMeta(
    'taxTotal',
  );
  @override
  late final GeneratedColumn<int> taxTotal = GeneratedColumn<int>(
    'tax_total',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _serviceTotalMeta = const VerificationMeta(
    'serviceTotal',
  );
  @override
  late final GeneratedColumn<int> serviceTotal = GeneratedColumn<int>(
    'service_total',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _grandTotalMeta = const VerificationMeta(
    'grandTotal',
  );
  @override
  late final GeneratedColumn<int> grandTotal = GeneratedColumn<int>(
    'grand_total',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idempotencyKeyMeta = const VerificationMeta(
    'idempotencyKey',
  );
  @override
  late final GeneratedColumn<String> idempotencyKey = GeneratedColumn<String>(
    'idempotency_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _syncErrorMeta = const VerificationMeta(
    'syncError',
  );
  @override
  late final GeneratedColumn<String> syncError = GeneratedColumn<String>(
    'sync_error',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _soldAtMeta = const VerificationMeta('soldAt');
  @override
  late final GeneratedColumn<DateTime> soldAt = GeneratedColumn<DateTime>(
    'sold_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _receivedAtMeta = const VerificationMeta(
    'receivedAt',
  );
  @override
  late final GeneratedColumn<DateTime> receivedAt = GeneratedColumn<DateTime>(
    'received_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    uuid,
    businessUuid,
    checkoutGroupUuid,
    outletUuid,
    transactionType,
    diningTableUuid,
    deviceUuid,
    number,
    status,
    subtotal,
    discountTotal,
    taxTotal,
    serviceTotal,
    grandTotal,
    idempotencyKey,
    syncStatus,
    syncError,
    soldAt,
    receivedAt,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sales';
  @override
  VerificationContext validateIntegrity(
    Insertable<Sale> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('business_uuid')) {
      context.handle(
        _businessUuidMeta,
        businessUuid.isAcceptableOrUnknown(
          data['business_uuid']!,
          _businessUuidMeta,
        ),
      );
    }
    if (data.containsKey('checkout_group_uuid')) {
      context.handle(
        _checkoutGroupUuidMeta,
        checkoutGroupUuid.isAcceptableOrUnknown(
          data['checkout_group_uuid']!,
          _checkoutGroupUuidMeta,
        ),
      );
    }
    if (data.containsKey('outlet_uuid')) {
      context.handle(
        _outletUuidMeta,
        outletUuid.isAcceptableOrUnknown(data['outlet_uuid']!, _outletUuidMeta),
      );
    } else if (isInserting) {
      context.missing(_outletUuidMeta);
    }
    if (data.containsKey('transaction_type')) {
      context.handle(
        _transactionTypeMeta,
        transactionType.isAcceptableOrUnknown(
          data['transaction_type']!,
          _transactionTypeMeta,
        ),
      );
    }
    if (data.containsKey('dining_table_uuid')) {
      context.handle(
        _diningTableUuidMeta,
        diningTableUuid.isAcceptableOrUnknown(
          data['dining_table_uuid']!,
          _diningTableUuidMeta,
        ),
      );
    }
    if (data.containsKey('device_uuid')) {
      context.handle(
        _deviceUuidMeta,
        deviceUuid.isAcceptableOrUnknown(data['device_uuid']!, _deviceUuidMeta),
      );
    } else if (isInserting) {
      context.missing(_deviceUuidMeta);
    }
    if (data.containsKey('number')) {
      context.handle(
        _numberMeta,
        number.isAcceptableOrUnknown(data['number']!, _numberMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('subtotal')) {
      context.handle(
        _subtotalMeta,
        subtotal.isAcceptableOrUnknown(data['subtotal']!, _subtotalMeta),
      );
    } else if (isInserting) {
      context.missing(_subtotalMeta);
    }
    if (data.containsKey('discount_total')) {
      context.handle(
        _discountTotalMeta,
        discountTotal.isAcceptableOrUnknown(
          data['discount_total']!,
          _discountTotalMeta,
        ),
      );
    }
    if (data.containsKey('tax_total')) {
      context.handle(
        _taxTotalMeta,
        taxTotal.isAcceptableOrUnknown(data['tax_total']!, _taxTotalMeta),
      );
    }
    if (data.containsKey('service_total')) {
      context.handle(
        _serviceTotalMeta,
        serviceTotal.isAcceptableOrUnknown(
          data['service_total']!,
          _serviceTotalMeta,
        ),
      );
    }
    if (data.containsKey('grand_total')) {
      context.handle(
        _grandTotalMeta,
        grandTotal.isAcceptableOrUnknown(data['grand_total']!, _grandTotalMeta),
      );
    } else if (isInserting) {
      context.missing(_grandTotalMeta);
    }
    if (data.containsKey('idempotency_key')) {
      context.handle(
        _idempotencyKeyMeta,
        idempotencyKey.isAcceptableOrUnknown(
          data['idempotency_key']!,
          _idempotencyKeyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_idempotencyKeyMeta);
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('sync_error')) {
      context.handle(
        _syncErrorMeta,
        syncError.isAcceptableOrUnknown(data['sync_error']!, _syncErrorMeta),
      );
    }
    if (data.containsKey('sold_at')) {
      context.handle(
        _soldAtMeta,
        soldAt.isAcceptableOrUnknown(data['sold_at']!, _soldAtMeta),
      );
    } else if (isInserting) {
      context.missing(_soldAtMeta);
    }
    if (data.containsKey('received_at')) {
      context.handle(
        _receivedAtMeta,
        receivedAt.isAcceptableOrUnknown(data['received_at']!, _receivedAtMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  Sale map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Sale(
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      businessUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}business_uuid'],
      ),
      checkoutGroupUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}checkout_group_uuid'],
      ),
      outletUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}outlet_uuid'],
      )!,
      transactionType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}transaction_type'],
      )!,
      diningTableUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dining_table_uuid'],
      ),
      deviceUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_uuid'],
      )!,
      number: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}number'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      subtotal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}subtotal'],
      )!,
      discountTotal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}discount_total'],
      )!,
      taxTotal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tax_total'],
      )!,
      serviceTotal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}service_total'],
      )!,
      grandTotal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}grand_total'],
      )!,
      idempotencyKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}idempotency_key'],
      )!,
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      syncError: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_error'],
      ),
      soldAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}sold_at'],
      )!,
      receivedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}received_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $SalesTable createAlias(String alias) {
    return $SalesTable(attachedDatabase, alias);
  }
}

class Sale extends DataClass implements Insertable<Sale> {
  final String uuid;
  final String? businessUuid;
  final String? checkoutGroupUuid;
  final String outletUuid;
  final String transactionType;
  final String? diningTableUuid;
  final String deviceUuid;
  final String? number;
  final String status;
  final int subtotal;
  final int discountTotal;
  final int taxTotal;
  final int serviceTotal;
  final int grandTotal;
  final String idempotencyKey;
  final String syncStatus;
  final String? syncError;
  final DateTime soldAt;
  final DateTime? receivedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Sale({
    required this.uuid,
    this.businessUuid,
    this.checkoutGroupUuid,
    required this.outletUuid,
    required this.transactionType,
    this.diningTableUuid,
    required this.deviceUuid,
    this.number,
    required this.status,
    required this.subtotal,
    required this.discountTotal,
    required this.taxTotal,
    required this.serviceTotal,
    required this.grandTotal,
    required this.idempotencyKey,
    required this.syncStatus,
    this.syncError,
    required this.soldAt,
    this.receivedAt,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    if (!nullToAbsent || businessUuid != null) {
      map['business_uuid'] = Variable<String>(businessUuid);
    }
    if (!nullToAbsent || checkoutGroupUuid != null) {
      map['checkout_group_uuid'] = Variable<String>(checkoutGroupUuid);
    }
    map['outlet_uuid'] = Variable<String>(outletUuid);
    map['transaction_type'] = Variable<String>(transactionType);
    if (!nullToAbsent || diningTableUuid != null) {
      map['dining_table_uuid'] = Variable<String>(diningTableUuid);
    }
    map['device_uuid'] = Variable<String>(deviceUuid);
    if (!nullToAbsent || number != null) {
      map['number'] = Variable<String>(number);
    }
    map['status'] = Variable<String>(status);
    map['subtotal'] = Variable<int>(subtotal);
    map['discount_total'] = Variable<int>(discountTotal);
    map['tax_total'] = Variable<int>(taxTotal);
    map['service_total'] = Variable<int>(serviceTotal);
    map['grand_total'] = Variable<int>(grandTotal);
    map['idempotency_key'] = Variable<String>(idempotencyKey);
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || syncError != null) {
      map['sync_error'] = Variable<String>(syncError);
    }
    map['sold_at'] = Variable<DateTime>(soldAt);
    if (!nullToAbsent || receivedAt != null) {
      map['received_at'] = Variable<DateTime>(receivedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SalesCompanion toCompanion(bool nullToAbsent) {
    return SalesCompanion(
      uuid: Value(uuid),
      businessUuid: businessUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(businessUuid),
      checkoutGroupUuid: checkoutGroupUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(checkoutGroupUuid),
      outletUuid: Value(outletUuid),
      transactionType: Value(transactionType),
      diningTableUuid: diningTableUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(diningTableUuid),
      deviceUuid: Value(deviceUuid),
      number: number == null && nullToAbsent
          ? const Value.absent()
          : Value(number),
      status: Value(status),
      subtotal: Value(subtotal),
      discountTotal: Value(discountTotal),
      taxTotal: Value(taxTotal),
      serviceTotal: Value(serviceTotal),
      grandTotal: Value(grandTotal),
      idempotencyKey: Value(idempotencyKey),
      syncStatus: Value(syncStatus),
      syncError: syncError == null && nullToAbsent
          ? const Value.absent()
          : Value(syncError),
      soldAt: Value(soldAt),
      receivedAt: receivedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(receivedAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Sale.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Sale(
      uuid: serializer.fromJson<String>(json['uuid']),
      businessUuid: serializer.fromJson<String?>(json['businessUuid']),
      checkoutGroupUuid: serializer.fromJson<String?>(
        json['checkoutGroupUuid'],
      ),
      outletUuid: serializer.fromJson<String>(json['outletUuid']),
      transactionType: serializer.fromJson<String>(json['transactionType']),
      diningTableUuid: serializer.fromJson<String?>(json['diningTableUuid']),
      deviceUuid: serializer.fromJson<String>(json['deviceUuid']),
      number: serializer.fromJson<String?>(json['number']),
      status: serializer.fromJson<String>(json['status']),
      subtotal: serializer.fromJson<int>(json['subtotal']),
      discountTotal: serializer.fromJson<int>(json['discountTotal']),
      taxTotal: serializer.fromJson<int>(json['taxTotal']),
      serviceTotal: serializer.fromJson<int>(json['serviceTotal']),
      grandTotal: serializer.fromJson<int>(json['grandTotal']),
      idempotencyKey: serializer.fromJson<String>(json['idempotencyKey']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      syncError: serializer.fromJson<String?>(json['syncError']),
      soldAt: serializer.fromJson<DateTime>(json['soldAt']),
      receivedAt: serializer.fromJson<DateTime?>(json['receivedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'businessUuid': serializer.toJson<String?>(businessUuid),
      'checkoutGroupUuid': serializer.toJson<String?>(checkoutGroupUuid),
      'outletUuid': serializer.toJson<String>(outletUuid),
      'transactionType': serializer.toJson<String>(transactionType),
      'diningTableUuid': serializer.toJson<String?>(diningTableUuid),
      'deviceUuid': serializer.toJson<String>(deviceUuid),
      'number': serializer.toJson<String?>(number),
      'status': serializer.toJson<String>(status),
      'subtotal': serializer.toJson<int>(subtotal),
      'discountTotal': serializer.toJson<int>(discountTotal),
      'taxTotal': serializer.toJson<int>(taxTotal),
      'serviceTotal': serializer.toJson<int>(serviceTotal),
      'grandTotal': serializer.toJson<int>(grandTotal),
      'idempotencyKey': serializer.toJson<String>(idempotencyKey),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'syncError': serializer.toJson<String?>(syncError),
      'soldAt': serializer.toJson<DateTime>(soldAt),
      'receivedAt': serializer.toJson<DateTime?>(receivedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Sale copyWith({
    String? uuid,
    Value<String?> businessUuid = const Value.absent(),
    Value<String?> checkoutGroupUuid = const Value.absent(),
    String? outletUuid,
    String? transactionType,
    Value<String?> diningTableUuid = const Value.absent(),
    String? deviceUuid,
    Value<String?> number = const Value.absent(),
    String? status,
    int? subtotal,
    int? discountTotal,
    int? taxTotal,
    int? serviceTotal,
    int? grandTotal,
    String? idempotencyKey,
    String? syncStatus,
    Value<String?> syncError = const Value.absent(),
    DateTime? soldAt,
    Value<DateTime?> receivedAt = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Sale(
    uuid: uuid ?? this.uuid,
    businessUuid: businessUuid.present ? businessUuid.value : this.businessUuid,
    checkoutGroupUuid: checkoutGroupUuid.present
        ? checkoutGroupUuid.value
        : this.checkoutGroupUuid,
    outletUuid: outletUuid ?? this.outletUuid,
    transactionType: transactionType ?? this.transactionType,
    diningTableUuid: diningTableUuid.present
        ? diningTableUuid.value
        : this.diningTableUuid,
    deviceUuid: deviceUuid ?? this.deviceUuid,
    number: number.present ? number.value : this.number,
    status: status ?? this.status,
    subtotal: subtotal ?? this.subtotal,
    discountTotal: discountTotal ?? this.discountTotal,
    taxTotal: taxTotal ?? this.taxTotal,
    serviceTotal: serviceTotal ?? this.serviceTotal,
    grandTotal: grandTotal ?? this.grandTotal,
    idempotencyKey: idempotencyKey ?? this.idempotencyKey,
    syncStatus: syncStatus ?? this.syncStatus,
    syncError: syncError.present ? syncError.value : this.syncError,
    soldAt: soldAt ?? this.soldAt,
    receivedAt: receivedAt.present ? receivedAt.value : this.receivedAt,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Sale copyWithCompanion(SalesCompanion data) {
    return Sale(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      businessUuid: data.businessUuid.present
          ? data.businessUuid.value
          : this.businessUuid,
      checkoutGroupUuid: data.checkoutGroupUuid.present
          ? data.checkoutGroupUuid.value
          : this.checkoutGroupUuid,
      outletUuid: data.outletUuid.present
          ? data.outletUuid.value
          : this.outletUuid,
      transactionType: data.transactionType.present
          ? data.transactionType.value
          : this.transactionType,
      diningTableUuid: data.diningTableUuid.present
          ? data.diningTableUuid.value
          : this.diningTableUuid,
      deviceUuid: data.deviceUuid.present
          ? data.deviceUuid.value
          : this.deviceUuid,
      number: data.number.present ? data.number.value : this.number,
      status: data.status.present ? data.status.value : this.status,
      subtotal: data.subtotal.present ? data.subtotal.value : this.subtotal,
      discountTotal: data.discountTotal.present
          ? data.discountTotal.value
          : this.discountTotal,
      taxTotal: data.taxTotal.present ? data.taxTotal.value : this.taxTotal,
      serviceTotal: data.serviceTotal.present
          ? data.serviceTotal.value
          : this.serviceTotal,
      grandTotal: data.grandTotal.present
          ? data.grandTotal.value
          : this.grandTotal,
      idempotencyKey: data.idempotencyKey.present
          ? data.idempotencyKey.value
          : this.idempotencyKey,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      syncError: data.syncError.present ? data.syncError.value : this.syncError,
      soldAt: data.soldAt.present ? data.soldAt.value : this.soldAt,
      receivedAt: data.receivedAt.present
          ? data.receivedAt.value
          : this.receivedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Sale(')
          ..write('uuid: $uuid, ')
          ..write('businessUuid: $businessUuid, ')
          ..write('checkoutGroupUuid: $checkoutGroupUuid, ')
          ..write('outletUuid: $outletUuid, ')
          ..write('transactionType: $transactionType, ')
          ..write('diningTableUuid: $diningTableUuid, ')
          ..write('deviceUuid: $deviceUuid, ')
          ..write('number: $number, ')
          ..write('status: $status, ')
          ..write('subtotal: $subtotal, ')
          ..write('discountTotal: $discountTotal, ')
          ..write('taxTotal: $taxTotal, ')
          ..write('serviceTotal: $serviceTotal, ')
          ..write('grandTotal: $grandTotal, ')
          ..write('idempotencyKey: $idempotencyKey, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('syncError: $syncError, ')
          ..write('soldAt: $soldAt, ')
          ..write('receivedAt: $receivedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    uuid,
    businessUuid,
    checkoutGroupUuid,
    outletUuid,
    transactionType,
    diningTableUuid,
    deviceUuid,
    number,
    status,
    subtotal,
    discountTotal,
    taxTotal,
    serviceTotal,
    grandTotal,
    idempotencyKey,
    syncStatus,
    syncError,
    soldAt,
    receivedAt,
    createdAt,
    updatedAt,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Sale &&
          other.uuid == this.uuid &&
          other.businessUuid == this.businessUuid &&
          other.checkoutGroupUuid == this.checkoutGroupUuid &&
          other.outletUuid == this.outletUuid &&
          other.transactionType == this.transactionType &&
          other.diningTableUuid == this.diningTableUuid &&
          other.deviceUuid == this.deviceUuid &&
          other.number == this.number &&
          other.status == this.status &&
          other.subtotal == this.subtotal &&
          other.discountTotal == this.discountTotal &&
          other.taxTotal == this.taxTotal &&
          other.serviceTotal == this.serviceTotal &&
          other.grandTotal == this.grandTotal &&
          other.idempotencyKey == this.idempotencyKey &&
          other.syncStatus == this.syncStatus &&
          other.syncError == this.syncError &&
          other.soldAt == this.soldAt &&
          other.receivedAt == this.receivedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SalesCompanion extends UpdateCompanion<Sale> {
  final Value<String> uuid;
  final Value<String?> businessUuid;
  final Value<String?> checkoutGroupUuid;
  final Value<String> outletUuid;
  final Value<String> transactionType;
  final Value<String?> diningTableUuid;
  final Value<String> deviceUuid;
  final Value<String?> number;
  final Value<String> status;
  final Value<int> subtotal;
  final Value<int> discountTotal;
  final Value<int> taxTotal;
  final Value<int> serviceTotal;
  final Value<int> grandTotal;
  final Value<String> idempotencyKey;
  final Value<String> syncStatus;
  final Value<String?> syncError;
  final Value<DateTime> soldAt;
  final Value<DateTime?> receivedAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const SalesCompanion({
    this.uuid = const Value.absent(),
    this.businessUuid = const Value.absent(),
    this.checkoutGroupUuid = const Value.absent(),
    this.outletUuid = const Value.absent(),
    this.transactionType = const Value.absent(),
    this.diningTableUuid = const Value.absent(),
    this.deviceUuid = const Value.absent(),
    this.number = const Value.absent(),
    this.status = const Value.absent(),
    this.subtotal = const Value.absent(),
    this.discountTotal = const Value.absent(),
    this.taxTotal = const Value.absent(),
    this.serviceTotal = const Value.absent(),
    this.grandTotal = const Value.absent(),
    this.idempotencyKey = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.syncError = const Value.absent(),
    this.soldAt = const Value.absent(),
    this.receivedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SalesCompanion.insert({
    required String uuid,
    this.businessUuid = const Value.absent(),
    this.checkoutGroupUuid = const Value.absent(),
    required String outletUuid,
    this.transactionType = const Value.absent(),
    this.diningTableUuid = const Value.absent(),
    required String deviceUuid,
    this.number = const Value.absent(),
    this.status = const Value.absent(),
    required int subtotal,
    this.discountTotal = const Value.absent(),
    this.taxTotal = const Value.absent(),
    this.serviceTotal = const Value.absent(),
    required int grandTotal,
    required String idempotencyKey,
    this.syncStatus = const Value.absent(),
    this.syncError = const Value.absent(),
    required DateTime soldAt,
    this.receivedAt = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : uuid = Value(uuid),
       outletUuid = Value(outletUuid),
       deviceUuid = Value(deviceUuid),
       subtotal = Value(subtotal),
       grandTotal = Value(grandTotal),
       idempotencyKey = Value(idempotencyKey),
       soldAt = Value(soldAt),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Sale> custom({
    Expression<String>? uuid,
    Expression<String>? businessUuid,
    Expression<String>? checkoutGroupUuid,
    Expression<String>? outletUuid,
    Expression<String>? transactionType,
    Expression<String>? diningTableUuid,
    Expression<String>? deviceUuid,
    Expression<String>? number,
    Expression<String>? status,
    Expression<int>? subtotal,
    Expression<int>? discountTotal,
    Expression<int>? taxTotal,
    Expression<int>? serviceTotal,
    Expression<int>? grandTotal,
    Expression<String>? idempotencyKey,
    Expression<String>? syncStatus,
    Expression<String>? syncError,
    Expression<DateTime>? soldAt,
    Expression<DateTime>? receivedAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (businessUuid != null) 'business_uuid': businessUuid,
      if (checkoutGroupUuid != null) 'checkout_group_uuid': checkoutGroupUuid,
      if (outletUuid != null) 'outlet_uuid': outletUuid,
      if (transactionType != null) 'transaction_type': transactionType,
      if (diningTableUuid != null) 'dining_table_uuid': diningTableUuid,
      if (deviceUuid != null) 'device_uuid': deviceUuid,
      if (number != null) 'number': number,
      if (status != null) 'status': status,
      if (subtotal != null) 'subtotal': subtotal,
      if (discountTotal != null) 'discount_total': discountTotal,
      if (taxTotal != null) 'tax_total': taxTotal,
      if (serviceTotal != null) 'service_total': serviceTotal,
      if (grandTotal != null) 'grand_total': grandTotal,
      if (idempotencyKey != null) 'idempotency_key': idempotencyKey,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (syncError != null) 'sync_error': syncError,
      if (soldAt != null) 'sold_at': soldAt,
      if (receivedAt != null) 'received_at': receivedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SalesCompanion copyWith({
    Value<String>? uuid,
    Value<String?>? businessUuid,
    Value<String?>? checkoutGroupUuid,
    Value<String>? outletUuid,
    Value<String>? transactionType,
    Value<String?>? diningTableUuid,
    Value<String>? deviceUuid,
    Value<String?>? number,
    Value<String>? status,
    Value<int>? subtotal,
    Value<int>? discountTotal,
    Value<int>? taxTotal,
    Value<int>? serviceTotal,
    Value<int>? grandTotal,
    Value<String>? idempotencyKey,
    Value<String>? syncStatus,
    Value<String?>? syncError,
    Value<DateTime>? soldAt,
    Value<DateTime?>? receivedAt,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return SalesCompanion(
      uuid: uuid ?? this.uuid,
      businessUuid: businessUuid ?? this.businessUuid,
      checkoutGroupUuid: checkoutGroupUuid ?? this.checkoutGroupUuid,
      outletUuid: outletUuid ?? this.outletUuid,
      transactionType: transactionType ?? this.transactionType,
      diningTableUuid: diningTableUuid ?? this.diningTableUuid,
      deviceUuid: deviceUuid ?? this.deviceUuid,
      number: number ?? this.number,
      status: status ?? this.status,
      subtotal: subtotal ?? this.subtotal,
      discountTotal: discountTotal ?? this.discountTotal,
      taxTotal: taxTotal ?? this.taxTotal,
      serviceTotal: serviceTotal ?? this.serviceTotal,
      grandTotal: grandTotal ?? this.grandTotal,
      idempotencyKey: idempotencyKey ?? this.idempotencyKey,
      syncStatus: syncStatus ?? this.syncStatus,
      syncError: syncError ?? this.syncError,
      soldAt: soldAt ?? this.soldAt,
      receivedAt: receivedAt ?? this.receivedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (businessUuid.present) {
      map['business_uuid'] = Variable<String>(businessUuid.value);
    }
    if (checkoutGroupUuid.present) {
      map['checkout_group_uuid'] = Variable<String>(checkoutGroupUuid.value);
    }
    if (outletUuid.present) {
      map['outlet_uuid'] = Variable<String>(outletUuid.value);
    }
    if (transactionType.present) {
      map['transaction_type'] = Variable<String>(transactionType.value);
    }
    if (diningTableUuid.present) {
      map['dining_table_uuid'] = Variable<String>(diningTableUuid.value);
    }
    if (deviceUuid.present) {
      map['device_uuid'] = Variable<String>(deviceUuid.value);
    }
    if (number.present) {
      map['number'] = Variable<String>(number.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (subtotal.present) {
      map['subtotal'] = Variable<int>(subtotal.value);
    }
    if (discountTotal.present) {
      map['discount_total'] = Variable<int>(discountTotal.value);
    }
    if (taxTotal.present) {
      map['tax_total'] = Variable<int>(taxTotal.value);
    }
    if (serviceTotal.present) {
      map['service_total'] = Variable<int>(serviceTotal.value);
    }
    if (grandTotal.present) {
      map['grand_total'] = Variable<int>(grandTotal.value);
    }
    if (idempotencyKey.present) {
      map['idempotency_key'] = Variable<String>(idempotencyKey.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (syncError.present) {
      map['sync_error'] = Variable<String>(syncError.value);
    }
    if (soldAt.present) {
      map['sold_at'] = Variable<DateTime>(soldAt.value);
    }
    if (receivedAt.present) {
      map['received_at'] = Variable<DateTime>(receivedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SalesCompanion(')
          ..write('uuid: $uuid, ')
          ..write('businessUuid: $businessUuid, ')
          ..write('checkoutGroupUuid: $checkoutGroupUuid, ')
          ..write('outletUuid: $outletUuid, ')
          ..write('transactionType: $transactionType, ')
          ..write('diningTableUuid: $diningTableUuid, ')
          ..write('deviceUuid: $deviceUuid, ')
          ..write('number: $number, ')
          ..write('status: $status, ')
          ..write('subtotal: $subtotal, ')
          ..write('discountTotal: $discountTotal, ')
          ..write('taxTotal: $taxTotal, ')
          ..write('serviceTotal: $serviceTotal, ')
          ..write('grandTotal: $grandTotal, ')
          ..write('idempotencyKey: $idempotencyKey, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('syncError: $syncError, ')
          ..write('soldAt: $soldAt, ')
          ..write('receivedAt: $receivedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SaleItemsTable extends SaleItems
    with TableInfo<$SaleItemsTable, SaleItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SaleItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _saleUuidMeta = const VerificationMeta(
    'saleUuid',
  );
  @override
  late final GeneratedColumn<String> saleUuid = GeneratedColumn<String>(
    'sale_uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _menuItemUuidMeta = const VerificationMeta(
    'menuItemUuid',
  );
  @override
  late final GeneratedColumn<String> menuItemUuid = GeneratedColumn<String>(
    'menu_item_uuid',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitPriceMeta = const VerificationMeta(
    'unitPrice',
  );
  @override
  late final GeneratedColumn<int> unitPrice = GeneratedColumn<int>(
    'unit_price',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _discountTotalMeta = const VerificationMeta(
    'discountTotal',
  );
  @override
  late final GeneratedColumn<int> discountTotal = GeneratedColumn<int>(
    'discount_total',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lineTotalMeta = const VerificationMeta(
    'lineTotal',
  );
  @override
  late final GeneratedColumn<int> lineTotal = GeneratedColumn<int>(
    'line_total',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    uuid,
    saleUuid,
    menuItemUuid,
    name,
    quantity,
    unitPrice,
    discountTotal,
    lineTotal,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sale_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<SaleItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('sale_uuid')) {
      context.handle(
        _saleUuidMeta,
        saleUuid.isAcceptableOrUnknown(data['sale_uuid']!, _saleUuidMeta),
      );
    } else if (isInserting) {
      context.missing(_saleUuidMeta);
    }
    if (data.containsKey('menu_item_uuid')) {
      context.handle(
        _menuItemUuidMeta,
        menuItemUuid.isAcceptableOrUnknown(
          data['menu_item_uuid']!,
          _menuItemUuidMeta,
        ),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('unit_price')) {
      context.handle(
        _unitPriceMeta,
        unitPrice.isAcceptableOrUnknown(data['unit_price']!, _unitPriceMeta),
      );
    } else if (isInserting) {
      context.missing(_unitPriceMeta);
    }
    if (data.containsKey('discount_total')) {
      context.handle(
        _discountTotalMeta,
        discountTotal.isAcceptableOrUnknown(
          data['discount_total']!,
          _discountTotalMeta,
        ),
      );
    }
    if (data.containsKey('line_total')) {
      context.handle(
        _lineTotalMeta,
        lineTotal.isAcceptableOrUnknown(data['line_total']!, _lineTotalMeta),
      );
    } else if (isInserting) {
      context.missing(_lineTotalMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  SaleItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SaleItem(
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      saleUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sale_uuid'],
      )!,
      menuItemUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}menu_item_uuid'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity'],
      )!,
      unitPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unit_price'],
      )!,
      discountTotal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}discount_total'],
      )!,
      lineTotal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}line_total'],
      )!,
    );
  }

  @override
  $SaleItemsTable createAlias(String alias) {
    return $SaleItemsTable(attachedDatabase, alias);
  }
}

class SaleItem extends DataClass implements Insertable<SaleItem> {
  final String uuid;
  final String saleUuid;
  final String? menuItemUuid;
  final String name;
  final int quantity;
  final int unitPrice;
  final int discountTotal;
  final int lineTotal;
  const SaleItem({
    required this.uuid,
    required this.saleUuid,
    this.menuItemUuid,
    required this.name,
    required this.quantity,
    required this.unitPrice,
    required this.discountTotal,
    required this.lineTotal,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['sale_uuid'] = Variable<String>(saleUuid);
    if (!nullToAbsent || menuItemUuid != null) {
      map['menu_item_uuid'] = Variable<String>(menuItemUuid);
    }
    map['name'] = Variable<String>(name);
    map['quantity'] = Variable<int>(quantity);
    map['unit_price'] = Variable<int>(unitPrice);
    map['discount_total'] = Variable<int>(discountTotal);
    map['line_total'] = Variable<int>(lineTotal);
    return map;
  }

  SaleItemsCompanion toCompanion(bool nullToAbsent) {
    return SaleItemsCompanion(
      uuid: Value(uuid),
      saleUuid: Value(saleUuid),
      menuItemUuid: menuItemUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(menuItemUuid),
      name: Value(name),
      quantity: Value(quantity),
      unitPrice: Value(unitPrice),
      discountTotal: Value(discountTotal),
      lineTotal: Value(lineTotal),
    );
  }

  factory SaleItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SaleItem(
      uuid: serializer.fromJson<String>(json['uuid']),
      saleUuid: serializer.fromJson<String>(json['saleUuid']),
      menuItemUuid: serializer.fromJson<String?>(json['menuItemUuid']),
      name: serializer.fromJson<String>(json['name']),
      quantity: serializer.fromJson<int>(json['quantity']),
      unitPrice: serializer.fromJson<int>(json['unitPrice']),
      discountTotal: serializer.fromJson<int>(json['discountTotal']),
      lineTotal: serializer.fromJson<int>(json['lineTotal']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'saleUuid': serializer.toJson<String>(saleUuid),
      'menuItemUuid': serializer.toJson<String?>(menuItemUuid),
      'name': serializer.toJson<String>(name),
      'quantity': serializer.toJson<int>(quantity),
      'unitPrice': serializer.toJson<int>(unitPrice),
      'discountTotal': serializer.toJson<int>(discountTotal),
      'lineTotal': serializer.toJson<int>(lineTotal),
    };
  }

  SaleItem copyWith({
    String? uuid,
    String? saleUuid,
    Value<String?> menuItemUuid = const Value.absent(),
    String? name,
    int? quantity,
    int? unitPrice,
    int? discountTotal,
    int? lineTotal,
  }) => SaleItem(
    uuid: uuid ?? this.uuid,
    saleUuid: saleUuid ?? this.saleUuid,
    menuItemUuid: menuItemUuid.present ? menuItemUuid.value : this.menuItemUuid,
    name: name ?? this.name,
    quantity: quantity ?? this.quantity,
    unitPrice: unitPrice ?? this.unitPrice,
    discountTotal: discountTotal ?? this.discountTotal,
    lineTotal: lineTotal ?? this.lineTotal,
  );
  SaleItem copyWithCompanion(SaleItemsCompanion data) {
    return SaleItem(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      saleUuid: data.saleUuid.present ? data.saleUuid.value : this.saleUuid,
      menuItemUuid: data.menuItemUuid.present
          ? data.menuItemUuid.value
          : this.menuItemUuid,
      name: data.name.present ? data.name.value : this.name,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      unitPrice: data.unitPrice.present ? data.unitPrice.value : this.unitPrice,
      discountTotal: data.discountTotal.present
          ? data.discountTotal.value
          : this.discountTotal,
      lineTotal: data.lineTotal.present ? data.lineTotal.value : this.lineTotal,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SaleItem(')
          ..write('uuid: $uuid, ')
          ..write('saleUuid: $saleUuid, ')
          ..write('menuItemUuid: $menuItemUuid, ')
          ..write('name: $name, ')
          ..write('quantity: $quantity, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('discountTotal: $discountTotal, ')
          ..write('lineTotal: $lineTotal')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uuid,
    saleUuid,
    menuItemUuid,
    name,
    quantity,
    unitPrice,
    discountTotal,
    lineTotal,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SaleItem &&
          other.uuid == this.uuid &&
          other.saleUuid == this.saleUuid &&
          other.menuItemUuid == this.menuItemUuid &&
          other.name == this.name &&
          other.quantity == this.quantity &&
          other.unitPrice == this.unitPrice &&
          other.discountTotal == this.discountTotal &&
          other.lineTotal == this.lineTotal);
}

class SaleItemsCompanion extends UpdateCompanion<SaleItem> {
  final Value<String> uuid;
  final Value<String> saleUuid;
  final Value<String?> menuItemUuid;
  final Value<String> name;
  final Value<int> quantity;
  final Value<int> unitPrice;
  final Value<int> discountTotal;
  final Value<int> lineTotal;
  final Value<int> rowid;
  const SaleItemsCompanion({
    this.uuid = const Value.absent(),
    this.saleUuid = const Value.absent(),
    this.menuItemUuid = const Value.absent(),
    this.name = const Value.absent(),
    this.quantity = const Value.absent(),
    this.unitPrice = const Value.absent(),
    this.discountTotal = const Value.absent(),
    this.lineTotal = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SaleItemsCompanion.insert({
    required String uuid,
    required String saleUuid,
    this.menuItemUuid = const Value.absent(),
    required String name,
    required int quantity,
    required int unitPrice,
    this.discountTotal = const Value.absent(),
    required int lineTotal,
    this.rowid = const Value.absent(),
  }) : uuid = Value(uuid),
       saleUuid = Value(saleUuid),
       name = Value(name),
       quantity = Value(quantity),
       unitPrice = Value(unitPrice),
       lineTotal = Value(lineTotal);
  static Insertable<SaleItem> custom({
    Expression<String>? uuid,
    Expression<String>? saleUuid,
    Expression<String>? menuItemUuid,
    Expression<String>? name,
    Expression<int>? quantity,
    Expression<int>? unitPrice,
    Expression<int>? discountTotal,
    Expression<int>? lineTotal,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (saleUuid != null) 'sale_uuid': saleUuid,
      if (menuItemUuid != null) 'menu_item_uuid': menuItemUuid,
      if (name != null) 'name': name,
      if (quantity != null) 'quantity': quantity,
      if (unitPrice != null) 'unit_price': unitPrice,
      if (discountTotal != null) 'discount_total': discountTotal,
      if (lineTotal != null) 'line_total': lineTotal,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SaleItemsCompanion copyWith({
    Value<String>? uuid,
    Value<String>? saleUuid,
    Value<String?>? menuItemUuid,
    Value<String>? name,
    Value<int>? quantity,
    Value<int>? unitPrice,
    Value<int>? discountTotal,
    Value<int>? lineTotal,
    Value<int>? rowid,
  }) {
    return SaleItemsCompanion(
      uuid: uuid ?? this.uuid,
      saleUuid: saleUuid ?? this.saleUuid,
      menuItemUuid: menuItemUuid ?? this.menuItemUuid,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      discountTotal: discountTotal ?? this.discountTotal,
      lineTotal: lineTotal ?? this.lineTotal,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (saleUuid.present) {
      map['sale_uuid'] = Variable<String>(saleUuid.value);
    }
    if (menuItemUuid.present) {
      map['menu_item_uuid'] = Variable<String>(menuItemUuid.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (unitPrice.present) {
      map['unit_price'] = Variable<int>(unitPrice.value);
    }
    if (discountTotal.present) {
      map['discount_total'] = Variable<int>(discountTotal.value);
    }
    if (lineTotal.present) {
      map['line_total'] = Variable<int>(lineTotal.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SaleItemsCompanion(')
          ..write('uuid: $uuid, ')
          ..write('saleUuid: $saleUuid, ')
          ..write('menuItemUuid: $menuItemUuid, ')
          ..write('name: $name, ')
          ..write('quantity: $quantity, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('discountTotal: $discountTotal, ')
          ..write('lineTotal: $lineTotal, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncQueueEntriesTable extends SyncQueueEntries
    with TableInfo<$SyncQueueEntriesTable, SyncQueueEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncQueueEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _entityTypeMeta = const VerificationMeta(
    'entityType',
  );
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityUuidMeta = const VerificationMeta(
    'entityUuid',
  );
  @override
  late final GeneratedColumn<String> entityUuid = GeneratedColumn<String>(
    'entity_uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idempotencyKeyMeta = const VerificationMeta(
    'idempotencyKey',
  );
  @override
  late final GeneratedColumn<String> idempotencyKey = GeneratedColumn<String>(
    'idempotency_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadJsonMeta = const VerificationMeta(
    'payloadJson',
  );
  @override
  late final GeneratedColumn<String> payloadJson = GeneratedColumn<String>(
    'payload_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _retryCountMeta = const VerificationMeta(
    'retryCount',
  );
  @override
  late final GeneratedColumn<int> retryCount = GeneratedColumn<int>(
    'retry_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastErrorMeta = const VerificationMeta(
    'lastError',
  );
  @override
  late final GeneratedColumn<String> lastError = GeneratedColumn<String>(
    'last_error',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    entityType,
    entityUuid,
    idempotencyKey,
    payloadJson,
    status,
    retryCount,
    lastError,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_queue_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncQueueEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('entity_type')) {
      context.handle(
        _entityTypeMeta,
        entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('entity_uuid')) {
      context.handle(
        _entityUuidMeta,
        entityUuid.isAcceptableOrUnknown(data['entity_uuid']!, _entityUuidMeta),
      );
    } else if (isInserting) {
      context.missing(_entityUuidMeta);
    }
    if (data.containsKey('idempotency_key')) {
      context.handle(
        _idempotencyKeyMeta,
        idempotencyKey.isAcceptableOrUnknown(
          data['idempotency_key']!,
          _idempotencyKeyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_idempotencyKeyMeta);
    }
    if (data.containsKey('payload_json')) {
      context.handle(
        _payloadJsonMeta,
        payloadJson.isAcceptableOrUnknown(
          data['payload_json']!,
          _payloadJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_payloadJsonMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('retry_count')) {
      context.handle(
        _retryCountMeta,
        retryCount.isAcceptableOrUnknown(data['retry_count']!, _retryCountMeta),
      );
    }
    if (data.containsKey('last_error')) {
      context.handle(
        _lastErrorMeta,
        lastError.isAcceptableOrUnknown(data['last_error']!, _lastErrorMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncQueueEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncQueueEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      entityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_type'],
      )!,
      entityUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_uuid'],
      )!,
      idempotencyKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}idempotency_key'],
      )!,
      payloadJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload_json'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      retryCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}retry_count'],
      )!,
      lastError: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_error'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $SyncQueueEntriesTable createAlias(String alias) {
    return $SyncQueueEntriesTable(attachedDatabase, alias);
  }
}

class SyncQueueEntry extends DataClass implements Insertable<SyncQueueEntry> {
  final int id;
  final String entityType;
  final String entityUuid;
  final String idempotencyKey;
  final String payloadJson;
  final String status;
  final int retryCount;
  final String? lastError;
  final DateTime createdAt;
  final DateTime updatedAt;
  const SyncQueueEntry({
    required this.id,
    required this.entityType,
    required this.entityUuid,
    required this.idempotencyKey,
    required this.payloadJson,
    required this.status,
    required this.retryCount,
    this.lastError,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['entity_type'] = Variable<String>(entityType);
    map['entity_uuid'] = Variable<String>(entityUuid);
    map['idempotency_key'] = Variable<String>(idempotencyKey);
    map['payload_json'] = Variable<String>(payloadJson);
    map['status'] = Variable<String>(status);
    map['retry_count'] = Variable<int>(retryCount);
    if (!nullToAbsent || lastError != null) {
      map['last_error'] = Variable<String>(lastError);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SyncQueueEntriesCompanion toCompanion(bool nullToAbsent) {
    return SyncQueueEntriesCompanion(
      id: Value(id),
      entityType: Value(entityType),
      entityUuid: Value(entityUuid),
      idempotencyKey: Value(idempotencyKey),
      payloadJson: Value(payloadJson),
      status: Value(status),
      retryCount: Value(retryCount),
      lastError: lastError == null && nullToAbsent
          ? const Value.absent()
          : Value(lastError),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory SyncQueueEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncQueueEntry(
      id: serializer.fromJson<int>(json['id']),
      entityType: serializer.fromJson<String>(json['entityType']),
      entityUuid: serializer.fromJson<String>(json['entityUuid']),
      idempotencyKey: serializer.fromJson<String>(json['idempotencyKey']),
      payloadJson: serializer.fromJson<String>(json['payloadJson']),
      status: serializer.fromJson<String>(json['status']),
      retryCount: serializer.fromJson<int>(json['retryCount']),
      lastError: serializer.fromJson<String?>(json['lastError']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'entityType': serializer.toJson<String>(entityType),
      'entityUuid': serializer.toJson<String>(entityUuid),
      'idempotencyKey': serializer.toJson<String>(idempotencyKey),
      'payloadJson': serializer.toJson<String>(payloadJson),
      'status': serializer.toJson<String>(status),
      'retryCount': serializer.toJson<int>(retryCount),
      'lastError': serializer.toJson<String?>(lastError),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  SyncQueueEntry copyWith({
    int? id,
    String? entityType,
    String? entityUuid,
    String? idempotencyKey,
    String? payloadJson,
    String? status,
    int? retryCount,
    Value<String?> lastError = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => SyncQueueEntry(
    id: id ?? this.id,
    entityType: entityType ?? this.entityType,
    entityUuid: entityUuid ?? this.entityUuid,
    idempotencyKey: idempotencyKey ?? this.idempotencyKey,
    payloadJson: payloadJson ?? this.payloadJson,
    status: status ?? this.status,
    retryCount: retryCount ?? this.retryCount,
    lastError: lastError.present ? lastError.value : this.lastError,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  SyncQueueEntry copyWithCompanion(SyncQueueEntriesCompanion data) {
    return SyncQueueEntry(
      id: data.id.present ? data.id.value : this.id,
      entityType: data.entityType.present
          ? data.entityType.value
          : this.entityType,
      entityUuid: data.entityUuid.present
          ? data.entityUuid.value
          : this.entityUuid,
      idempotencyKey: data.idempotencyKey.present
          ? data.idempotencyKey.value
          : this.idempotencyKey,
      payloadJson: data.payloadJson.present
          ? data.payloadJson.value
          : this.payloadJson,
      status: data.status.present ? data.status.value : this.status,
      retryCount: data.retryCount.present
          ? data.retryCount.value
          : this.retryCount,
      lastError: data.lastError.present ? data.lastError.value : this.lastError,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueEntry(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('entityUuid: $entityUuid, ')
          ..write('idempotencyKey: $idempotencyKey, ')
          ..write('payloadJson: $payloadJson, ')
          ..write('status: $status, ')
          ..write('retryCount: $retryCount, ')
          ..write('lastError: $lastError, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    entityType,
    entityUuid,
    idempotencyKey,
    payloadJson,
    status,
    retryCount,
    lastError,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncQueueEntry &&
          other.id == this.id &&
          other.entityType == this.entityType &&
          other.entityUuid == this.entityUuid &&
          other.idempotencyKey == this.idempotencyKey &&
          other.payloadJson == this.payloadJson &&
          other.status == this.status &&
          other.retryCount == this.retryCount &&
          other.lastError == this.lastError &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SyncQueueEntriesCompanion extends UpdateCompanion<SyncQueueEntry> {
  final Value<int> id;
  final Value<String> entityType;
  final Value<String> entityUuid;
  final Value<String> idempotencyKey;
  final Value<String> payloadJson;
  final Value<String> status;
  final Value<int> retryCount;
  final Value<String?> lastError;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const SyncQueueEntriesCompanion({
    this.id = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityUuid = const Value.absent(),
    this.idempotencyKey = const Value.absent(),
    this.payloadJson = const Value.absent(),
    this.status = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.lastError = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  SyncQueueEntriesCompanion.insert({
    this.id = const Value.absent(),
    required String entityType,
    required String entityUuid,
    required String idempotencyKey,
    required String payloadJson,
    this.status = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.lastError = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : entityType = Value(entityType),
       entityUuid = Value(entityUuid),
       idempotencyKey = Value(idempotencyKey),
       payloadJson = Value(payloadJson),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<SyncQueueEntry> custom({
    Expression<int>? id,
    Expression<String>? entityType,
    Expression<String>? entityUuid,
    Expression<String>? idempotencyKey,
    Expression<String>? payloadJson,
    Expression<String>? status,
    Expression<int>? retryCount,
    Expression<String>? lastError,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entityType != null) 'entity_type': entityType,
      if (entityUuid != null) 'entity_uuid': entityUuid,
      if (idempotencyKey != null) 'idempotency_key': idempotencyKey,
      if (payloadJson != null) 'payload_json': payloadJson,
      if (status != null) 'status': status,
      if (retryCount != null) 'retry_count': retryCount,
      if (lastError != null) 'last_error': lastError,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  SyncQueueEntriesCompanion copyWith({
    Value<int>? id,
    Value<String>? entityType,
    Value<String>? entityUuid,
    Value<String>? idempotencyKey,
    Value<String>? payloadJson,
    Value<String>? status,
    Value<int>? retryCount,
    Value<String?>? lastError,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return SyncQueueEntriesCompanion(
      id: id ?? this.id,
      entityType: entityType ?? this.entityType,
      entityUuid: entityUuid ?? this.entityUuid,
      idempotencyKey: idempotencyKey ?? this.idempotencyKey,
      payloadJson: payloadJson ?? this.payloadJson,
      status: status ?? this.status,
      retryCount: retryCount ?? this.retryCount,
      lastError: lastError ?? this.lastError,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityUuid.present) {
      map['entity_uuid'] = Variable<String>(entityUuid.value);
    }
    if (idempotencyKey.present) {
      map['idempotency_key'] = Variable<String>(idempotencyKey.value);
    }
    if (payloadJson.present) {
      map['payload_json'] = Variable<String>(payloadJson.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (retryCount.present) {
      map['retry_count'] = Variable<int>(retryCount.value);
    }
    if (lastError.present) {
      map['last_error'] = Variable<String>(lastError.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueEntriesCompanion(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('entityUuid: $entityUuid, ')
          ..write('idempotencyKey: $idempotencyKey, ')
          ..write('payloadJson: $payloadJson, ')
          ..write('status: $status, ')
          ..write('retryCount: $retryCount, ')
          ..write('lastError: $lastError, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $LocalUsersTable localUsers = $LocalUsersTable(this);
  late final $BusinessesTable businesses = $BusinessesTable(this);
  late final $LocalDevicesTable localDevices = $LocalDevicesTable(this);
  late final $AuthSessionsTable authSessions = $AuthSessionsTable(this);
  late final $OutletsTable outlets = $OutletsTable(this);
  late final $MenuCategoriesTable menuCategories = $MenuCategoriesTable(this);
  late final $MenuItemsTable menuItems = $MenuItemsTable(this);
  late final $PaymentMethodsTable paymentMethods = $PaymentMethodsTable(this);
  late final $DiningTablesTable diningTables = $DiningTablesTable(this);
  late final $SalesTable sales = $SalesTable(this);
  late final $SaleItemsTable saleItems = $SaleItemsTable(this);
  late final $SyncQueueEntriesTable syncQueueEntries = $SyncQueueEntriesTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    localUsers,
    businesses,
    localDevices,
    authSessions,
    outlets,
    menuCategories,
    menuItems,
    paymentMethods,
    diningTables,
    sales,
    saleItems,
    syncQueueEntries,
  ];
}

typedef $$LocalUsersTableCreateCompanionBuilder =
    LocalUsersCompanion Function({
      required String uuid,
      Value<String?> businessUuid,
      required String name,
      required String email,
      required String role,
      Value<int> rowid,
    });
typedef $$LocalUsersTableUpdateCompanionBuilder =
    LocalUsersCompanion Function({
      Value<String> uuid,
      Value<String?> businessUuid,
      Value<String> name,
      Value<String> email,
      Value<String> role,
      Value<int> rowid,
    });

class $$LocalUsersTableFilterComposer
    extends Composer<_$AppDatabase, $LocalUsersTable> {
  $$LocalUsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get businessUuid => $composableBuilder(
    column: $table.businessUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LocalUsersTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalUsersTable> {
  $$LocalUsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get businessUuid => $composableBuilder(
    column: $table.businessUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocalUsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalUsersTable> {
  $$LocalUsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<String> get businessUuid => $composableBuilder(
    column: $table.businessUuid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);
}

class $$LocalUsersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LocalUsersTable,
          LocalUser,
          $$LocalUsersTableFilterComposer,
          $$LocalUsersTableOrderingComposer,
          $$LocalUsersTableAnnotationComposer,
          $$LocalUsersTableCreateCompanionBuilder,
          $$LocalUsersTableUpdateCompanionBuilder,
          (
            LocalUser,
            BaseReferences<_$AppDatabase, $LocalUsersTable, LocalUser>,
          ),
          LocalUser,
          PrefetchHooks Function()
        > {
  $$LocalUsersTableTableManager(_$AppDatabase db, $LocalUsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalUsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalUsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalUsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> uuid = const Value.absent(),
                Value<String?> businessUuid = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String> role = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocalUsersCompanion(
                uuid: uuid,
                businessUuid: businessUuid,
                name: name,
                email: email,
                role: role,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String uuid,
                Value<String?> businessUuid = const Value.absent(),
                required String name,
                required String email,
                required String role,
                Value<int> rowid = const Value.absent(),
              }) => LocalUsersCompanion.insert(
                uuid: uuid,
                businessUuid: businessUuid,
                name: name,
                email: email,
                role: role,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LocalUsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LocalUsersTable,
      LocalUser,
      $$LocalUsersTableFilterComposer,
      $$LocalUsersTableOrderingComposer,
      $$LocalUsersTableAnnotationComposer,
      $$LocalUsersTableCreateCompanionBuilder,
      $$LocalUsersTableUpdateCompanionBuilder,
      (LocalUser, BaseReferences<_$AppDatabase, $LocalUsersTable, LocalUser>),
      LocalUser,
      PrefetchHooks Function()
    >;
typedef $$BusinessesTableCreateCompanionBuilder =
    BusinessesCompanion Function({
      required String uuid,
      required String name,
      Value<String> timezone,
      Value<int> rowid,
    });
typedef $$BusinessesTableUpdateCompanionBuilder =
    BusinessesCompanion Function({
      Value<String> uuid,
      Value<String> name,
      Value<String> timezone,
      Value<int> rowid,
    });

class $$BusinessesTableFilterComposer
    extends Composer<_$AppDatabase, $BusinessesTable> {
  $$BusinessesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get timezone => $composableBuilder(
    column: $table.timezone,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BusinessesTableOrderingComposer
    extends Composer<_$AppDatabase, $BusinessesTable> {
  $$BusinessesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get timezone => $composableBuilder(
    column: $table.timezone,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BusinessesTableAnnotationComposer
    extends Composer<_$AppDatabase, $BusinessesTable> {
  $$BusinessesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get timezone =>
      $composableBuilder(column: $table.timezone, builder: (column) => column);
}

class $$BusinessesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BusinessesTable,
          BusinessesData,
          $$BusinessesTableFilterComposer,
          $$BusinessesTableOrderingComposer,
          $$BusinessesTableAnnotationComposer,
          $$BusinessesTableCreateCompanionBuilder,
          $$BusinessesTableUpdateCompanionBuilder,
          (
            BusinessesData,
            BaseReferences<_$AppDatabase, $BusinessesTable, BusinessesData>,
          ),
          BusinessesData,
          PrefetchHooks Function()
        > {
  $$BusinessesTableTableManager(_$AppDatabase db, $BusinessesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BusinessesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BusinessesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BusinessesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> uuid = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> timezone = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BusinessesCompanion(
                uuid: uuid,
                name: name,
                timezone: timezone,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String uuid,
                required String name,
                Value<String> timezone = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BusinessesCompanion.insert(
                uuid: uuid,
                name: name,
                timezone: timezone,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BusinessesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BusinessesTable,
      BusinessesData,
      $$BusinessesTableFilterComposer,
      $$BusinessesTableOrderingComposer,
      $$BusinessesTableAnnotationComposer,
      $$BusinessesTableCreateCompanionBuilder,
      $$BusinessesTableUpdateCompanionBuilder,
      (
        BusinessesData,
        BaseReferences<_$AppDatabase, $BusinessesTable, BusinessesData>,
      ),
      BusinessesData,
      PrefetchHooks Function()
    >;
typedef $$LocalDevicesTableCreateCompanionBuilder =
    LocalDevicesCompanion Function({
      required String uuid,
      required String name,
      Value<String?> platform,
      Value<String?> appVersion,
      Value<DateTime?> lastSeenAt,
      Value<int> rowid,
    });
typedef $$LocalDevicesTableUpdateCompanionBuilder =
    LocalDevicesCompanion Function({
      Value<String> uuid,
      Value<String> name,
      Value<String?> platform,
      Value<String?> appVersion,
      Value<DateTime?> lastSeenAt,
      Value<int> rowid,
    });

class $$LocalDevicesTableFilterComposer
    extends Composer<_$AppDatabase, $LocalDevicesTable> {
  $$LocalDevicesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get platform => $composableBuilder(
    column: $table.platform,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get appVersion => $composableBuilder(
    column: $table.appVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastSeenAt => $composableBuilder(
    column: $table.lastSeenAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LocalDevicesTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalDevicesTable> {
  $$LocalDevicesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get platform => $composableBuilder(
    column: $table.platform,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get appVersion => $composableBuilder(
    column: $table.appVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastSeenAt => $composableBuilder(
    column: $table.lastSeenAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocalDevicesTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalDevicesTable> {
  $$LocalDevicesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get platform =>
      $composableBuilder(column: $table.platform, builder: (column) => column);

  GeneratedColumn<String> get appVersion => $composableBuilder(
    column: $table.appVersion,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastSeenAt => $composableBuilder(
    column: $table.lastSeenAt,
    builder: (column) => column,
  );
}

class $$LocalDevicesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LocalDevicesTable,
          LocalDevice,
          $$LocalDevicesTableFilterComposer,
          $$LocalDevicesTableOrderingComposer,
          $$LocalDevicesTableAnnotationComposer,
          $$LocalDevicesTableCreateCompanionBuilder,
          $$LocalDevicesTableUpdateCompanionBuilder,
          (
            LocalDevice,
            BaseReferences<_$AppDatabase, $LocalDevicesTable, LocalDevice>,
          ),
          LocalDevice,
          PrefetchHooks Function()
        > {
  $$LocalDevicesTableTableManager(_$AppDatabase db, $LocalDevicesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalDevicesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalDevicesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalDevicesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> uuid = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> platform = const Value.absent(),
                Value<String?> appVersion = const Value.absent(),
                Value<DateTime?> lastSeenAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocalDevicesCompanion(
                uuid: uuid,
                name: name,
                platform: platform,
                appVersion: appVersion,
                lastSeenAt: lastSeenAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String uuid,
                required String name,
                Value<String?> platform = const Value.absent(),
                Value<String?> appVersion = const Value.absent(),
                Value<DateTime?> lastSeenAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocalDevicesCompanion.insert(
                uuid: uuid,
                name: name,
                platform: platform,
                appVersion: appVersion,
                lastSeenAt: lastSeenAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LocalDevicesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LocalDevicesTable,
      LocalDevice,
      $$LocalDevicesTableFilterComposer,
      $$LocalDevicesTableOrderingComposer,
      $$LocalDevicesTableAnnotationComposer,
      $$LocalDevicesTableCreateCompanionBuilder,
      $$LocalDevicesTableUpdateCompanionBuilder,
      (
        LocalDevice,
        BaseReferences<_$AppDatabase, $LocalDevicesTable, LocalDevice>,
      ),
      LocalDevice,
      PrefetchHooks Function()
    >;
typedef $$AuthSessionsTableCreateCompanionBuilder =
    AuthSessionsCompanion Function({
      Value<int> id,
      Value<String> tokenType,
      required String accessToken,
      required String userUuid,
      Value<String?> businessUuid,
      required String deviceUuid,
      required DateTime createdAt,
    });
typedef $$AuthSessionsTableUpdateCompanionBuilder =
    AuthSessionsCompanion Function({
      Value<int> id,
      Value<String> tokenType,
      Value<String> accessToken,
      Value<String> userUuid,
      Value<String?> businessUuid,
      Value<String> deviceUuid,
      Value<DateTime> createdAt,
    });

class $$AuthSessionsTableFilterComposer
    extends Composer<_$AppDatabase, $AuthSessionsTable> {
  $$AuthSessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tokenType => $composableBuilder(
    column: $table.tokenType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accessToken => $composableBuilder(
    column: $table.accessToken,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userUuid => $composableBuilder(
    column: $table.userUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get businessUuid => $composableBuilder(
    column: $table.businessUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceUuid => $composableBuilder(
    column: $table.deviceUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AuthSessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $AuthSessionsTable> {
  $$AuthSessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tokenType => $composableBuilder(
    column: $table.tokenType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accessToken => $composableBuilder(
    column: $table.accessToken,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userUuid => $composableBuilder(
    column: $table.userUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get businessUuid => $composableBuilder(
    column: $table.businessUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceUuid => $composableBuilder(
    column: $table.deviceUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AuthSessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AuthSessionsTable> {
  $$AuthSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get tokenType =>
      $composableBuilder(column: $table.tokenType, builder: (column) => column);

  GeneratedColumn<String> get accessToken => $composableBuilder(
    column: $table.accessToken,
    builder: (column) => column,
  );

  GeneratedColumn<String> get userUuid =>
      $composableBuilder(column: $table.userUuid, builder: (column) => column);

  GeneratedColumn<String> get businessUuid => $composableBuilder(
    column: $table.businessUuid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceUuid => $composableBuilder(
    column: $table.deviceUuid,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$AuthSessionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AuthSessionsTable,
          AuthSession,
          $$AuthSessionsTableFilterComposer,
          $$AuthSessionsTableOrderingComposer,
          $$AuthSessionsTableAnnotationComposer,
          $$AuthSessionsTableCreateCompanionBuilder,
          $$AuthSessionsTableUpdateCompanionBuilder,
          (
            AuthSession,
            BaseReferences<_$AppDatabase, $AuthSessionsTable, AuthSession>,
          ),
          AuthSession,
          PrefetchHooks Function()
        > {
  $$AuthSessionsTableTableManager(_$AppDatabase db, $AuthSessionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AuthSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AuthSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AuthSessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> tokenType = const Value.absent(),
                Value<String> accessToken = const Value.absent(),
                Value<String> userUuid = const Value.absent(),
                Value<String?> businessUuid = const Value.absent(),
                Value<String> deviceUuid = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => AuthSessionsCompanion(
                id: id,
                tokenType: tokenType,
                accessToken: accessToken,
                userUuid: userUuid,
                businessUuid: businessUuid,
                deviceUuid: deviceUuid,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> tokenType = const Value.absent(),
                required String accessToken,
                required String userUuid,
                Value<String?> businessUuid = const Value.absent(),
                required String deviceUuid,
                required DateTime createdAt,
              }) => AuthSessionsCompanion.insert(
                id: id,
                tokenType: tokenType,
                accessToken: accessToken,
                userUuid: userUuid,
                businessUuid: businessUuid,
                deviceUuid: deviceUuid,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AuthSessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AuthSessionsTable,
      AuthSession,
      $$AuthSessionsTableFilterComposer,
      $$AuthSessionsTableOrderingComposer,
      $$AuthSessionsTableAnnotationComposer,
      $$AuthSessionsTableCreateCompanionBuilder,
      $$AuthSessionsTableUpdateCompanionBuilder,
      (
        AuthSession,
        BaseReferences<_$AppDatabase, $AuthSessionsTable, AuthSession>,
      ),
      AuthSession,
      PrefetchHooks Function()
    >;
typedef $$OutletsTableCreateCompanionBuilder =
    OutletsCompanion Function({
      required String uuid,
      Value<String?> businessUuid,
      required String name,
      Value<String?> code,
      Value<String?> role,
      Value<bool> isSelected,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });
typedef $$OutletsTableUpdateCompanionBuilder =
    OutletsCompanion Function({
      Value<String> uuid,
      Value<String?> businessUuid,
      Value<String> name,
      Value<String?> code,
      Value<String?> role,
      Value<bool> isSelected,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });

class $$OutletsTableFilterComposer
    extends Composer<_$AppDatabase, $OutletsTable> {
  $$OutletsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get businessUuid => $composableBuilder(
    column: $table.businessUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSelected => $composableBuilder(
    column: $table.isSelected,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$OutletsTableOrderingComposer
    extends Composer<_$AppDatabase, $OutletsTable> {
  $$OutletsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get businessUuid => $composableBuilder(
    column: $table.businessUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSelected => $composableBuilder(
    column: $table.isSelected,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$OutletsTableAnnotationComposer
    extends Composer<_$AppDatabase, $OutletsTable> {
  $$OutletsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<String> get businessUuid => $composableBuilder(
    column: $table.businessUuid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<bool> get isSelected => $composableBuilder(
    column: $table.isSelected,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$OutletsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OutletsTable,
          Outlet,
          $$OutletsTableFilterComposer,
          $$OutletsTableOrderingComposer,
          $$OutletsTableAnnotationComposer,
          $$OutletsTableCreateCompanionBuilder,
          $$OutletsTableUpdateCompanionBuilder,
          (Outlet, BaseReferences<_$AppDatabase, $OutletsTable, Outlet>),
          Outlet,
          PrefetchHooks Function()
        > {
  $$OutletsTableTableManager(_$AppDatabase db, $OutletsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OutletsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OutletsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OutletsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> uuid = const Value.absent(),
                Value<String?> businessUuid = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> code = const Value.absent(),
                Value<String?> role = const Value.absent(),
                Value<bool> isSelected = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => OutletsCompanion(
                uuid: uuid,
                businessUuid: businessUuid,
                name: name,
                code: code,
                role: role,
                isSelected: isSelected,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String uuid,
                Value<String?> businessUuid = const Value.absent(),
                required String name,
                Value<String?> code = const Value.absent(),
                Value<String?> role = const Value.absent(),
                Value<bool> isSelected = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => OutletsCompanion.insert(
                uuid: uuid,
                businessUuid: businessUuid,
                name: name,
                code: code,
                role: role,
                isSelected: isSelected,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$OutletsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OutletsTable,
      Outlet,
      $$OutletsTableFilterComposer,
      $$OutletsTableOrderingComposer,
      $$OutletsTableAnnotationComposer,
      $$OutletsTableCreateCompanionBuilder,
      $$OutletsTableUpdateCompanionBuilder,
      (Outlet, BaseReferences<_$AppDatabase, $OutletsTable, Outlet>),
      Outlet,
      PrefetchHooks Function()
    >;
typedef $$MenuCategoriesTableCreateCompanionBuilder =
    MenuCategoriesCompanion Function({
      required String uuid,
      Value<String?> businessUuid,
      required String outletUuid,
      required String name,
      Value<int> sortOrder,
      Value<int> revision,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });
typedef $$MenuCategoriesTableUpdateCompanionBuilder =
    MenuCategoriesCompanion Function({
      Value<String> uuid,
      Value<String?> businessUuid,
      Value<String> outletUuid,
      Value<String> name,
      Value<int> sortOrder,
      Value<int> revision,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });

class $$MenuCategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $MenuCategoriesTable> {
  $$MenuCategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get businessUuid => $composableBuilder(
    column: $table.businessUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get outletUuid => $composableBuilder(
    column: $table.outletUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MenuCategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $MenuCategoriesTable> {
  $$MenuCategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get businessUuid => $composableBuilder(
    column: $table.businessUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get outletUuid => $composableBuilder(
    column: $table.outletUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MenuCategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MenuCategoriesTable> {
  $$MenuCategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<String> get businessUuid => $composableBuilder(
    column: $table.businessUuid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get outletUuid => $composableBuilder(
    column: $table.outletUuid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<int> get revision =>
      $composableBuilder(column: $table.revision, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$MenuCategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MenuCategoriesTable,
          MenuCategory,
          $$MenuCategoriesTableFilterComposer,
          $$MenuCategoriesTableOrderingComposer,
          $$MenuCategoriesTableAnnotationComposer,
          $$MenuCategoriesTableCreateCompanionBuilder,
          $$MenuCategoriesTableUpdateCompanionBuilder,
          (
            MenuCategory,
            BaseReferences<_$AppDatabase, $MenuCategoriesTable, MenuCategory>,
          ),
          MenuCategory,
          PrefetchHooks Function()
        > {
  $$MenuCategoriesTableTableManager(
    _$AppDatabase db,
    $MenuCategoriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MenuCategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MenuCategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MenuCategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> uuid = const Value.absent(),
                Value<String?> businessUuid = const Value.absent(),
                Value<String> outletUuid = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MenuCategoriesCompanion(
                uuid: uuid,
                businessUuid: businessUuid,
                outletUuid: outletUuid,
                name: name,
                sortOrder: sortOrder,
                revision: revision,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String uuid,
                Value<String?> businessUuid = const Value.absent(),
                required String outletUuid,
                required String name,
                Value<int> sortOrder = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MenuCategoriesCompanion.insert(
                uuid: uuid,
                businessUuid: businessUuid,
                outletUuid: outletUuid,
                name: name,
                sortOrder: sortOrder,
                revision: revision,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MenuCategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MenuCategoriesTable,
      MenuCategory,
      $$MenuCategoriesTableFilterComposer,
      $$MenuCategoriesTableOrderingComposer,
      $$MenuCategoriesTableAnnotationComposer,
      $$MenuCategoriesTableCreateCompanionBuilder,
      $$MenuCategoriesTableUpdateCompanionBuilder,
      (
        MenuCategory,
        BaseReferences<_$AppDatabase, $MenuCategoriesTable, MenuCategory>,
      ),
      MenuCategory,
      PrefetchHooks Function()
    >;
typedef $$MenuItemsTableCreateCompanionBuilder =
    MenuItemsCompanion Function({
      required String uuid,
      Value<String?> businessUuid,
      required String outletUuid,
      Value<String?> categoryUuid,
      required String name,
      Value<String?> description,
      Value<String?> sku,
      Value<String?> imageUrl,
      required int price,
      Value<bool> isRetailReady,
      Value<int> revision,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });
typedef $$MenuItemsTableUpdateCompanionBuilder =
    MenuItemsCompanion Function({
      Value<String> uuid,
      Value<String?> businessUuid,
      Value<String> outletUuid,
      Value<String?> categoryUuid,
      Value<String> name,
      Value<String?> description,
      Value<String?> sku,
      Value<String?> imageUrl,
      Value<int> price,
      Value<bool> isRetailReady,
      Value<int> revision,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });

class $$MenuItemsTableFilterComposer
    extends Composer<_$AppDatabase, $MenuItemsTable> {
  $$MenuItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get businessUuid => $composableBuilder(
    column: $table.businessUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get outletUuid => $composableBuilder(
    column: $table.outletUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categoryUuid => $composableBuilder(
    column: $table.categoryUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sku => $composableBuilder(
    column: $table.sku,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isRetailReady => $composableBuilder(
    column: $table.isRetailReady,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MenuItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $MenuItemsTable> {
  $$MenuItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get businessUuid => $composableBuilder(
    column: $table.businessUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get outletUuid => $composableBuilder(
    column: $table.outletUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categoryUuid => $composableBuilder(
    column: $table.categoryUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sku => $composableBuilder(
    column: $table.sku,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isRetailReady => $composableBuilder(
    column: $table.isRetailReady,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MenuItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MenuItemsTable> {
  $$MenuItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<String> get businessUuid => $composableBuilder(
    column: $table.businessUuid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get outletUuid => $composableBuilder(
    column: $table.outletUuid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get categoryUuid => $composableBuilder(
    column: $table.categoryUuid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sku =>
      $composableBuilder(column: $table.sku, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<int> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<bool> get isRetailReady => $composableBuilder(
    column: $table.isRetailReady,
    builder: (column) => column,
  );

  GeneratedColumn<int> get revision =>
      $composableBuilder(column: $table.revision, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$MenuItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MenuItemsTable,
          MenuItem,
          $$MenuItemsTableFilterComposer,
          $$MenuItemsTableOrderingComposer,
          $$MenuItemsTableAnnotationComposer,
          $$MenuItemsTableCreateCompanionBuilder,
          $$MenuItemsTableUpdateCompanionBuilder,
          (MenuItem, BaseReferences<_$AppDatabase, $MenuItemsTable, MenuItem>),
          MenuItem,
          PrefetchHooks Function()
        > {
  $$MenuItemsTableTableManager(_$AppDatabase db, $MenuItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MenuItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MenuItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MenuItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> uuid = const Value.absent(),
                Value<String?> businessUuid = const Value.absent(),
                Value<String> outletUuid = const Value.absent(),
                Value<String?> categoryUuid = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> sku = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<int> price = const Value.absent(),
                Value<bool> isRetailReady = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MenuItemsCompanion(
                uuid: uuid,
                businessUuid: businessUuid,
                outletUuid: outletUuid,
                categoryUuid: categoryUuid,
                name: name,
                description: description,
                sku: sku,
                imageUrl: imageUrl,
                price: price,
                isRetailReady: isRetailReady,
                revision: revision,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String uuid,
                Value<String?> businessUuid = const Value.absent(),
                required String outletUuid,
                Value<String?> categoryUuid = const Value.absent(),
                required String name,
                Value<String?> description = const Value.absent(),
                Value<String?> sku = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                required int price,
                Value<bool> isRetailReady = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MenuItemsCompanion.insert(
                uuid: uuid,
                businessUuid: businessUuid,
                outletUuid: outletUuid,
                categoryUuid: categoryUuid,
                name: name,
                description: description,
                sku: sku,
                imageUrl: imageUrl,
                price: price,
                isRetailReady: isRetailReady,
                revision: revision,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MenuItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MenuItemsTable,
      MenuItem,
      $$MenuItemsTableFilterComposer,
      $$MenuItemsTableOrderingComposer,
      $$MenuItemsTableAnnotationComposer,
      $$MenuItemsTableCreateCompanionBuilder,
      $$MenuItemsTableUpdateCompanionBuilder,
      (MenuItem, BaseReferences<_$AppDatabase, $MenuItemsTable, MenuItem>),
      MenuItem,
      PrefetchHooks Function()
    >;
typedef $$PaymentMethodsTableCreateCompanionBuilder =
    PaymentMethodsCompanion Function({
      required String uuid,
      Value<String?> businessUuid,
      required String name,
      required String code,
      Value<int> sortOrder,
      Value<int> revision,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });
typedef $$PaymentMethodsTableUpdateCompanionBuilder =
    PaymentMethodsCompanion Function({
      Value<String> uuid,
      Value<String?> businessUuid,
      Value<String> name,
      Value<String> code,
      Value<int> sortOrder,
      Value<int> revision,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });

class $$PaymentMethodsTableFilterComposer
    extends Composer<_$AppDatabase, $PaymentMethodsTable> {
  $$PaymentMethodsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get businessUuid => $composableBuilder(
    column: $table.businessUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PaymentMethodsTableOrderingComposer
    extends Composer<_$AppDatabase, $PaymentMethodsTable> {
  $$PaymentMethodsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get businessUuid => $composableBuilder(
    column: $table.businessUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PaymentMethodsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PaymentMethodsTable> {
  $$PaymentMethodsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<String> get businessUuid => $composableBuilder(
    column: $table.businessUuid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<int> get revision =>
      $composableBuilder(column: $table.revision, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$PaymentMethodsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PaymentMethodsTable,
          PaymentMethod,
          $$PaymentMethodsTableFilterComposer,
          $$PaymentMethodsTableOrderingComposer,
          $$PaymentMethodsTableAnnotationComposer,
          $$PaymentMethodsTableCreateCompanionBuilder,
          $$PaymentMethodsTableUpdateCompanionBuilder,
          (
            PaymentMethod,
            BaseReferences<_$AppDatabase, $PaymentMethodsTable, PaymentMethod>,
          ),
          PaymentMethod,
          PrefetchHooks Function()
        > {
  $$PaymentMethodsTableTableManager(
    _$AppDatabase db,
    $PaymentMethodsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PaymentMethodsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PaymentMethodsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PaymentMethodsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> uuid = const Value.absent(),
                Value<String?> businessUuid = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PaymentMethodsCompanion(
                uuid: uuid,
                businessUuid: businessUuid,
                name: name,
                code: code,
                sortOrder: sortOrder,
                revision: revision,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String uuid,
                Value<String?> businessUuid = const Value.absent(),
                required String name,
                required String code,
                Value<int> sortOrder = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PaymentMethodsCompanion.insert(
                uuid: uuid,
                businessUuid: businessUuid,
                name: name,
                code: code,
                sortOrder: sortOrder,
                revision: revision,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PaymentMethodsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PaymentMethodsTable,
      PaymentMethod,
      $$PaymentMethodsTableFilterComposer,
      $$PaymentMethodsTableOrderingComposer,
      $$PaymentMethodsTableAnnotationComposer,
      $$PaymentMethodsTableCreateCompanionBuilder,
      $$PaymentMethodsTableUpdateCompanionBuilder,
      (
        PaymentMethod,
        BaseReferences<_$AppDatabase, $PaymentMethodsTable, PaymentMethod>,
      ),
      PaymentMethod,
      PrefetchHooks Function()
    >;
typedef $$DiningTablesTableCreateCompanionBuilder =
    DiningTablesCompanion Function({
      required String uuid,
      Value<String?> businessUuid,
      required String outletUuid,
      required String name,
      Value<String?> number,
      Value<int> revision,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });
typedef $$DiningTablesTableUpdateCompanionBuilder =
    DiningTablesCompanion Function({
      Value<String> uuid,
      Value<String?> businessUuid,
      Value<String> outletUuid,
      Value<String> name,
      Value<String?> number,
      Value<int> revision,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });

class $$DiningTablesTableFilterComposer
    extends Composer<_$AppDatabase, $DiningTablesTable> {
  $$DiningTablesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get businessUuid => $composableBuilder(
    column: $table.businessUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get outletUuid => $composableBuilder(
    column: $table.outletUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DiningTablesTableOrderingComposer
    extends Composer<_$AppDatabase, $DiningTablesTable> {
  $$DiningTablesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get businessUuid => $composableBuilder(
    column: $table.businessUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get outletUuid => $composableBuilder(
    column: $table.outletUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DiningTablesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DiningTablesTable> {
  $$DiningTablesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<String> get businessUuid => $composableBuilder(
    column: $table.businessUuid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get outletUuid => $composableBuilder(
    column: $table.outletUuid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get number =>
      $composableBuilder(column: $table.number, builder: (column) => column);

  GeneratedColumn<int> get revision =>
      $composableBuilder(column: $table.revision, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$DiningTablesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DiningTablesTable,
          DiningTable,
          $$DiningTablesTableFilterComposer,
          $$DiningTablesTableOrderingComposer,
          $$DiningTablesTableAnnotationComposer,
          $$DiningTablesTableCreateCompanionBuilder,
          $$DiningTablesTableUpdateCompanionBuilder,
          (
            DiningTable,
            BaseReferences<_$AppDatabase, $DiningTablesTable, DiningTable>,
          ),
          DiningTable,
          PrefetchHooks Function()
        > {
  $$DiningTablesTableTableManager(_$AppDatabase db, $DiningTablesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DiningTablesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DiningTablesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DiningTablesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> uuid = const Value.absent(),
                Value<String?> businessUuid = const Value.absent(),
                Value<String> outletUuid = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> number = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DiningTablesCompanion(
                uuid: uuid,
                businessUuid: businessUuid,
                outletUuid: outletUuid,
                name: name,
                number: number,
                revision: revision,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String uuid,
                Value<String?> businessUuid = const Value.absent(),
                required String outletUuid,
                required String name,
                Value<String?> number = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DiningTablesCompanion.insert(
                uuid: uuid,
                businessUuid: businessUuid,
                outletUuid: outletUuid,
                name: name,
                number: number,
                revision: revision,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DiningTablesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DiningTablesTable,
      DiningTable,
      $$DiningTablesTableFilterComposer,
      $$DiningTablesTableOrderingComposer,
      $$DiningTablesTableAnnotationComposer,
      $$DiningTablesTableCreateCompanionBuilder,
      $$DiningTablesTableUpdateCompanionBuilder,
      (
        DiningTable,
        BaseReferences<_$AppDatabase, $DiningTablesTable, DiningTable>,
      ),
      DiningTable,
      PrefetchHooks Function()
    >;
typedef $$SalesTableCreateCompanionBuilder =
    SalesCompanion Function({
      required String uuid,
      Value<String?> businessUuid,
      Value<String?> checkoutGroupUuid,
      required String outletUuid,
      Value<String> transactionType,
      Value<String?> diningTableUuid,
      required String deviceUuid,
      Value<String?> number,
      Value<String> status,
      required int subtotal,
      Value<int> discountTotal,
      Value<int> taxTotal,
      Value<int> serviceTotal,
      required int grandTotal,
      required String idempotencyKey,
      Value<String> syncStatus,
      Value<String?> syncError,
      required DateTime soldAt,
      Value<DateTime?> receivedAt,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$SalesTableUpdateCompanionBuilder =
    SalesCompanion Function({
      Value<String> uuid,
      Value<String?> businessUuid,
      Value<String?> checkoutGroupUuid,
      Value<String> outletUuid,
      Value<String> transactionType,
      Value<String?> diningTableUuid,
      Value<String> deviceUuid,
      Value<String?> number,
      Value<String> status,
      Value<int> subtotal,
      Value<int> discountTotal,
      Value<int> taxTotal,
      Value<int> serviceTotal,
      Value<int> grandTotal,
      Value<String> idempotencyKey,
      Value<String> syncStatus,
      Value<String?> syncError,
      Value<DateTime> soldAt,
      Value<DateTime?> receivedAt,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$SalesTableFilterComposer extends Composer<_$AppDatabase, $SalesTable> {
  $$SalesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get businessUuid => $composableBuilder(
    column: $table.businessUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get checkoutGroupUuid => $composableBuilder(
    column: $table.checkoutGroupUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get outletUuid => $composableBuilder(
    column: $table.outletUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get transactionType => $composableBuilder(
    column: $table.transactionType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get diningTableUuid => $composableBuilder(
    column: $table.diningTableUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceUuid => $composableBuilder(
    column: $table.deviceUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get discountTotal => $composableBuilder(
    column: $table.discountTotal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get taxTotal => $composableBuilder(
    column: $table.taxTotal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get serviceTotal => $composableBuilder(
    column: $table.serviceTotal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get grandTotal => $composableBuilder(
    column: $table.grandTotal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get idempotencyKey => $composableBuilder(
    column: $table.idempotencyKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncError => $composableBuilder(
    column: $table.syncError,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get soldAt => $composableBuilder(
    column: $table.soldAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get receivedAt => $composableBuilder(
    column: $table.receivedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SalesTableOrderingComposer
    extends Composer<_$AppDatabase, $SalesTable> {
  $$SalesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get businessUuid => $composableBuilder(
    column: $table.businessUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get checkoutGroupUuid => $composableBuilder(
    column: $table.checkoutGroupUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get outletUuid => $composableBuilder(
    column: $table.outletUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get transactionType => $composableBuilder(
    column: $table.transactionType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get diningTableUuid => $composableBuilder(
    column: $table.diningTableUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceUuid => $composableBuilder(
    column: $table.deviceUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get discountTotal => $composableBuilder(
    column: $table.discountTotal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get taxTotal => $composableBuilder(
    column: $table.taxTotal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get serviceTotal => $composableBuilder(
    column: $table.serviceTotal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get grandTotal => $composableBuilder(
    column: $table.grandTotal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get idempotencyKey => $composableBuilder(
    column: $table.idempotencyKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncError => $composableBuilder(
    column: $table.syncError,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get soldAt => $composableBuilder(
    column: $table.soldAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get receivedAt => $composableBuilder(
    column: $table.receivedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SalesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SalesTable> {
  $$SalesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<String> get businessUuid => $composableBuilder(
    column: $table.businessUuid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get checkoutGroupUuid => $composableBuilder(
    column: $table.checkoutGroupUuid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get outletUuid => $composableBuilder(
    column: $table.outletUuid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get transactionType => $composableBuilder(
    column: $table.transactionType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get diningTableUuid => $composableBuilder(
    column: $table.diningTableUuid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceUuid => $composableBuilder(
    column: $table.deviceUuid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get number =>
      $composableBuilder(column: $table.number, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get subtotal =>
      $composableBuilder(column: $table.subtotal, builder: (column) => column);

  GeneratedColumn<int> get discountTotal => $composableBuilder(
    column: $table.discountTotal,
    builder: (column) => column,
  );

  GeneratedColumn<int> get taxTotal =>
      $composableBuilder(column: $table.taxTotal, builder: (column) => column);

  GeneratedColumn<int> get serviceTotal => $composableBuilder(
    column: $table.serviceTotal,
    builder: (column) => column,
  );

  GeneratedColumn<int> get grandTotal => $composableBuilder(
    column: $table.grandTotal,
    builder: (column) => column,
  );

  GeneratedColumn<String> get idempotencyKey => $composableBuilder(
    column: $table.idempotencyKey,
    builder: (column) => column,
  );

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get syncError =>
      $composableBuilder(column: $table.syncError, builder: (column) => column);

  GeneratedColumn<DateTime> get soldAt =>
      $composableBuilder(column: $table.soldAt, builder: (column) => column);

  GeneratedColumn<DateTime> get receivedAt => $composableBuilder(
    column: $table.receivedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$SalesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SalesTable,
          Sale,
          $$SalesTableFilterComposer,
          $$SalesTableOrderingComposer,
          $$SalesTableAnnotationComposer,
          $$SalesTableCreateCompanionBuilder,
          $$SalesTableUpdateCompanionBuilder,
          (Sale, BaseReferences<_$AppDatabase, $SalesTable, Sale>),
          Sale,
          PrefetchHooks Function()
        > {
  $$SalesTableTableManager(_$AppDatabase db, $SalesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SalesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SalesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SalesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> uuid = const Value.absent(),
                Value<String?> businessUuid = const Value.absent(),
                Value<String?> checkoutGroupUuid = const Value.absent(),
                Value<String> outletUuid = const Value.absent(),
                Value<String> transactionType = const Value.absent(),
                Value<String?> diningTableUuid = const Value.absent(),
                Value<String> deviceUuid = const Value.absent(),
                Value<String?> number = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> subtotal = const Value.absent(),
                Value<int> discountTotal = const Value.absent(),
                Value<int> taxTotal = const Value.absent(),
                Value<int> serviceTotal = const Value.absent(),
                Value<int> grandTotal = const Value.absent(),
                Value<String> idempotencyKey = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> syncError = const Value.absent(),
                Value<DateTime> soldAt = const Value.absent(),
                Value<DateTime?> receivedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SalesCompanion(
                uuid: uuid,
                businessUuid: businessUuid,
                checkoutGroupUuid: checkoutGroupUuid,
                outletUuid: outletUuid,
                transactionType: transactionType,
                diningTableUuid: diningTableUuid,
                deviceUuid: deviceUuid,
                number: number,
                status: status,
                subtotal: subtotal,
                discountTotal: discountTotal,
                taxTotal: taxTotal,
                serviceTotal: serviceTotal,
                grandTotal: grandTotal,
                idempotencyKey: idempotencyKey,
                syncStatus: syncStatus,
                syncError: syncError,
                soldAt: soldAt,
                receivedAt: receivedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String uuid,
                Value<String?> businessUuid = const Value.absent(),
                Value<String?> checkoutGroupUuid = const Value.absent(),
                required String outletUuid,
                Value<String> transactionType = const Value.absent(),
                Value<String?> diningTableUuid = const Value.absent(),
                required String deviceUuid,
                Value<String?> number = const Value.absent(),
                Value<String> status = const Value.absent(),
                required int subtotal,
                Value<int> discountTotal = const Value.absent(),
                Value<int> taxTotal = const Value.absent(),
                Value<int> serviceTotal = const Value.absent(),
                required int grandTotal,
                required String idempotencyKey,
                Value<String> syncStatus = const Value.absent(),
                Value<String?> syncError = const Value.absent(),
                required DateTime soldAt,
                Value<DateTime?> receivedAt = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => SalesCompanion.insert(
                uuid: uuid,
                businessUuid: businessUuid,
                checkoutGroupUuid: checkoutGroupUuid,
                outletUuid: outletUuid,
                transactionType: transactionType,
                diningTableUuid: diningTableUuid,
                deviceUuid: deviceUuid,
                number: number,
                status: status,
                subtotal: subtotal,
                discountTotal: discountTotal,
                taxTotal: taxTotal,
                serviceTotal: serviceTotal,
                grandTotal: grandTotal,
                idempotencyKey: idempotencyKey,
                syncStatus: syncStatus,
                syncError: syncError,
                soldAt: soldAt,
                receivedAt: receivedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SalesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SalesTable,
      Sale,
      $$SalesTableFilterComposer,
      $$SalesTableOrderingComposer,
      $$SalesTableAnnotationComposer,
      $$SalesTableCreateCompanionBuilder,
      $$SalesTableUpdateCompanionBuilder,
      (Sale, BaseReferences<_$AppDatabase, $SalesTable, Sale>),
      Sale,
      PrefetchHooks Function()
    >;
typedef $$SaleItemsTableCreateCompanionBuilder =
    SaleItemsCompanion Function({
      required String uuid,
      required String saleUuid,
      Value<String?> menuItemUuid,
      required String name,
      required int quantity,
      required int unitPrice,
      Value<int> discountTotal,
      required int lineTotal,
      Value<int> rowid,
    });
typedef $$SaleItemsTableUpdateCompanionBuilder =
    SaleItemsCompanion Function({
      Value<String> uuid,
      Value<String> saleUuid,
      Value<String?> menuItemUuid,
      Value<String> name,
      Value<int> quantity,
      Value<int> unitPrice,
      Value<int> discountTotal,
      Value<int> lineTotal,
      Value<int> rowid,
    });

class $$SaleItemsTableFilterComposer
    extends Composer<_$AppDatabase, $SaleItemsTable> {
  $$SaleItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get saleUuid => $composableBuilder(
    column: $table.saleUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get menuItemUuid => $composableBuilder(
    column: $table.menuItemUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unitPrice => $composableBuilder(
    column: $table.unitPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get discountTotal => $composableBuilder(
    column: $table.discountTotal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lineTotal => $composableBuilder(
    column: $table.lineTotal,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SaleItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $SaleItemsTable> {
  $$SaleItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get saleUuid => $composableBuilder(
    column: $table.saleUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get menuItemUuid => $composableBuilder(
    column: $table.menuItemUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unitPrice => $composableBuilder(
    column: $table.unitPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get discountTotal => $composableBuilder(
    column: $table.discountTotal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lineTotal => $composableBuilder(
    column: $table.lineTotal,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SaleItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SaleItemsTable> {
  $$SaleItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<String> get saleUuid =>
      $composableBuilder(column: $table.saleUuid, builder: (column) => column);

  GeneratedColumn<String> get menuItemUuid => $composableBuilder(
    column: $table.menuItemUuid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<int> get unitPrice =>
      $composableBuilder(column: $table.unitPrice, builder: (column) => column);

  GeneratedColumn<int> get discountTotal => $composableBuilder(
    column: $table.discountTotal,
    builder: (column) => column,
  );

  GeneratedColumn<int> get lineTotal =>
      $composableBuilder(column: $table.lineTotal, builder: (column) => column);
}

class $$SaleItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SaleItemsTable,
          SaleItem,
          $$SaleItemsTableFilterComposer,
          $$SaleItemsTableOrderingComposer,
          $$SaleItemsTableAnnotationComposer,
          $$SaleItemsTableCreateCompanionBuilder,
          $$SaleItemsTableUpdateCompanionBuilder,
          (SaleItem, BaseReferences<_$AppDatabase, $SaleItemsTable, SaleItem>),
          SaleItem,
          PrefetchHooks Function()
        > {
  $$SaleItemsTableTableManager(_$AppDatabase db, $SaleItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SaleItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SaleItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SaleItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> uuid = const Value.absent(),
                Value<String> saleUuid = const Value.absent(),
                Value<String?> menuItemUuid = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> quantity = const Value.absent(),
                Value<int> unitPrice = const Value.absent(),
                Value<int> discountTotal = const Value.absent(),
                Value<int> lineTotal = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SaleItemsCompanion(
                uuid: uuid,
                saleUuid: saleUuid,
                menuItemUuid: menuItemUuid,
                name: name,
                quantity: quantity,
                unitPrice: unitPrice,
                discountTotal: discountTotal,
                lineTotal: lineTotal,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String uuid,
                required String saleUuid,
                Value<String?> menuItemUuid = const Value.absent(),
                required String name,
                required int quantity,
                required int unitPrice,
                Value<int> discountTotal = const Value.absent(),
                required int lineTotal,
                Value<int> rowid = const Value.absent(),
              }) => SaleItemsCompanion.insert(
                uuid: uuid,
                saleUuid: saleUuid,
                menuItemUuid: menuItemUuid,
                name: name,
                quantity: quantity,
                unitPrice: unitPrice,
                discountTotal: discountTotal,
                lineTotal: lineTotal,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SaleItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SaleItemsTable,
      SaleItem,
      $$SaleItemsTableFilterComposer,
      $$SaleItemsTableOrderingComposer,
      $$SaleItemsTableAnnotationComposer,
      $$SaleItemsTableCreateCompanionBuilder,
      $$SaleItemsTableUpdateCompanionBuilder,
      (SaleItem, BaseReferences<_$AppDatabase, $SaleItemsTable, SaleItem>),
      SaleItem,
      PrefetchHooks Function()
    >;
typedef $$SyncQueueEntriesTableCreateCompanionBuilder =
    SyncQueueEntriesCompanion Function({
      Value<int> id,
      required String entityType,
      required String entityUuid,
      required String idempotencyKey,
      required String payloadJson,
      Value<String> status,
      Value<int> retryCount,
      Value<String?> lastError,
      required DateTime createdAt,
      required DateTime updatedAt,
    });
typedef $$SyncQueueEntriesTableUpdateCompanionBuilder =
    SyncQueueEntriesCompanion Function({
      Value<int> id,
      Value<String> entityType,
      Value<String> entityUuid,
      Value<String> idempotencyKey,
      Value<String> payloadJson,
      Value<String> status,
      Value<int> retryCount,
      Value<String?> lastError,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

class $$SyncQueueEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $SyncQueueEntriesTable> {
  $$SyncQueueEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityUuid => $composableBuilder(
    column: $table.entityUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get idempotencyKey => $composableBuilder(
    column: $table.idempotencyKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastError => $composableBuilder(
    column: $table.lastError,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncQueueEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncQueueEntriesTable> {
  $$SyncQueueEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityUuid => $composableBuilder(
    column: $table.entityUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get idempotencyKey => $composableBuilder(
    column: $table.idempotencyKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastError => $composableBuilder(
    column: $table.lastError,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncQueueEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncQueueEntriesTable> {
  $$SyncQueueEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get entityUuid => $composableBuilder(
    column: $table.entityUuid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get idempotencyKey => $composableBuilder(
    column: $table.idempotencyKey,
    builder: (column) => column,
  );

  GeneratedColumn<String> get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastError =>
      $composableBuilder(column: $table.lastError, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$SyncQueueEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncQueueEntriesTable,
          SyncQueueEntry,
          $$SyncQueueEntriesTableFilterComposer,
          $$SyncQueueEntriesTableOrderingComposer,
          $$SyncQueueEntriesTableAnnotationComposer,
          $$SyncQueueEntriesTableCreateCompanionBuilder,
          $$SyncQueueEntriesTableUpdateCompanionBuilder,
          (
            SyncQueueEntry,
            BaseReferences<
              _$AppDatabase,
              $SyncQueueEntriesTable,
              SyncQueueEntry
            >,
          ),
          SyncQueueEntry,
          PrefetchHooks Function()
        > {
  $$SyncQueueEntriesTableTableManager(
    _$AppDatabase db,
    $SyncQueueEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncQueueEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncQueueEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncQueueEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> entityType = const Value.absent(),
                Value<String> entityUuid = const Value.absent(),
                Value<String> idempotencyKey = const Value.absent(),
                Value<String> payloadJson = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> retryCount = const Value.absent(),
                Value<String?> lastError = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => SyncQueueEntriesCompanion(
                id: id,
                entityType: entityType,
                entityUuid: entityUuid,
                idempotencyKey: idempotencyKey,
                payloadJson: payloadJson,
                status: status,
                retryCount: retryCount,
                lastError: lastError,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String entityType,
                required String entityUuid,
                required String idempotencyKey,
                required String payloadJson,
                Value<String> status = const Value.absent(),
                Value<int> retryCount = const Value.absent(),
                Value<String?> lastError = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
              }) => SyncQueueEntriesCompanion.insert(
                id: id,
                entityType: entityType,
                entityUuid: entityUuid,
                idempotencyKey: idempotencyKey,
                payloadJson: payloadJson,
                status: status,
                retryCount: retryCount,
                lastError: lastError,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncQueueEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncQueueEntriesTable,
      SyncQueueEntry,
      $$SyncQueueEntriesTableFilterComposer,
      $$SyncQueueEntriesTableOrderingComposer,
      $$SyncQueueEntriesTableAnnotationComposer,
      $$SyncQueueEntriesTableCreateCompanionBuilder,
      $$SyncQueueEntriesTableUpdateCompanionBuilder,
      (
        SyncQueueEntry,
        BaseReferences<_$AppDatabase, $SyncQueueEntriesTable, SyncQueueEntry>,
      ),
      SyncQueueEntry,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$LocalUsersTableTableManager get localUsers =>
      $$LocalUsersTableTableManager(_db, _db.localUsers);
  $$BusinessesTableTableManager get businesses =>
      $$BusinessesTableTableManager(_db, _db.businesses);
  $$LocalDevicesTableTableManager get localDevices =>
      $$LocalDevicesTableTableManager(_db, _db.localDevices);
  $$AuthSessionsTableTableManager get authSessions =>
      $$AuthSessionsTableTableManager(_db, _db.authSessions);
  $$OutletsTableTableManager get outlets =>
      $$OutletsTableTableManager(_db, _db.outlets);
  $$MenuCategoriesTableTableManager get menuCategories =>
      $$MenuCategoriesTableTableManager(_db, _db.menuCategories);
  $$MenuItemsTableTableManager get menuItems =>
      $$MenuItemsTableTableManager(_db, _db.menuItems);
  $$PaymentMethodsTableTableManager get paymentMethods =>
      $$PaymentMethodsTableTableManager(_db, _db.paymentMethods);
  $$DiningTablesTableTableManager get diningTables =>
      $$DiningTablesTableTableManager(_db, _db.diningTables);
  $$SalesTableTableManager get sales =>
      $$SalesTableTableManager(_db, _db.sales);
  $$SaleItemsTableTableManager get saleItems =>
      $$SaleItemsTableTableManager(_db, _db.saleItems);
  $$SyncQueueEntriesTableTableManager get syncQueueEntries =>
      $$SyncQueueEntriesTableTableManager(_db, _db.syncQueueEntries);
}
