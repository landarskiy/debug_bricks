import 'package:device_info_plus/device_info_plus.dart';

class MockedAndroidBuildVersion implements AndroidBuildVersion {
  @override
  String? get baseOS => throw UnimplementedError();

  @override
  String? get codename => throw UnimplementedError();

  @override
  String? get incremental => throw UnimplementedError();

  @override
  int? get previewSdkInt => throw UnimplementedError();

  @override
  String? get release => 'R';

  @override
  int? get sdkInt => 1;

  @override
  String? get securityPatch => throw UnimplementedError();

  @override
  Map<String, dynamic> toMap() {
    throw UnimplementedError();
  }
}

class MockedIosUtsname implements IosUtsname {
  @override
  String? get machine => throw UnimplementedError();

  @override
  String? get nodename => throw UnimplementedError();

  @override
  String? get release => 'R';

  @override
  String? get sysname => throw UnimplementedError();

  @override
  String? get version => 'V';
}
