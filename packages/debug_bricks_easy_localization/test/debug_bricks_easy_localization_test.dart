import 'package:debug_bricks_easy_localization/debug_bricks_easy_localization.dart';
import 'package:debug_bricks_ui/debug_bricks_ui.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'utils/ui_utils.dart';

late BuildContext _context;

class ContextConsumer extends StatelessWidget {
  const ContextConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _context = context;
    return const EasyLocalizationBrick(
      title: 'T',
    );
  }
}

void main() {
  testWidgets('EasyLocalizationBrick widget test', (tester) async {
    await EasyLocalization.ensureInitialized();
    await tester.pumpWidgetWithMaterial(
      const ContextConsumer(),
    );
    _context.setLocale(localeEn);
    expect(find.text('T'), findsOneWidget);
    expect(find.text('ru'), findsNothing);
    expect(find.text('en'), findsOneWidget);
    await tester.tap(find.byType(ExpandableBrick));
    await tester.pumpAndSettle();
    expect(find.text('ru'), findsOneWidget);
    expect(find.text('en'), findsNWidgets(2));
    _context.setLocale(localeRu);
    await tester.pumpAndSettle();
    expect(find.text('ru'), findsNWidgets(2));
    expect(find.text('en'), findsOneWidget);
  });

  test('LocaleAdapter convert test', () {
    const adapter = LocaleAdapter();
    expect(adapter.convert(const Locale('en')), 'en');
    expect(adapter.convert(const Locale('en', 'us')), 'en-us');
  });
}
