import 'package:debug_bricks_theme_info/src/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColorInfoBrick extends StatelessWidget {
  final ColorInfo colorInfo;

  const ColorInfoBrick({
    Key? key,
    required this.colorInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final style = textTheme.bodyMedium?.copyWith(color: colorInfo.textColor);
    final hexColor = colorInfo.color.format(adaptiveHexColorFormatter);
    return InkWell(
      child: SizedBox(
        height: 64,
        child: Container(
          color: colorInfo.color,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(colorInfo.name, style: style),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(hexColor, style: style),
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        Clipboard.setData(ClipboardData(text: hexColor));
      },
    );
  }
}

class ExpandedColorInfoBrick extends StatelessWidget {
  final ColorInfo colorInfo;

  const ExpandedColorInfoBrick({
    Key? key,
    required this.colorInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: ColorInfoBrick(colorInfo: colorInfo),
    );
  }
}

class ColorInfo {
  final String name;
  final Color color;
  final Color textColor;

  ColorInfo(this.name, this.color, this.textColor);
}
