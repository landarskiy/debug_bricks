import 'package:debug_bricks_ui/debug_bricks_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../util/ui_util.dart';

void main() {
  testWidgets('RadioBrick widget test', (tester) async {
    await tester.pumpWidgetWithMaterial(
      const RadioBrick<String>(
        title: 'T',
        subtitle: 'S',
        value: 'v',
        groupValue: 'v',
      ),
    );
    expect(find.text('T'), findsOneWidget);
    expect(find.text('S'), findsOneWidget);
    expect(find.byType(Radio<String>), findsOneWidget);
  });

  testWidgets('RadioBrick tap test', (tester) async {
    int callbackCount = 0;
    await tester.pumpWidgetWithMaterial(
      RadioBrick<String>(
        title: 'T',
        subtitle: 'S',
        value: 'v',
        groupValue: 'nv',
        changeListener: (value) {
          callbackCount++;
        },
      ),
    );
    expect(callbackCount, 0);
    await tester.tap(find.byType(RadioBrick<String>));
    await tester.pump();
    expect(callbackCount, 1);
    await tester.tap(find.byType(Radio<String>));
    await tester.pump();
    expect(callbackCount, 2);
  });

  testWidgets('RadioBrick same tap test', (tester) async {
    int callbackCount = 0;
    await tester.pumpWidgetWithMaterial(
      RadioBrick<String>(
        title: 'T',
        subtitle: 'S',
        value: 'v',
        groupValue: 'v',
        changeListener: (value) {
          callbackCount++;
        },
      ),
    );
    expect(callbackCount, 0);
    await tester.tap(find.byType(RadioBrick<String>));
    await tester.pump();
    expect(callbackCount, 0);
  });
}
