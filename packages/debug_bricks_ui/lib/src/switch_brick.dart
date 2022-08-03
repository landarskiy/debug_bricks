import 'package:flutter/material.dart';

/// Widget which can display title, subtitle, switch and handle switch change.
///
/// This widget based on [SwitchListTile] widget and just put right widgets
/// in a [SwitchListTile] slots.
///
/// All theming also based on [ListTileTheme].
/// To change any theme detail - modify [ListTileTheme] in your root theme.
class SwitchBrick extends StatelessWidget {
  const SwitchBrick({
    Key? key,
    this.title,
    this.subtitle,
    required this.value,
    this.changeListener,
  })  : _adaptive = false,
        super(key: key);

  const SwitchBrick.adaptive({
    Key? key,
    this.title,
    this.subtitle,
    required this.value,
    this.changeListener,
  })  : _adaptive = true,
        super(key: key);

  /// If adaptive, creates the brick with [SwitchListTile.adaptive].
  final bool _adaptive;

  /// Whether this checkbox is checked.
  final bool value;

  /// The text to display in a title.
  final String? title;

  /// The text to display in a subtitle.
  final String? subtitle;

  /// Called when the value of the checkbox should change.
  final ValueChanged<bool?>? changeListener;

  @override
  Widget build(BuildContext context) {
    return _buildWidget(context, title, subtitle, value);
  }

  Widget _buildWidget(
    BuildContext context,
    String? title,
    String? subtitle,
    bool value,
  ) {
    if (_adaptive) {
      return SwitchListTile.adaptive(
        title: title != null ? Text(title) : null,
        subtitle: subtitle != null ? Text(subtitle) : null,
        value: value,
        onChanged: changeListener,
      );
    } else {
      return SwitchListTile(
        title: title != null ? Text(title) : null,
        subtitle: subtitle != null ? Text(subtitle) : null,
        value: value,
        onChanged: changeListener,
      );
    }
  }
}
