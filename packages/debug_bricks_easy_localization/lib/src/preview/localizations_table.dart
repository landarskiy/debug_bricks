import 'package:debug_bricks_easy_localization/src/preview/internal/localizations_provider.dart';
import 'package:debug_bricks_easy_localization/src/preview/internal/table_controls.dart';
import 'package:debug_bricks_easy_localization/src/preview/internal/table_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocalizationsTable extends StatelessWidget {
  final Map<String, Map<String, dynamic>> mapLocales;
  final ResourcesProvider resourcesProvider;

  const LocalizationsTable({
    Key? key,
    this.mapLocales = const {},
    this.resourcesProvider = const ResourcesProvider(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildProvider(_buildConsumer());
  }

  Widget _buildConsumer() {
    return Consumer<LocalizationsProvider>(
      builder: (context, localizationProvider, _) {
        return _buildTable(context, localizationProvider);
      },
    );
  }

  Widget _buildProvider(Widget child) {
    return ChangeNotifierProvider<LocalizationsProvider>(
      create: (_) => LocalizationsProvider(mapLocales),
      child: child,
    );
  }

  Widget _buildTable(
    BuildContext context,
    LocalizationsProvider localizationsProvider,
  ) {
    final state = localizationsProvider.localizationState;
    if (state.selectedLocale == null) {
      return Container();
    }
    return Column(
      children: [
        TableControls(
          resourcesProvider: resourcesProvider,
          locales: state.locales,
          selectedLocale: state.selectedLocale,
          keySortOrder: state.keySortOrder,
          valueSortOrder: state.valueSortOrder,
          selectionCallback: (locale) {
            localizationsProvider.changeLocale(locale);
          },
          keySortOrderCallback: (sortOrder) {
            localizationsProvider.changeKeySortOrder();
          },
          valueSortOrderCallback: (sortOrder) {
            localizationsProvider.changeValueSortOrder();
          },
        ),
        Expanded(child: _buildList(context, state.translations)),
      ],
    );
  }

  Widget _buildList(BuildContext context, List<TranslationPair> pairs) {
    final theme = Theme.of(context);
    return ListView.builder(
      itemCount: pairs.length,
      itemBuilder: (BuildContext context, int index) {
        final Color bgColor;
        if (index % 2 == 1) {
          bgColor = theme.colorScheme.surfaceVariant;
        } else {
          bgColor = Colors.transparent;
        }
        return DecoratedBox(
          key: ValueKey(pairs[index].key),
          decoration: BoxDecoration(color: bgColor),
          child: Container(
            padding: const EdgeInsets.all(8),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 40,
              ),
              child: TableItem(
                valueKey: pairs[index].key,
                value: pairs[index].value,
              ),
            ),
          ),
        );
      },
    );
  }
}

class ResourcesProvider {
  const ResourcesProvider();

  String get titleKey => 'Key';

  String get titleValue => 'Value';
}
