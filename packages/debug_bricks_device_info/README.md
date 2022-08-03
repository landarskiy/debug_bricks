Set of UI components that you can use for implementing debug screens.

## Getting started

Add to your `pubspec.yaml`:

```yaml
dependencies:
  debug_bricks_device_info: <last_version>
```


## Usage

```dart
import 'package:debug_bricks_ui/debug_bricks_ui.dart';

class DebugScreen extends StatelessWidget {
  const DebugScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextBrick(
      infoIconData: Icons.devices,
      actionIconData: Icons.copy,
      title: 'TextBrick',
      subtitle: 'Subtitle',
      onTap: () {},
    );
  }
}
```