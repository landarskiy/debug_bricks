import 'package:debug_bricks_ui/debug_bricks_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../utils/ui_utils.dart';

void main() {
  testWidgets('SwitchBrick widget test', (tester) async {
    await tester.pumpWidgetWithMaterial(
      const SwitchBrick(
        value: true,
        title: 'T',
        subtitle: 'S',
      ),
    );
    expect(find.text('T'), findsOneWidget);
    expect(find.text('S'), findsOneWidget);
    expect(find.byType(Switch), findsOneWidget);
  });

  testWidgets('SwitchBrick tap test', (tester) async {
    bool checked = true;
    int callbackCount = 0;
    await tester.pumpWidgetWithMaterial(
      SwitchBrick(
        value: true,
        title: 'T',
        subtitle: 'S',
        changeListener: (value) {
          checked = value ?? false;
          callbackCount++;
        },
      ),
    );
    expect(checked, true);
    expect(callbackCount, 0);
    await tester.tap(find.byType(SwitchBrick));
    await tester.pump();
    expect(checked, false);
    expect(callbackCount, 1);
    await tester.tap(find.byType(Switch));
    await tester.pump();
    expect(checked, false);
    expect(callbackCount, 2);
    await tester.drag(find.byType(Switch), const Offset(-500.0, 0.0));
    await tester.pumpAndSettle();
    expect(checked, false);
    expect(callbackCount, 3);
  });
}
