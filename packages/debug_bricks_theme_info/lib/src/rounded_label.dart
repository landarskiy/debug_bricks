import 'package:flutter/material.dart';

class RoundedLabel extends StatelessWidget {
  final String text;
  final Color bgColor;
  final TextStyle? textStyle;

  const RoundedLabel({
    Key? key,
    required this.text,
    required this.bgColor,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.all(Radius.circular(32)),
        color: bgColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(text, style: textStyle),
      ),
    );
  }
}
