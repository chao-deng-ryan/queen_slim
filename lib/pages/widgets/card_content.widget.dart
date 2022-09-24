import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queen_slim/utils/index.dart';
import 'package:queen_slim/widgets/index.dart';

class QueenCardContent extends StatelessWidget {
  final num weight;

  const QueenCardContent({
    this.weight = 0,
    Key? key,
  }) : super(key: key);

  Widget createTitle() {
    final BuildContext context = Get.context!;
    return Padding(
      padding: EdgeInsets.all(Theme.of(context).queen().layout.padding / 2),
      child: Center(
        child: QueenSubtitle(
          text: 'common.widget.weight.title'.tr,
          color: Theme.of(context).queen().color.text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return QueenCard(
      title: createTitle(),
    );
  }
}
