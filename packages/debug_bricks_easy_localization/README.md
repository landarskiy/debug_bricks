UI component which displays information about the current locale and provides the possibility 
to change it.

## Dependencies

This package use [easy_localization](https://pub.dev/packages/easy_localization) package as a
localization framework. To use this debug brick is required to set up and use easy_localization. 

## Getting started

Add to your `pubspec.yaml`:

```yaml
dependencies:
  debug_bricks_easy_localization: <last_version>
```

## Usage

### EasyLocalizationBrick

![TextBrick](https://github.com/touchlane/debug_bricks/raw/master/packages/debug_bricks_easy_localization/doc/media/language_control_light.png)

![TextBrick](https://github.com/touchlane/debug_bricks/raw/master/packages/debug_bricks_easy_localization/doc/media/language_control_dark.png)

```dart
import 'package:debug_bricks_easy_localization/debug_bricks_easy_localization.dart';

class DebugScreen extends StatelessWidget {
  const DebugScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyLocalizationBrick(
      title: 'Language',
    );
  }
}
```

#### Customization

You can customize output by pass custom `localeAdapter` instance in `EasyLocalizationBrick`
instantiation.

```dart
class CustomLocaleAdapter {
  const CustomLocaleAdapter();

  String convert(Locale locale) {
    //format locale here
  }
}
```

### LocalizationsTable

![LocalizationsTable](https://github.com/touchlane/debug_bricks/raw/master/packages/debug_bricks_easy_localization/doc/media/language_keys.png)

```dart
import 'package:debug_bricks_easy_localization/debug_bricks_easy_localization.dart';

class DebugScreen extends StatelessWidget {
  const DebugScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocalizationsTable(
        mapLocales: CodegenLoader.mapLocales,
    );
  }
}
```

#### Customization

You can customize UI translations by pass custom `ResourcesProvider` class into
`LocalizationsTable` constructor by `resourcesProvider` argument.

```dart
class AppResourcesProvider extends ResourcesProvider {
  @override
  String get titleKey => LocaleKeys.localizations_table_column_key.tr();

  @override
  String get titleValue => LocaleKeys.localizations_table_column_value.tr();
}
```