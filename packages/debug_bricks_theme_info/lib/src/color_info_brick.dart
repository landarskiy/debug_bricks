import 'package:debug_bricks_theme_info/src/color_extension.dart';
import 'package:flutter/material.dart';

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
    return SizedBox(
      height: 64,
      child: Container(
        color: colorInfo.color,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                colorInfo.name,
                style: style,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  colorInfo.color.format(adaptiveHexColorFormatter),
                  style: style,
                ),
              ),
            ],
          ),
        ),
      ),
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
