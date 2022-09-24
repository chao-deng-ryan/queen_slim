import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queen_slim/utils/index.dart';
import 'package:queen_slim/widgets/index.dart';

class QueenCardBottom extends StatelessWidget {
  final double value;
  final String unit;

  const QueenCardBottom({
    this.value = 0.0,
    this.unit = '',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: value.toString(),
            style: TextStyle(
              color: Theme.of(context).queen().color.bottomText,
              fontSize: Theme.of(context).queen().layout.bottomValueFontSize,
            ),
          ),
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
