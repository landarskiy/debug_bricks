import 'package:flutter/material.dart';

class TableItem extends StatelessWidget {
  final String valueKey;
  final String value;

  const TableItem({
    Key? key,
    required this.valueKey,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            valueKey,
            style: textTheme.bodyMedium,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            value,
            style: textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
