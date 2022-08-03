import 'package:flutter/material.dart';

/// Widget which can display title, subtitle, action and info icons and
/// handle taps.
///
/// This widget based on [ListTile] widget and just put right widgets in
/// a [ListTile] slots.
///
/// All theming also based on [ListTileTheme].
/// To change any theme detail - modify [ListTileTheme] in your root theme.
class TextBrick extends StatelessWidget {
  const TextBrick({
    Key? key,
    this.title,
    this.subtitle,
    this.infoIconData,
    this.actionIconData,
    this.onTap,
  }) : super(key: key);

  /// The text to display in a title.
  final String? title;

  /// The text to display in a subtitle.
  final String? subtitle;

  /// The info icon to display.
  ///
  /// Displayed on the leading place.
  /// The icon can be null, in which case the widget will fit data to entire
  /// available space.
  final IconData? infoIconData;

  /// The action icon to display.
  ///
  /// Displayed on the trailing place.
  /// The icon can be null, in which case the widget will fit data to entire
  /// available space.
  final IconData? actionIconData;

  /// Callback to handle taps on entire widget.
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return _buildWidget(
      context,
      title,
      subtitle,
      infoIconData,
      actionIconData,
    );
  }

  Widget _buildWidget(
    BuildContext context,
    String? title,
    String? subtitle,
    IconData? infoIconData,
    IconData? actionIconData,
  ) {
    return ListTile(
      title: title != null ? Text(title) : null,
      subtitle: subtitle != null ? Text(subtitle) : null,
      minLeadingWidth: 0,
      leading: infoIconData != null
          ? Icon(
              infoIconData,
              size: 24,
            )
          : null,
      trailing: actionIconData != null
          ? Icon(
              actionIconData,
              size: 24,
            )
          : null,
      onTap: onTap,
    );
  }
}
