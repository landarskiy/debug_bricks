import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:example/main.dart';

void main() {
  testWidgets('App test', (WidgetTester tester) async {
    await tester.pumpWidget(const DemoApp());
    expect(find.text('Language'), findsOneWidget);
  });
}

