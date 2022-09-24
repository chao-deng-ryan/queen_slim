import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queen_slim/utils/index.dart';
import 'package:queen_slim/widgets/index.dart';
import 'package:queen_slim/pages/widgets/index.dart';

class QueenWeight extends StatelessWidget {
  final double weight;
  final double width;

  const QueenWeight({
    this.weight = 0.0,
    this.width = 0.0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String subTitle = DateUtil.todayFormatWithSlashSeparator();

    return QueenCard(
      maxWidth: width,
      minWidth: width,
      title: Container(
        margin: EdgeInsets.only(
          top: Theme.of(context).queen().layout.margin / 2,
          left: Theme.of(context).queen().layout.margin / 2,
          bottom: Theme.of(context).queen().layout.margin / 2,
        ),
        child: QueenCardTitle(
          title: 'common.widget.weight.title'.tr,
          subTitle: subTitle,
        ),
      ),
      bottom: Container(
        margin: EdgeInsets.only(
          top: Theme.of(context).queen().layout.margin / 2,
          left: Theme.of(context).queen().layout.margin / 8,
          bottom: Theme.of(context).queen().layout.margin / 2,
        ),
        child: QueenCardBottom(
          value: weight,
          unit: 'common.widget.weight.unit'.tr,
        ),
      ),
    );
  }
}
