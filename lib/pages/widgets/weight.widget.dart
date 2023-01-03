import 'package:flutter/material.dart';
import 'package:queen_slim/utils/index.dart';
import 'package:queen_slim/widgets/index.dart';
import 'package:queen_slim/pages/widgets/index.dart';

class QueenWeight extends StatelessWidget {
  final String title;
  final double width;
  final Widget? bottom;

  const QueenWeight({
    this.title = '',
    this.bottom,
    this.width = 0.0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String dateFormatString = DateUtil.todayFormatWithSlashSeparator();

    return QueenCard(
      maxWidth: width,
      minWidth: width,
      padding: Theme.of(context).queen().layout.weightCardPadding,
      title: QueenCardTitle(
        title: title,
        subTitle: dateFormatString,
      ),
      bottom: Visibility(
        visible: bottom != null,
        // ignore: sort_child_properties_last
        child: Container(
          padding: EdgeInsets.only(
            top: Theme.of(context).queen().layout.padding / 2,
          ),
          child: bottom,
        ),
        replacement: Container(),
      ),
    );
  }
}
