UI components which displays information about the current Material 3 theme.

## Getting started

Add to your `pubspec.yaml`:

```yaml
dependencies:
  debug_bricks_theme_info: <last_version>
```

## Usage

![ThemeColorInfoBrick](https://github.com/touchlane/debug_bricks/raw/master/packages/debug_bricks_theme_info/doc/media/theme_color_info.png)

```dart
import 'package:debug_bricks_theme_info/debug_bricks_theme_info.dart';

class DebugScreen extends StatelessWidget {
  const DebugScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ThemeColorInfoBrick(),
    );
  }
}
```