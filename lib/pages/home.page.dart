import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queen_slim/pages/widgets/index.dart';
import 'package:queen_slim/services/index.dart';
import 'package:queen_slim/widgets/index.dart';
import 'package:queen_slim/utils/index.dart';

class Home extends StatelessWidget {
  final WeightService _weightService = Get.find<WeightService>();

  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double weightWidth = screenWidth / 2 - Theme.of(context).queen().layout.margin;

    return QueenBasePage(
      title: 'common.page.title'.tr,
      resizeToAvoidBottomInset: true,
      main: Container(
        margin: EdgeInsets.all(Theme.of(context).queen().layout.margin / 2),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Obx(
            () => Wrap(
              alignment: WrapAlignment.spaceAround,
              runSpacing: Theme.of(context).queen().layout.spacing,
              spacing: Theme.of(context).queen().layout.spacing,
              children: [
                QueenWeight(
                  weight: _weightService.weightOfToday.weight,
                  width: weightWidth,
                ),
                QueenWeight(
                  weight: 55,
                  width: weightWidth,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
