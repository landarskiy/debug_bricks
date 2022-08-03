import 'package:flutter/material.dart';

/// Widget which can display title, subtitle, checkbox and handle check change.
///
/// This widget based on [CheckboxListTile] widget and just put right widgets
/// in a [CheckboxListTile] slots.
///
/// All theming also based on [ListTileTheme].
/// To change any theme detail - modify [ListTileTheme] in your root theme.
class CheckboxBrick extends StatelessWidget {
  const CheckboxBrick({
    Key? key,
    this.title,
    this.subtitle,
    required this.value,
    this.changeListener,
  }) : super(key: key);

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
    return CheckboxListTile(
      title: title != null ? Text(title) : null,
      subtitle: subtitle != null ? Text(subtitle) : null,
      value: value,
      onChanged: changeListener,
    );
  }
}
