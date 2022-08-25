import 'package:flutter/material.dart';

import '../../../debug_bricks_easy_localization.dart';
import 'localizations_provider.dart';

class TableItemHeader extends StatelessWidget {
  final ResourcesProvider resourcesProvider;
  final SortOrder keySortOrder;
  final SortOrder valueSortOrder;
  final ValueChanged<SortOrder> keySortOrderCallback;
  final ValueChanged<SortOrder> valueSortOrderCallback;

  const TableItemHeader({
    Key? key,
    required this.keySortOrder,
    required this.valueSortOrder,
    required this.keySortOrderCallback,
    required this.valueSortOrderCallback,
    required this.resourcesProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final keyText = Text(
      resourcesProvider.titleKey,
      style: textTheme.titleMedium,
    );
    final valueText = Text(
      resourcesProvider.titleValue,
      style: textTheme.titleMedium,
    );
    final Widget key = _buildBySortOrder(theme, keyText, keySortOrder);
    final Widget value = _buildBySortOrder(theme, valueText, valueSortOrder);
    return SizedBox.fromSize(
      size: const Size.fromHeight(50),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: InkWell(
              child: key,
              onTap: () => keySortOrderCallback(keySortOrder),
            ),
          ),
          Expanded(
            flex: 2,
            child: InkWell(
              child: value,
              onTap: () => valueSortOrderCallback(valueSortOrder),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBySortOrder(ThemeData theme, Text child, SortOrder sortOrder) {
    switch (sortOrder) {
      case SortOrder.neutral:
        return _buildNeutral(theme, child);
      case SortOrder.ascent:
        return _buildAscent(theme, child);
      case SortOrder.descent:
        return _buildDescent(theme, child);
    }
  }

  Widget _buildNeutral(ThemeData theme, Text child) {
    return _buildOrderControl(theme, child, Icons.list);
  }

  Widget _buildAscent(ThemeData theme, Text child) {
    return _buildOrderControl(theme, child, Icons.arrow_upward);
  }

  Widget _buildDescent(ThemeData theme, Text child) {
    return _buildOrderControl(theme, child, Icons.arrow_downward);
  }

  Widget _buildOrderControl(ThemeData theme, Text child, IconData controlIcon) {
    return Row(
      children: [
        child,
        SizedBox.fromSize(size: const Size.fromWidth(8)),
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: theme.colorScheme.onSurface),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            padding: const EdgeInsets.all(4),
            child: Row(
              children: [
                Icon(size: 16, Icons.sort_by_alpha),
                Icon(size: 16, controlIcon),
              ],
            ),
          ),
        )
      ],
    );
  }
}
