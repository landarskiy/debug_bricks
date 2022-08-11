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

![TextBrick](https://github.com/touchlane/debug_bricks/tree/master/packages/debug_bricks_easy_localization/doc/media/language_control_light.png)

![TextBrick](https://github.com/touchlane/debug_bricks/tree/master/packages/debug_bricks_easy_localization/doc/media/language_control_dark.png)

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

## Customization

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
