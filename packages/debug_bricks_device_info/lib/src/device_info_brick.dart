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
