import 'package:debug_bricks_ui/debug_bricks_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../util/ui_util.dart';

void main() {
  testWidgets('SliderBrick widget test', (tester) async {
    await tester.pumpWidgetWithMaterial(
      const SliderBrick(
        title: 'T',
        subtitle: 'S',
        minValue: 0,
        value: 50,
        maxValue: 100,
      ),
    );
    expect(find.text('T'), findsOneWidget);
    expect(find.text('S'), findsOneWidget);
    expect(find.byType(Slider), findsOneWidget);
  });

  testWidgets('SliderBrick swipe test', (tester) async {
    int currentValue = 50;
    await tester.pumpWidgetWithMaterial(
      SliderBrick(
        title: 'T',
        subtitle: 'S',
        minValue: 0,
        value: currentValue.toDouble(),
        maxValue: 100,
        changeListener: (value) {
          currentValue = value.round();
        },
      ),
    );
    expect(currentValue, 50);
    await tester.drag(find.byType(Slider), const Offset(-500.0, 0.0));
    await tester.pumpAndSettle();
    expect(currentValue, 0);
    await tester.drag(find.byType(Slider), const Offset(500.0, 0.0));
    await tester.pumpAndSettle();
    expect(currentValue, 100);
  });
}
