import 'package:debug_bricks_ui/debug_bricks_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../utils/ui_utils.dart';

void main() {
  testWidgets('ExpandableBrick widget test', (tester) async {
    await tester.pumpWidgetWithMaterial(
      const ExpandableBrick(
        title: 'T',
        subtitle: 'S',
        initiallyExpanded: true,
        children: [Text('C1'), Text('C2')],
      ),
    );
    expect(find.text('T'), findsOneWidget);
    expect(find.text('S'), findsOneWidget);
    expect(find.text('C1'), findsOneWidget);
    expect(find.text('C2'), findsOneWidget);
  });

  testWidgets('ExpandableBrick tap test', (tester) async {
    await tester.pumpWidgetWithMaterial(
      const ExpandableBrick(
        title: 'T',
        subtitle: 'S',
        initiallyExpanded: true,
        children: [Text('C1'), Text('C2')],
      ),
    );
    expect(find.text('C1'), findsOneWidget);
    expect(find.text('C2'), findsOneWidget);
    await tester.tap(find.byType(ExpandableBrick));
    await tester.pumpAndSettle();
    expect(find.text('C1'), findsNothing);
    expect(find.text('C2'), findsNothing);
    await tester.tap(find.byType(ExpandableBrick));
    await tester.pumpAndSettle();
    expect(find.text('C1'), findsOneWidget);
    expect(find.text('C2'), findsOneWidget);
  });
}
