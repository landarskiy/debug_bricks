import 'package:debug_bricks_ui/debug_bricks_ui.dart';
import 'package:example/app_theme.dart';
import 'package:example/theme_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const DemoApp());
}

class DemoApp extends StatelessWidget {
  const DemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeConsumer = Consumer<ThemeModeProvider>(
      builder: (context, themeProvider, _) {
        return _buildApp(themeProvider);
      },
    );
    return _buildRootProviders(themeConsumer);
  }

  Widget _buildApp(ThemeModeProvider provider) {
    return MaterialApp(
      title: 'Debug Bricks UI Demo',
      theme: lightThemeData,
      darkTheme: darkThemeData,
      themeMode: provider.themeMode,
      home: const DemoPage(title: 'Debug Bricks UI Demo'),
    );
  }

  Widget _buildRootProviders(Widget child) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeModeProvider>(
          create: (_) => ThemeModeProvider(),
        ),
      ],
      child: child,
    );
  }
}

class DemoPage extends StatefulWidget {
  const DemoPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  bool _switchState = true;
  bool _checkboxState = true;
  String _radioState = 'Value A';
  double _sliderState = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [_buildThemeButton(context)],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ..._buildItems(),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeButton(BuildContext context) {
    final themeProvider = Provider.of<ThemeModeProvider>(context);
    final brightness = themeProvider.getBrightness(context);
    if (brightness == Brightness.light) {
      return IconButton(
        icon: const Icon(Icons.dark_mode),
        tooltip: 'Switch to dark',
        onPressed: () {
          themeProvider.themeMode = ThemeMode.dark;
        },
      );
    } else {
      return IconButton(
        icon: const Icon(Icons.light_mode),
        tooltip: 'Switch to light',
        onPressed: () {
          themeProvider.themeMode = ThemeMode.light;
        },
      );
    }
  }

  List<Widget> _buildItems() {
    return <Widget>[
      TextBrick(
        title: 'TextBrick',
        subtitle: 'Subtitle',
        infoIconData: Icons.info,
        actionIconData: Icons.arrow_forward_ios,
        onTap: () {},
      ),
      const Divider(height: 1),
      SwitchBrick(
        title: 'SwitchBrick',
        subtitle: 'Subtitle',
        value: _switchState,
        changeListener: (value) {
          setState(() {
            _switchState = value ?? false;
          });
        },
      ),
      const Divider(height: 1),
      CheckboxBrick(
        title: 'CheckboxBrick',
        subtitle: 'Subtitle',
        value: _checkboxState,
        changeListener: (value) {
          setState(() {
            _checkboxState = value ?? false;
          });
        },
      ),
      const Divider(height: 1),
      RadioBrick<String>(
        title: 'RadioBrick',
        subtitle: 'Subtitle',
        value: 'v',
        groupValue: 'v',
        changeListener: (value) {},
      ),
      const Divider(height: 1),
      ExpandableBrick(
        title: 'ExpandableBrick',
        subtitle: 'Subtitle',
        children: [
          RadioBrick<String>(
            title: 'RadioBrick',
            subtitle: 'Value A',
            value: 'Value A',
            groupValue: _radioState,
            changeListener: (value) {
              setState(() {
                _radioState = 'Value A';
              });
            },
          ),
          RadioBrick<String>(
            title: 'RadioBrick',
            subtitle: 'Value B',
            value: 'Value B',
            groupValue: _radioState,
            changeListener: (value) {
              setState(() {
                _radioState = 'Value B';
              });
            },
          ),
        ],
      ),
      const Divider(height: 1),
      SliderBrick(
        title: 'SliderBrick',
        subtitle: 'Subtitle',
        iconData: Icons.trending_flat,
        minValue: 0,
        maxValue: 100,
        value: _sliderState,
        divisions: 10,
        changeListener: (value) {
          setState(() {
            _sliderState = value;
          });
        },
        label: _sliderState.round().toString(),
      ),
    ];
  }
}
