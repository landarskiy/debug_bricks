Set of UI components that you can use for implementing debug screens.

## Getting started

Add to your `pubspec.yaml`:

```yaml
dependencies:
  debug_bricks_ui: <last_version>
```

## Components

### TextBrick

![TextBrick](docs/media/text_light.png)

![TextBrick](docs/media/text_dark.png)

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

### CheckboxBrick

![CheckboxBrick](docs/media/check_light.png)

![CheckboxBrick](docs/media/check_dark.png)

```dart
import 'package:debug_bricks_ui/debug_bricks_ui.dart';

class DebugScreen extends StatelessWidget {
  const DebugScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxBrick(
      title: 'CheckboxBrick',
      subtitle: 'Subtitle',
      value: true,
      changeListener: (value) => {},
    );
  }
}
```

### RadioBrick

![RadioBrick](docs/media/radio_light.png)

![RadioBrick](docs/media/radio_dark.png)

```dart
import 'package:debug_bricks_ui/debug_bricks_ui.dart';

class DebugScreen extends StatelessWidget {
  const DebugScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RadioBrick<String>(
      title: 'RadioBrick',
      subtitle: 'Subtitle',
      value: 'value',
      groupValue: 'value',
      changeListener: (value) {},
    );
  }
}
```

### SwitchBrick

![SwitchBrick](docs/media/switch_light.png)

![SwitchBrick](docs/media/switch_dark.png)

```dart
import 'package:debug_bricks_ui/debug_bricks_ui.dart';

class DebugScreen extends StatelessWidget {
  const DebugScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwitchBrick(
      title: 'SwitchBrick',
      subtitle: 'Subtitle',
      value: true,
      changeListener: (value) => {},
    );
  }
}
```

### SliderBrick

![SliderBrick](docs/media/slider_light.png)

![SliderBrick](docs/media/slider_dark.png)

```dart
import 'package:debug_bricks_ui/debug_bricks_ui.dart';

class DebugScreen extends StatelessWidget {
  const DebugScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = 50;
    return SliderBrick(
      title: 'SliderBrick',
      subtitle: 'Subtitle',
      iconData: Icons.trending_flat,
      minValue: 0,
      maxValue: 100,
      value: value,
      divisions: 10,
      label: value.toString(),
    );
  }
}
```

### ExpandableBrick

![ExpandableBrick](docs/media/expandable_light.png)

![ExpandableBrick](docs/media/expandable_dark.png)

```dart
import 'package:debug_bricks_ui/debug_bricks_ui.dart';

class DebugScreen extends StatelessWidget {
  const DebugScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandableBrick(
      title: 'ExpandableBrick',
      subtitle: 'Subtitle',
      children: _buildChildren(),
    );
  }

  List<Widget> _buildChildren() {
    // build items
  }
}
```