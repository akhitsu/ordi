import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

final deviceIdentityServiceProvider = Provider<DeviceIdentityService>((ref) {
  return DeviceIdentityService(ref.watch(secureStorageProvider));
});

class DeviceIdentityService {
  DeviceIdentityService(this._storage);

  static const _deviceUuidKey = 'ordi_device_uuid';

  final FlutterSecureStorage _storage;
  final Uuid _uuid = const Uuid();

  Future<String> getOrCreateDeviceUuid() async {
    final existing = await _storage.read(key: _deviceUuidKey);
    if (existing != null && existing.isNotEmpty) {
      return existing;
    }

    final created = _uuid.v4();
    await _storage.write(key: _deviceUuidKey, value: created);
    return created;
  }

  String get platform {
    return switch (defaultTargetPlatform) {
      TargetPlatform.android => 'android',
      TargetPlatform.iOS => 'ios',
      TargetPlatform.macOS => 'macos',
      TargetPlatform.windows => 'windows',
      TargetPlatform.linux => 'linux',
      TargetPlatform.fuchsia => 'fuchsia',
    };
  }

  String get deviceName {
    return 'Ordi POS ${platform.toUpperCase()}';
  }
}
