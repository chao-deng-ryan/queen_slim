import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:queen_slim/i18n/index.dart';

class QueenI18NText extends StatelessWidget {
  const QueenI18NText({
    required this.i18n,
    Key? key,
    this.style,
    this.overflow,
  }) : super(key: key);
  final I18N i18n;
  final TextStyle? style;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      i18n.translate() ?? '',
      key: key,
      style: style,
      overflow: overflow,
    );
  }
}
