import 'package:flutter/material.dart';

class LocalizationsProvider extends ChangeNotifier {
  final Map<String, Map<String, dynamic>> mapLocales;
  LocalizationState _localizationState = LocalizationState();

  LocalizationState get localizationState => _localizationState;

  LocalizationsProvider(this.mapLocales) {
    _processData();
  }

  changeLocale(String? locale) {
    _processData(
      locale: locale,
      keySortOrder: localizationState.keySortOrder,
      valueSortOrder: localizationState.valueSortOrder,
    );
  }

  changeKeySortOrder() {
    _processData(
      locale: localizationState.selectedLocale,
      keySortOrder: localizationState.keySortOrder.next(),
    );
  }

  changeValueSortOrder() {
    _processData(
      locale: localizationState.selectedLocale,
      valueSortOrder: localizationState.valueSortOrder.next(),
    );
  }

  _processData({
    String? locale,
    SortOrder keySortOrder = SortOrder.neutral,
    SortOrder valueSortOrder = SortOrder.neutral,
  }) async {
    if (mapLocales.isEmpty) {
      _updateState(LocalizationState());
      return;
    }
    final locales = mapLocales.keys.toList();
    final selectedLocale = locale ?? locales[0];
    final translations = _extractPairs(selectedLocale);
    if (keySortOrder != SortOrder.neutral) {
      _sortPairs(translations, keySortOrder, (input) => input.key);
    }
    if (valueSortOrder != SortOrder.neutral) {
      _sortPairs(translations, valueSortOrder, (input) => input.value);
    }
    _updateState(LocalizationState(
      selectedLocale: selectedLocale,
      translations: translations,
      locales: locales,
      keySortOrder: keySortOrder,
      valueSortOrder: valueSortOrder,
    ));
  }

  _sortPairs(
    List<TranslationPair> pairs,
    SortOrder order,
    _Extractor<TranslationPair, Comparable> extractor,
  ) {
    pairs.sort((left, right) {
      switch (order) {
        case SortOrder.neutral:
          return 0;
        case SortOrder.ascent:
          return extractor(left).compareTo(extractor(right));
        case SortOrder.descent:
          return extractor(right).compareTo(extractor(left));
      }
    });
  }

  List<TranslationPair> _extractPairs(String locale) {
    final entries = mapLocales[locale]?.entries;
    if (entries == null) {
      return [];
    }
    return entries
        .map((entry) => TranslationPair(entry.key, entry.value))
        .toList();
  }

  _updateState(LocalizationState newState) {
    _localizationState = newState;
    notifyListeners();
  }
}

typedef _Extractor<T, E> = Comparable<E> Function(T input);

class TranslationPair {
  final String key;
  final dynamic value;

  TranslationPair(this.key, this.value);
}

class LocalizationState {
  final String? selectedLocale;
  final List<TranslationPair> translations;
  final List<String> locales;
  final SortOrder keySortOrder;
  final SortOrder valueSortOrder;

  LocalizationState({
    this.selectedLocale,
    this.translations = const [],
    this.locales = const [],
    this.keySortOrder = SortOrder.neutral,
    this.valueSortOrder = SortOrder.neutral,
  });
}

enum SortOrder {
  neutral,
  ascent,
  descent;

  SortOrder next() {
    final nextIndex = (index + 1) % SortOrder.values.length;
    return SortOrder.values[nextIndex];
  }
}
