import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

import 'device_info_source.dart';

class DeviceInfoProvider extends ChangeNotifier {
  final DeviceInfoSource _deviceInfoSource;

  BaseDeviceInfo? get cachedDeviceInfo {
    return _deviceInfoSource.cachedDeviceInfo;
  }

  DeviceInfoProvider(this._deviceInfoSource) {
    _loadDeviceInfo();
  }

  _loadDeviceInfo() async {
    await _deviceInfoSource.deviceInfoFuture;
    notifyListeners();
  }
}
