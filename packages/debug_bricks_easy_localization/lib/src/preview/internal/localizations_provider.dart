import 'package:flutter/foundation.dart';

/// Provider that controls representation state.
class LocalizationsProvider extends ChangeNotifier {
  final Map<String, Map<String, dynamic>> mapLocales;
  LocalizationState _localizationState = LocalizationState();

  LocalizationState get localizationState => _localizationState;

  LocalizationsProvider(this.mapLocales) {
    _processData();
  }

  /// Trigger changing locale in [LocalizationState]
  Future<void> changeLocale(String? locale) {
    return _processData(
      locale: locale,
      keySortOrder: localizationState.keySortOrder,
      valueSortOrder: localizationState.valueSortOrder,
    );
  }

  /// Trigger changing sort order in [LocalizationState.translations]
  /// by [TranslationPair.key] value.
  /// See [SortOrder.next] to understand which value will be next.
  Future<void> changeKeySortOrder() {
    return _processData(
      locale: localizationState.selectedLocale,
      keySortOrder: localizationState.keySortOrder.next(),
    );
  }

  /// Trigger changing sort order in [LocalizationState.translations]
  /// by [TranslationPair.value] value.
  /// See [SortOrder.next] to understand which value will be next.
  Future<void> changeValueSortOrder() {
    return _processData(
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

/// Translation pair
class TranslationPair {
  final String key;
  final dynamic value;

  TranslationPair(this.key, this.value);

  @override
  String toString() {
    return 'TranslationPair{key: $key, value: $value}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TranslationPair &&
          runtimeType == other.runtimeType &&
          key == other.key &&
          value == other.value;

  @override
  int get hashCode => key.hashCode ^ value.hashCode;
}

/// Localization UI state
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

  @override
  String toString() {
    return 'LocalizationState{selectedLocale: $selectedLocale, translations: $translations, locales: $locales, keySortOrder: $keySortOrder, valueSortOrder: $valueSortOrder}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalizationState &&
          runtimeType == other.runtimeType &&
          selectedLocale == other.selectedLocale &&
          listEquals(translations, other.translations) &&
          listEquals(locales, other.locales) &&
          keySortOrder == other.keySortOrder &&
          valueSortOrder == other.valueSortOrder;

  @override
  int get hashCode =>
      selectedLocale.hashCode ^
      translations.hashCode ^
      locales.hashCode ^
      keySortOrder.hashCode ^
      valueSortOrder.hashCode;
}

/// Sort order
enum SortOrder {
  neutral,
  ascent,
  descent;

  /// Return next value in declaration order
  SortOrder next() {
    final nextIndex = (index + 1) % SortOrder.values.length;
    return SortOrder.values[nextIndex];
  }
}
