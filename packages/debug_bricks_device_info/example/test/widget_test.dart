import 'package:example/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App test', (WidgetTester tester) async {
    await tester.pumpWidget(const DemoApp());
    expect(find.text('Device info'), findsOneWidget);
  });
}
