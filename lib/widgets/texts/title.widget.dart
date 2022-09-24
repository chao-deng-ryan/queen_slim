import 'package:queen_slim/i18n/index.dart';
import 'package:queen_slim/utils/index.dart';
import 'index.dart';
import 'package:flutter/material.dart';

class QueenTitle extends StatelessWidget {
  const QueenTitle({
    Key? key,
    this.text,
    this.i18n,
    this.color,
    this.isLineThrough = false,
    this.isBold = false,
    this.fontSize,
  })  : assert(text != null || i18n != null),
        super(key: key);

  final String? text;
  final I18N? i18n;
  final Color? color;
  final bool isLineThrough;
  final bool isBold;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline6!;
    if (color != null) {
      textStyle = textStyle.copyWith(
        color: color,
        decoration: isLineThrough ? TextDecoration.lineThrough : TextDecoration.none,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        fontSize: fontSize ?? Theme.of(context).queen().layout.titleFontSize,
      );
    }

    return i18n != null ? QueenI18NText(key: key, i18n: i18n!, style: textStyle) : Text(text!, key: key, style: textStyle);
  }
}
