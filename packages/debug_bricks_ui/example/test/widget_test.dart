import 'package:example/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App test', (WidgetTester tester) async {
    await tester.pumpWidget(const DemoApp());
    expect(find.text('TextBrick'), findsOneWidget);
    expect(find.text('SwitchBrick'), findsOneWidget);
    expect(find.text('CheckboxBrick'), findsOneWidget);
    expect(find.text('RadioBrick'), findsOneWidget);
    expect(find.text('ExpandableBrick'), findsOneWidget);
    expect(find.text('SliderBrick'), findsOneWidget);
  });
}
