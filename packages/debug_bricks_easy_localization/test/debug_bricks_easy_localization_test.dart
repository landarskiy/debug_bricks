import 'package:debug_bricks_easy_localization/debug_bricks_easy_localization.dart';
import 'package:flutter_test/flutter_test.dart';

import 'utils/ui_utils.dart';

void main() {
  testWidgets('DeviceInfoBrick widget test', (tester) async {
    await tester.pumpWidgetWithMaterial(
      const EasyLocalizationBrick(
        title: 'T',
      ),
    );
    expect(find.text('T'), findsOneWidget);
    //TODO finish test
  });
}
