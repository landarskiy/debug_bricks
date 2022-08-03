import 'package:debug_bricks_core/debug_bricks_core.dart';
import 'package:debug_bricks_ui/debug_bricks_ui.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'device_info_provider.dart';

class DeviceInfoBrick extends StatelessWidget {
  DeviceInfoBrick({
    Key? key,
    this.title = 'Device info',
    this.deviceInfoAdapter = const DeviceInfoAdapter(),
    this.onTap,
  }) : super(key: key);

  final BricksLogger _logger = BricksLogger();
  final String title;
  final DeviceInfoAdapter deviceInfoAdapter;
  final Function(BaseDeviceInfo? deviceInfo)? onTap;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DeviceInfoProvider>(
      create: (_) => createProvider(),
      builder: (context, _) {
        final provider = context.watch<DeviceInfoProvider>();
        final deviceInfo = provider.cachedDeviceInfo;
        final info = deviceInfoAdapter.convert(deviceInfo);
        return TextBrick(
          infoIconData: Icons.devices,
          actionIconData: Icons.copy,
          title: title,
          subtitle: info,
          onTap: () {
            onTap?.call(deviceInfo);
            Clipboard.setData(ClipboardData(text: info));
            _logger.debug(info);
          },
        );
      },
    );
  }

  @visibleForTesting
  DeviceInfoProvider createProvider() {
    return DeviceInfoProvider();
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
