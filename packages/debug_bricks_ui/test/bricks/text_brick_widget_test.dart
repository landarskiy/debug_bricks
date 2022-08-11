import 'package:debug_bricks_ui/debug_bricks_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../util/ui_util.dart';

void main() {
  testWidgets('TextBrick widget test', (tester) async {
    await tester.pumpWidgetWithMaterial(
      const TextBrick(
        title: 'T',
        subtitle: 'S',
        infoIconData: Icons.pending_actions,
        actionIconData: Icons.call_to_action,
      ),
    );
    expect(find.text('T'), findsOneWidget);
    expect(find.text('S'), findsOneWidget);
    expect(find.byIcon(Icons.pending_actions), findsOneWidget);
    expect(find.byIcon(Icons.call_to_action), findsOneWidget);
  });

  testWidgets('TextBrick tap test', (tester) async {
    int callbackCount = 0;
    await tester.pumpWidgetWithMaterial(
      TextBrick(
        title: 'T',
        subtitle: 'S',
        onTap: () {
          callbackCount++;
        },
      ),
    );
    expect(callbackCount, 0);
    await tester.tap(find.byType(TextBrick));
    await tester.pump();
    expect(callbackCount, 1);
  });
}
