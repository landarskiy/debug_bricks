import 'package:debug_bricks_fcm_token/debug_bricks_fcm_token.dart';
import 'package:flutter_test/flutter_test.dart';

import 'utils/ui_utils.dart';

void main() {
  testWidgets('FcmTokenBrick widget test', (tester) async {
    await tester.pumpWidgetWithMaterial(
      const FcmTokenBrick(
        title: 'T',
      ),
    );
    expect(find.text('T'), findsOneWidget);
    //TODO finish test
  });
}
