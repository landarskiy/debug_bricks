import 'package:debug_bricks_device_info/debug_bricks_device_info.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_test/flutter_test.dart';

import 'util/micks.dart';
import 'util/ui_util.dart';

void main() {
  testWidgets('DeviceInfoBrick widget test', (tester) async {
    await tester.pumpWidgetWithMaterial(
      DeviceInfoBrick(
        title: 'T',
      ),
    );
    expect(find.text('T'), findsOneWidget);
  });

  test('DeviceInfoAdapter test', () {
    const adapter = DeviceInfoAdapter();
    expect(
      adapter.convert(
        AndroidDeviceInfo(
          model: 'M',
          device: 'D',
          brand: 'B',
          version: MockedAndroidBuildVersion(),
          supported32BitAbis: [],
          supported64BitAbis: [],
          supportedAbis: [],
          systemFeatures: [],
        ),
      ),
      'M (D) by B\nAndroid R (SDK 1)',
    );

    expect(
      adapter.convert(
        IosDeviceInfo(
          model: 'M',
          name: 'N',
          utsname: MockedIosUtsname(),
          isPhysicalDevice: true,
        ),
      ),
      'M (N)\niOS R (V)',
    );

    expect(
      adapter.convert(
        WindowsDeviceInfo(
          computerName: 'PC',
          systemMemoryInMegabytes: 1,
          numberOfCores: 1,
        ),
      ),
      'Windows PC',
    );

    expect(
      adapter.convert(
        LinuxDeviceInfo(
          prettyName: 'PN',
          id: 'I',
          machineId: 'MI',
          name: 'N',
          version: 'V',
        ),
      ),
      'Linux N (V)',
    );

    expect(
      adapter.convert(
        const MacOsDeviceInfo(
          arch: 'A',
          model: 'M',
          osRelease: 'OR',
          cpuFrequency: 1,
          memorySize: 2,
          kernelVersion: 'KV',
          hostName: 'HN',
          systemGUID: 'G',
          activeCPUs: 3,
          computerName: 'CN',
        ),
      ),
      'MacOs M (OR)',
    );

    expect(
      adapter.convert(
        WebBrowserInfo(
          appCodeName: 'ACN',
          appName: 'AN',
          appVersion: 'AV',
          deviceMemory: 1,
          language: 'L',
          languages: ['L'],
          platform: 'P',
          product: 'PR',
          productSub: 'PRS',
          userAgent: 'Chrome',
          vendor: 'V',
          vendorSub: 'VS',
          maxTouchPoints: 2,
          hardwareConcurrency: 3,
        ),
      ),
      'Web ${BrowserName.chrome.name}',
    );

    expect(adapter.convert(null), 'No device info found');
  });
}
