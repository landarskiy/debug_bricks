import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

extension WidgetTesterExtension on WidgetTester {
  Future<void> pumpWidgetWithMaterial(Widget widget) {
    return pumpWidget(wrapMaterial(widget));
  }
}

Widget wrapMaterial(Widget child) {
  return MaterialApp(
    home: Scaffold(
      body: child,
    ),
  );
}
