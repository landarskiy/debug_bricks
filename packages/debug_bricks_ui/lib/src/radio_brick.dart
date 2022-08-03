import 'package:flutter/material.dart';

/// Widget which can display title, subtitle, radio button and handle check.
///
/// This widget based on [RadioListTile] widget and just put right widgets
/// in a [RadioListTile] slots.
///
/// All theming also based on [ListTileTheme].
/// To change any theme detail - modify [ListTileTheme] in your root theme.
class RadioBrick<T> extends StatelessWidget {
  const RadioBrick({
    Key? key,
    this.title,
    this.subtitle,
    required this.value,
    required this.groupValue,
    this.changeListener,
  }) : super(key: key);

  /// The value represented by this radio button.
  final T value;

  /// The currently selected value for this group of radio buttons.
  final T groupValue;

  /// The text to display in a title.
  final String? title;

  /// The text to display in a subtitle.
  final String? subtitle;

  /// Called when the user selects this radio button.
  final ValueChanged<T?>? changeListener;

  @override
  Widget build(BuildContext context) {
    return _buildWidget(context, title, subtitle);
  }

  Widget _buildWidget(
    BuildContext context,
    String? title,
    String? subtitle,
  ) {
    return RadioListTile(
      title: title != null ? Text(title) : null,
      subtitle: subtitle != null ? Text(subtitle) : null,
      value: value,
      groupValue: groupValue,
      onChanged: changeListener,
    );
  }
}
