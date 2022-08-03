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

class DeviceInfoAdapter {
  const DeviceInfoAdapter();

  String convert(BaseDeviceInfo? deviceInfo) {
    if (deviceInfo == null) {
      return 'No device info found';
    } else {
      return extract(deviceInfo);
    }
  }

  String extract(BaseDeviceInfo deviceInfo) {
    if (deviceInfo is AndroidDeviceInfo) {
      final model =
          '${deviceInfo.model} (${deviceInfo.device}) by ${deviceInfo.brand}';
      final os =
          'Android ${deviceInfo.version.release} (SDK ${deviceInfo.version.sdkInt})';
      return '$model\n$os';
    } else if (deviceInfo is IosDeviceInfo) {
      final model = '${deviceInfo.model} (${deviceInfo.name})';
      final os =
          'iOS ${deviceInfo.utsname.release} (${deviceInfo.utsname.version} )';
      return '$model\n$os';
    } else if (deviceInfo is WindowsDeviceInfo) {
      return 'Windows ${deviceInfo.computerName}';
    } else if (deviceInfo is LinuxDeviceInfo) {
      return 'Linux ${deviceInfo.name} (${deviceInfo.version})';
    } else if (deviceInfo is MacOsDeviceInfo) {
      return 'MacOs ${deviceInfo.model} (${deviceInfo.osRelease})';
    } else if (deviceInfo is WebBrowserInfo) {
      return 'Web ${deviceInfo.browserName.name}';
    }
    return extractFullInfo(deviceInfo);
  }

  String extractFullInfo(BaseDeviceInfo deviceInfo) {
    String info = '';
    deviceInfo.toMap().forEach((key, value) {
      info += '\n$key: $value';
    });
    return info.replaceFirst('\n', '');
  }
}

class FullDeviceInfoAdapter extends DeviceInfoAdapter {
  const FullDeviceInfoAdapter();

  @override
  String extract(BaseDeviceInfo deviceInfo) {
    return extractFullInfo(deviceInfo);
  }
}
