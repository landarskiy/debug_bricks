import 'package:debug_bricks_theme_info/src/color_info_brick.dart';
import 'package:debug_bricks_theme_info/src/rounded_label.dart';
import 'package:flutter/material.dart';

class ThemeColorGroupInfoBrick extends StatelessWidget {
  final String groupName;
  final ColorInfo colorInfo;
  final ColorInfo onColorInfo;
  final ColorInfo colorInfoContainer;
  final ColorInfo onColorInfoContainer;

  const ThemeColorGroupInfoBrick({
    Key? key,
    required this.groupName,
    required this.colorInfo,
    required this.onColorInfo,
    required this.colorInfoContainer,
    required this.onColorInfoContainer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final style = textTheme.titleSmall?.copyWith(color: colorInfo.textColor);
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.topStart,
          child: Padding(
            padding: const EdgeInsets.only(left: 4, top: 12, bottom: 4),
            child: RoundedLabel(
              text: groupName,
              textStyle: style,
              bgColor: colorInfo.color,
            ),
          ),
        ),
        Row(
          children: [
            ExpandedColorInfoBrick(
              colorInfo: colorInfo,
            ),
            ExpandedColorInfoBrick(
              colorInfo: onColorInfo,
            ),
          ],
        ),
        Row(
          children: [
            ExpandedColorInfoBrick(
              colorInfo: colorInfoContainer,
            ),
            ExpandedColorInfoBrick(
              colorInfo: onColorInfoContainer,
            ),
          ],
        )
      ],
    );
  }
}

class PrimaryThemeColorGroupInfoBrick extends StatelessWidget {
  const PrimaryThemeColorGroupInfoBrick({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ThemeColorGroupInfoBrick(
      groupName: 'Primary',
      colorInfo: ColorInfo(
        'Primary',
        colorScheme.primary,
        colorScheme.onPrimary,
      ),
      onColorInfo: ColorInfo(
        'On Primary',
        colorScheme.onPrimary,
        colorScheme.primary,
      ),
      colorInfoContainer: ColorInfo(
        'Primary Container',
        colorScheme.primaryContainer,
        colorScheme.onPrimaryContainer,
      ),
      onColorInfoContainer: ColorInfo(
        'On Primary Container',
        colorScheme.onPrimaryContainer,
        colorScheme.primaryContainer,
      ),
    );
  }
}

class SecondaryThemeColorGroupInfoBrick extends StatelessWidget {
  const SecondaryThemeColorGroupInfoBrick({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ThemeColorGroupInfoBrick(
      groupName: 'Secondary',
      colorInfo: ColorInfo(
        'Secondary',
        colorScheme.secondary,
        colorScheme.onSecondary,
      ),
      onColorInfo: ColorInfo(
        'On Secondary',
        colorScheme.onSecondary,
        colorScheme.secondary,
      ),
      colorInfoContainer: ColorInfo(
        'Secondary Container',
        colorScheme.secondaryContainer,
        colorScheme.onSecondaryContainer,
      ),
      onColorInfoContainer: ColorInfo(
        'On Secondary Container',
        colorScheme.onSecondaryContainer,
        colorScheme.secondaryContainer,
      ),
    );
  }
}

class TertiaryThemeColorGroupInfoBrick extends StatelessWidget {
  const TertiaryThemeColorGroupInfoBrick({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ThemeColorGroupInfoBrick(
      groupName: 'Tertiary',
      colorInfo: ColorInfo(
        'Tertiary',
        colorScheme.tertiary,
        colorScheme.onTertiary,
      ),
      onColorInfo: ColorInfo(
        'On Tertiary',
        colorScheme.onTertiary,
        colorScheme.tertiary,
      ),
      colorInfoContainer: ColorInfo(
        'Tertiary Container',
        colorScheme.tertiaryContainer,
        colorScheme.onTertiaryContainer,
      ),
      onColorInfoContainer: ColorInfo(
        'On Tertiary Container',
        colorScheme.onTertiaryContainer,
        colorScheme.tertiaryContainer,
      ),
    );
  }
}

class ErrorThemeColorGroupInfoBrick extends StatelessWidget {
  const ErrorThemeColorGroupInfoBrick({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ThemeColorGroupInfoBrick(
      groupName: 'Error',
      colorInfo: ColorInfo(
        'Error',
        colorScheme.error,
        colorScheme.onError,
      ),
      onColorInfo: ColorInfo(
        'On Error',
        colorScheme.onError,
        colorScheme.error,
      ),
      colorInfoContainer: ColorInfo(
        'Error Container',
        colorScheme.errorContainer,
        colorScheme.onErrorContainer,
      ),
      onColorInfoContainer: ColorInfo(
        'On Error Container',
        colorScheme.onErrorContainer,
        colorScheme.errorContainer,
      ),
    );
  }
}

class NeutralThemeColorGroupInfoBrick extends StatelessWidget {
  const NeutralThemeColorGroupInfoBrick({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ThemeColorGroupInfoBrick(
      groupName: 'Neutral',
      colorInfo: ColorInfo(
        'Background',
        colorScheme.background,
        colorScheme.onBackground,
      ),
      onColorInfo: ColorInfo(
        'On Background',
        colorScheme.onBackground,
        colorScheme.background,
      ),
      colorInfoContainer: ColorInfo(
        'Surface',
        colorScheme.surface,
        colorScheme.onSurface,
      ),
      onColorInfoContainer: ColorInfo(
        'On Surface',
        colorScheme.onSurface,
        colorScheme.surface,
      ),
    );
  }
}

class NeutralVariantThemeColorGroupInfoBrick extends StatelessWidget {
  const NeutralVariantThemeColorGroupInfoBrick({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ThemeColorGroupInfoBrick(
      groupName: 'Neutral Variant',
      colorInfo: ColorInfo(
        'Surface Variant',
        colorScheme.surfaceVariant,
        colorScheme.onSurfaceVariant,
      ),
      onColorInfo: ColorInfo(
        'On Surface Variant',
        colorScheme.onSurfaceVariant,
        colorScheme.surfaceVariant,
      ),
      colorInfoContainer: ColorInfo(
        'Outline',
        colorScheme.outline,
        colorScheme.surface,
      ),
      onColorInfoContainer: ColorInfo(
        'Outline',
        colorScheme.outline,
        colorScheme.surface,
      ),
    );
  }
}
