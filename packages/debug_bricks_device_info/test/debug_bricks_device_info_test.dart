import 'package:debug_bricks_device_info/debug_bricks_device_info.dart';
import 'package:flutter_test/flutter_test.dart';

import 'util/ui_util.dart';

void main() {
  testWidgets('DeviceInfoBrick widget test', (tester) async {
    await tester.pumpWidgetWithMaterial(
      DeviceInfoBrick(
        title: 'T',
      ),
    );
    expect(find.text('T'), findsOneWidget);
    //TODO finish test
  });
}
