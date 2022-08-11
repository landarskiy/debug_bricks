Set of UI components that you can use for implementing debug screens.

Almost all library components (except SliderBrick) are just ListTile wrappers. That means that 
fof component theming you should follow ListTile theming instructions.

## Getting started

Add to your `pubspec.yaml`:

```yaml
dependencies:
  debug_bricks_ui: <last_version>
```

## Components

### TextBrick

![TextBrick](https://github.com/touchlane/debug_bricks/raw/master/packages/debug_bricks_ui/doc/media/text_light.png)

![TextBrick](https://github.com/touchlane/debug_bricks/raw/master/packages/debug_bricks_ui/doc/media/text_dark.png)

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

![CheckboxBrick](https://github.com/touchlane/debug_bricks/raw/master/packages/debug_bricks_ui/doc/media/check_light.png)

![CheckboxBrick](https://github.com/touchlane/debug_bricks/raw/master/packages/debug_bricks_ui/doc/media/check_dark.png)

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

![RadioBrick](https://github.com/touchlane/debug_bricks/raw/master/packages/debug_bricks_ui/doc/media/radio_light.png)

![RadioBrick](https://github.com/touchlane/debug_bricks/raw/master/packages/debug_bricks_ui/doc/media/radio_dark.png)

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

![SwitchBrick](https://github.com/touchlane/debug_bricks/raw/master/packages/debug_bricks_ui/doc/media/switch_light.png)

![SwitchBrick](https://github.com/touchlane/debug_bricks/raw/master/packages/debug_bricks_ui/doc/media/switch_dark.png)

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

![SliderBrick](https://github.com/touchlane/debug_bricks/raw/master/packages/debug_bricks_ui/doc/media/slider_light.png)

![SliderBrick](https://github.com/touchlane/debug_bricks/raw/master/packages/debug_bricks_ui/doc/media/slider_dark.png)

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

![ExpandableBrick](https://github.com/touchlane/debug_bricks/raw/master/packages/debug_bricks_ui/doc/media/expandable_light.png)

![ExpandableBrick](https://github.com/touchlane/debug_bricks/raw/master/packages/debug_bricks_ui/doc/media/expandable_dark.png)

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