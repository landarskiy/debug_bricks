import 'package:debug_bricks_easy_localization/debug_bricks_easy_localization.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:example/generated/locale_keys.g.dart';
import 'package:example/theme/app_theme.dart';
import 'package:example/theme/theme_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'generated/codegen_loader.g.dart';

const langEn = Locale('en');
const langRu = Locale('ru');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [langEn, langRu],
      path: 'assets/translations',
      saveLocale: false,
      useOnlyLangCode: true,
      assetLoader: const CodegenLoader(),
      fallbackLocale: langEn,
      child: const DemoApp(),
    ),
  );
}

class DemoApp extends StatelessWidget {
  const DemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeConsumer = Consumer<ThemeModeProvider>(
      builder: (context, themeProvider, _) {
        return _buildApp(context, themeProvider);
      },
    );
    return _buildRootProviders(themeConsumer);
  }

  Widget _buildApp(BuildContext context, ThemeModeProvider provider) {
    return MaterialApp(
      title: LocaleKeys.app_name.tr(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: lightThemeData,
      darkTheme: darkThemeData,
      themeMode: provider.themeMode,
      home: DemoPage(locale: context.locale),
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
  const DemoPage({Key? key, required this.locale}) : super(key: key);

  final Locale locale;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.app_name.tr()),
        actions: [_buildThemeButton(context)],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            EasyLocalizationBrick(
              title: LocaleKeys.language.tr(),
            ),
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
        tooltip: LocaleKeys.theme_to_dark.tr(),
        onPressed: () {
          themeProvider.themeMode = ThemeMode.dark;
        },
      );
    } else {
      return IconButton(
        icon: const Icon(Icons.light_mode),
        tooltip: LocaleKeys.theme_to_light.tr(),
        onPressed: () {
          themeProvider.themeMode = ThemeMode.light;
        },
      );
    }
  }
}
