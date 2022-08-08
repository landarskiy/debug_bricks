import 'package:debug_bricks_device_info/debug_bricks_device_info.dart';
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
      title: 'Debug Bricks Device Info Demo',
      theme: lightThemeData,
      darkTheme: darkThemeData,
      themeMode: provider.themeMode,
      home: const DemoPage(title: 'Debug Bricks Device Info Demo'),
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

class DemoPage extends StatelessWidget {
  const DemoPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [_buildThemeButton(context)],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DeviceInfoBrick(),
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
}
