import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoSource {
  static final DeviceInfoSource _instance = DeviceInfoSource._internal();
  final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();
  BaseDeviceInfo? _cachedDeviceInfo;
  late Future<BaseDeviceInfo> _deviceInfoFuture;

  BaseDeviceInfo? get cachedDeviceInfo {
    return _cachedDeviceInfo;
  }

  Future<BaseDeviceInfo> get deviceInfoFuture {
    return _deviceInfoFuture;
  }

  factory DeviceInfoSource() => _instance;

  DeviceInfoSource._internal() {
    _deviceInfoFuture = _deviceInfoPlugin.deviceInfo;
    _deviceInfoFuture.then((deviceInfo) => {_cachedDeviceInfo = deviceInfo});
  }
}
