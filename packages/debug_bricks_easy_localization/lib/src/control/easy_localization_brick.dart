import 'package:debug_bricks_ui/debug_bricks_ui.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// Widget which allows change app language.
/// This widget based on easy_localization package.
class EasyLocalizationBrick extends StatelessWidget {
  const EasyLocalizationBrick({
    Key? key,
    this.title = 'Language',
    this.localeAdapter = const LocaleAdapter(),
  }) : super(key: key);

  final String title;
  final LocaleAdapter localeAdapter;

  @override
  Widget build(BuildContext context) {
    final locale = context.locale;
    final radioLocales = context.supportedLocales
        .map((e) => RadioBrick<Locale>(
              title: e.languageCode,
              subtitle: e.countryCode,
              value: e,
              groupValue: locale,
              changeListener: (newLocale) => {
                if (newLocale != null) {context.setLocale(newLocale)}
              },
            ))
        .toList();
    return ExpandableBrick(
      title: title,
      subtitle: localeAdapter.convert(locale),
      children: radioLocales,
    );
  }
}

class LocaleAdapter {
  const LocaleAdapter();

  String convert(Locale locale) {
    String info = locale.languageCode;
    if (locale.countryCode != null) {
      info += '-${locale.countryCode}';
    }
    return info;
  }
}
