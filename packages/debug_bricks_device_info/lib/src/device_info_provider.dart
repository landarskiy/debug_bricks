import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

import 'device_info_source.dart';

class DeviceInfoProvider extends ChangeNotifier {
  final DeviceInfoSource deviceInfoSource = DeviceInfoSource();

  BaseDeviceInfo? get cachedDeviceInfo {
    return deviceInfoSource.cachedDeviceInfo;
  }

  DeviceInfoProvider() {
    _loadDeviceInfo();
  }

  _loadDeviceInfo() async {
    await deviceInfoSource.deviceInfoFuture;
    notifyListeners();
  }
}
