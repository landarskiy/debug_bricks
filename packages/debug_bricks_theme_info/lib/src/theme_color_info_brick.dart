import 'package:debug_bricks_theme_info/src/theme_color_group_info_brick.dart';
import 'package:flutter/material.dart';

class ThemeColorInfoBrick extends StatelessWidget {
  const ThemeColorInfoBrick({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        PrimaryThemeColorGroupInfoBrick(),
        SecondaryThemeColorGroupInfoBrick(),
        TertiaryThemeColorGroupInfoBrick(),
        ErrorThemeColorGroupInfoBrick(),
        NeutralThemeColorGroupInfoBrick(),
        NeutralVariantThemeColorGroupInfoBrick(),
      ],
    );
  }
}
