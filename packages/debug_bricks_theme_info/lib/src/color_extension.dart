import 'package:flutter/material.dart';

const HexColorFormatter adaptiveHexColorFormatter = HexColorFormatter();

extension IntExtension on int {
  String hexString() {
    return toRadixString(16).padLeft(2, '0').toUpperCase();
  }
}

extension ColorExtension on Color {
  String format(ColorFormatter formatter) {
    return formatter.format(this);
  }
}

abstract class ColorFormatter {
  const ColorFormatter();

  String format(Color color);
}

class HexColorFormatter extends ColorFormatter {
  final HexColorFormatterMode mode;

  const HexColorFormatter({this.mode = HexColorFormatterMode.adaptive});

  @override
  String format(Color color) {
    final a = color.alpha.hexString();
    final r = color.red.hexString();
    final g = color.green.hexString();
    final b = color.blue.hexString();
    var formatted = '$r$g$b';
    if (mode == HexColorFormatterMode.argb ||
        mode == HexColorFormatterMode.adaptive && color.alpha < 255) {
      formatted = '$a$formatted';
    }
    return '#$formatted';
  }
}

enum HexColorFormatterMode { adaptive, rgb, argb }
