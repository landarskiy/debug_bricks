import 'package:debug_bricks_easy_localization/debug_bricks_easy_localization.dart';
import 'package:debug_bricks_easy_localization/src/preview/internal/localizations_provider.dart';
import 'package:debug_bricks_easy_localization/src/preview/internal/table_item_header.dart';
import 'package:flutter_test/flutter_test.dart';

import '../utils/ui_utils.dart';

void main() {
  _compareStates(
    LocalizationsProvider provider,
    LocalizationState expected,
  ) {
    final actual = provider.localizationState;
    expect(
      actual == expected,
      true,
      reason: 'Actual: $actual\nExpected: $expected',
    );
  }

  test('SortOrder test', () {
    var value = SortOrder.neutral;
    value = value.next();
    expect(value == SortOrder.ascent, true, reason: 'Actual: $value');
    value = value.next();
    expect(value == SortOrder.descent, true, reason: 'Actual: $value');
    value = value.next();
    expect(value == SortOrder.neutral, true, reason: 'Actual: $value');
  });

  testWidgets('LocalizationsProvider test', (tester) async {
    LocalizationsProvider provider = LocalizationsProvider({
      'en': {'c': 'enc', 'a': 'ena', 'b': 'enb'},
      'ru': {'c': 'ruc', 'a': 'rua', 'b': 'rub'},
    });
    _compareStates(
      provider,
      LocalizationState(
        selectedLocale: 'en',
        locales: ['en', 'ru'],
        translations: [
          TranslationPair('c', 'enc'),
          TranslationPair('a', 'ena'),
          TranslationPair('b', 'enb'),
        ],
      ),
    );

    await provider.changeLocale('ru');
    _compareStates(
      provider,
      LocalizationState(
        selectedLocale: 'ru',
        locales: ['en', 'ru'],
        translations: [
          TranslationPair('c', 'ruc'),
          TranslationPair('a', 'rua'),
          TranslationPair('b', 'rub'),
        ],
      ),
    );

    await provider.changeLocale('en');
    _compareStates(
      provider,
      LocalizationState(
        selectedLocale: 'en',
        locales: ['en', 'ru'],
        translations: [
          TranslationPair('c', 'enc'),
          TranslationPair('a', 'ena'),
          TranslationPair('b', 'enb'),
        ],
      ),
    );

    await provider.changeKeySortOrder();
    _compareStates(
      provider,
      LocalizationState(
        selectedLocale: 'en',
        locales: ['en', 'ru'],
        keySortOrder: SortOrder.ascent,
        translations: [
          TranslationPair('a', 'ena'),
          TranslationPair('b', 'enb'),
          TranslationPair('c', 'enc'),
        ],
      ),
    );

    await provider.changeValueSortOrder();
    _compareStates(
      provider,
      LocalizationState(
        selectedLocale: 'en',
        locales: ['en', 'ru'],
        valueSortOrder: SortOrder.ascent,
        translations: [
          TranslationPair('a', 'ena'),
          TranslationPair('b', 'enb'),
          TranslationPair('c', 'enc'),
        ],
      ),
    );
  });

  testWidgets('TableItemHeader widget test', (tester) async {
    var keyClicked = false;
    keyListener(SortOrder sortOrder) {
      keyClicked = true;
    }

    var valueClicked = false;
    valueListener(SortOrder sortOrder) {
      valueClicked = true;
    }

    await tester.pumpWidgetWithMaterial(
      TableItemHeader(
        resourcesProvider: const ResourcesProvider(),
        keySortOrder: SortOrder.neutral,
        valueSortOrder: SortOrder.neutral,
        keySortOrderCallback: keyListener,
        valueSortOrderCallback: valueListener,
      ),
    );

    expect(find.text('Key'), findsOneWidget);
    expect(find.text('Value'), findsOneWidget);
    expect(keyClicked, false);
    await tester.tap(find.text('Key'));
    await tester.pumpAndSettle();
    expect(keyClicked, true);
    expect(valueClicked, false);
    await tester.tap(find.text('Value'));
    await tester.pumpAndSettle();
    expect(valueClicked, true);
  });
}
