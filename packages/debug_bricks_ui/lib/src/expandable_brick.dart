import 'package:flutter/material.dart';

/// Widget which can display title, subtitle and expandable child elements.
///
/// This widget based on [ExpansionTile] widget and just put right widgets
/// in a [ExpansionTile] slots.
///
/// All theming also based on [ExpansionTileTheme].
/// To change any theme detail - modify [ExpansionTileTheme] in your root theme.
class ExpandableBrick extends StatelessWidget {
  const ExpandableBrick({
    Key? key,
    this.title,
    this.subtitle,
    this.initiallyExpanded = false,
    this.children = const [],
  }) : super(key: key);

  /// The text to display in a title.
  final String? title;

  /// The text to display in a subtitle.
  final String? subtitle;

  /// The widgets that are displayed when the tile expands.
  final List<Widget> children;

  /// Specifies if the list tile is initially expanded (true) or
  /// collapsed (false, the default).
  final bool initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    return _buildWidget(context, title, subtitle, children);
  }

  Widget _buildWidget(
    BuildContext context,
    String? title,
    String? subtitle,
    List<Widget> children,
  ) {
    return ExpansionTile(
      title: title != null ? Text(title) : const Text(''),
      subtitle: subtitle != null ? Text(subtitle) : null,
      initiallyExpanded: initiallyExpanded,
      children: children,
    );
  }
}
