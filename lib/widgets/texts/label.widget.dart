import 'package:queen_slim/i18n/index.dart';
import 'index.dart';
import 'package:flutter/material.dart';

class QueenLabel extends StatelessWidget {
  const QueenLabel({
    Key? key,
    this.text,
    this.i18n,
    this.color,
    this.overflow,
    this.isLineThrough = false,
    this.isBold = false,
  })  : assert(text != null || i18n != null),
        super(key: key);

  final String? text;
  final I18N? i18n;
  final Color? color;
  final TextOverflow? overflow;
  final bool isLineThrough;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.bodyText1!;
    if (color != null) {
      textStyle = textStyle.copyWith(
        color: color,
        decoration: isLineThrough ? TextDecoration.lineThrough : TextDecoration.none,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      );
    }

    return i18n != null
        ? QueenI18NText(key: key, i18n: i18n!, style: textStyle)
        : Text(
            text!,
            key: key,
            style: textStyle,
            overflow: overflow,
          );
  }
}
