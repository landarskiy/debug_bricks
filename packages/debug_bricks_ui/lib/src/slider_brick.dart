import 'package:flutter/material.dart';

typedef SliderLabelAdapter = String Function(double value);

/// Widget which can display title, subtitle, slider and handle
/// slider changing.
///
/// This widget based on [ListTile] widget and just put right widgets in
/// a [ListTile] slots.
/// [Slider] inserted into[ListTile.subtitle] position.
///
/// All theming also based on [ListTileTheme].
/// To change any theme detail - modify [ListTileTheme] in your root theme.
class SliderBrick extends StatelessWidget {
  const SliderBrick({
    Key? key,
    this.title,
    this.subtitle,
    this.iconData,
    this.changeListener,
    this.value = 0,
    this.minValue = 0,
    this.maxValue = 100,
    this.divisions,
    this.label,
  }) : super(key: key);

  /// The text to display in a title.
  final String? title;

  /// The text to display in a subtitle.
  final String? subtitle;

  /// The icon to display.
  ///
  /// The icon can be null, in which case the widget will fit data to entire
  /// available space.
  final IconData? iconData;

  /// Called during a drag when the user is selecting a new value for the slider
  /// by dragging.
  ///
  /// The slider passes the new value to the callback but does not actually
  /// change state until the parent widget rebuilds the slider with the new
  /// value.
  final ValueChanged<double>? changeListener;

  /// Initial selected value for slider.
  final double value;

  /// The minimum value the user can select.
  ///
  /// Defaults to 0.0. Must be less than or equal to [maxValue].
  ///
  /// If the [maxValue] is equal to the [minValue], then the slider is disabled.
  final double minValue;

  /// The maximum value the user can select.
  ///
  /// Defaults to 100.0. Must be greater than or equal to [minValue].
  ///
  /// If the [maxValue] is equal to the [minValue], then the slider is disabled.
  final double maxValue;

  /// The number of discrete divisions.
  final int? divisions;

  /// A label to show above the slider when the slider is active.
  final String? label;

  @override
  Widget build(BuildContext context) {
    return _buildWidget(context, title, subtitle, iconData);
  }

  Widget _buildWidget(
    BuildContext context,
    String? title,
    String? subtitle,
    IconData? iconData,
  ) {
    return ListTile(
      title: title != null ? Text(title) : null,
      subtitle: Column(children: [
        if (subtitle != null) Text(subtitle),
        Slider(
          min: minValue,
          max: maxValue,
          value: value,
          divisions: divisions,
          onChanged: changeListener,
          label: label,
        )
      ]),
      minLeadingWidth: 0,
      leading: iconData != null
          ? Icon(
              iconData,
              size: 24,
            )
          : null,
    );
  }
}
