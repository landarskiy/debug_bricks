import 'package:debug_bricks_ui/debug_bricks_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../util/ui_util.dart';

void main() {
  testWidgets('CheckboxBrick widget test', (tester) async {
    await tester.pumpWidgetWithMaterial(
      const CheckboxBrick(
        value: true,
        title: 'T',
        subtitle: 'S',
      ),
    );
    expect(find.text('T'), findsOneWidget);
    expect(find.text('S'), findsOneWidget);
    expect(find.byType(Checkbox), findsOneWidget);
  });

  testWidgets('CheckboxBrick tap test', (tester) async {
    bool checked = true;
    int callbackCount = 0;
    await tester.pumpWidgetWithMaterial(
      CheckboxBrick(
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
    await tester.tap(find.byType(CheckboxBrick));
    await tester.pump();
    expect(checked, false);
    expect(callbackCount, 1);
    await tester.tap(find.byType(Checkbox));
    await tester.pump();
    expect(checked, false);
    expect(callbackCount, 2);
  });
}
