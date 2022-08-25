import 'package:debug_bricks_easy_localization/src/preview/internal/table_item_header.dart';
import 'package:debug_bricks_easy_localization/src/preview/localizations_table.dart';
import 'package:flutter/material.dart';

import 'localizations_provider.dart';

class TableControls extends StatelessWidget {
  final ResourcesProvider resourcesProvider;
  final List<String> locales;
  final String? selectedLocale;
  final SortOrder keySortOrder;
  final SortOrder valueSortOrder;
  final ValueChanged<String> selectionCallback;
  final ValueChanged<SortOrder> keySortOrderCallback;
  final ValueChanged<SortOrder> valueSortOrderCallback;

  const TableControls({
    Key? key,
    required this.locales,
    required this.selectedLocale,
    required this.keySortOrder,
    required this.valueSortOrder,
    required this.selectionCallback,
    required this.keySortOrderCallback,
    required this.valueSortOrderCallback,
    required this.resourcesProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          child: LanguageSelector(
            locales: locales,
            selectedLocale: selectedLocale,
            selectionCallback: selectionCallback,
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(color: theme.colorScheme.surfaceVariant),
          child: Container(
            padding: const EdgeInsets.all(8),
            child: TableItemHeader(
              keySortOrder: keySortOrder,
              valueSortOrder: valueSortOrder,
              keySortOrderCallback: keySortOrderCallback,
              valueSortOrderCallback: valueSortOrderCallback,
              resourcesProvider: resourcesProvider,
            ),
          ),
        ),
      ],
    );
  }
}

@visibleForTesting
class LanguageSelector extends StatelessWidget {
  final List<String> locales;
  final String? selectedLocale;
  final ValueChanged<String> selectionCallback;

  const LanguageSelector({
    Key? key,
    required this.locales,
    this.selectedLocale,
    required this.selectionCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = List<Widget>.generate(
      locales.length,
      (int index) {
        return ChoiceChip(
          label: Text(
            locales[index],
          ),
          selected: locales[index] == selectedLocale,
          onSelected: (bool selected) {
            selectionCallback(locales[index]);
          },
        );
      },
    );
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: items.toList(),
    );
  }
}
