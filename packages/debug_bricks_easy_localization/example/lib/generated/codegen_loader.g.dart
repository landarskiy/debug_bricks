// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "app_name": "Debug brick Easy Localization example",
  "language": "Language",
  "theme_to_dark": "Switch to dark",
  "theme_to_light": "Switch to light",
  "localizations_title": "Keys",
  "localizations_table_column_key": "Key",
  "localizations_table_column_value": "Value"
};
static const Map<String,dynamic> ru = {
  "app_name": "Пример Debug brick Easy Localization",
  "language": "Язык",
  "theme_to_dark": "Переключиться на тёмную",
  "theme_to_light": "Переключиться на светлую",
  "localizations_title": "Ключи",
  "localizations_table_column_key": "Ключ",
  "localizations_table_column_value": "Значение"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ru": ru};
}
