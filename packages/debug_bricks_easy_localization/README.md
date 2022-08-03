UI component which displays information about the current locale and provides the possibility 
to change it.

## Getting started

Add to your `pubspec.yaml`:

```yaml
dependencies:
  debug_bricks_easy_localization: <last_version>
```

## Usage

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