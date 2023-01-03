import 'package:flutter/material.dart';
import 'package:queen_slim/utils/index.dart';

class QueenCardBottom extends StatelessWidget {
  final String value;
  final String? unit;
  final Color? color;

  const QueenCardBottom({
    this.value = '',
    this.unit,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: value,
            style: TextStyle(
              color: color ?? Theme.of(context).queen().color.bottomText,
              fontSize: Theme.of(context).queen().layout.bottomValueFontSize,
            ),
          ),
          if (unit != null)
            TextSpan(
              text: unit,
              style: TextStyle(
                color: Theme.of(context).queen().color.bottomUnit,
                fontSize: Theme.of(context).queen().layout.bottomValueUnitFontSize,
              ),
            ),
        ],
      ),
    );
  }
}
