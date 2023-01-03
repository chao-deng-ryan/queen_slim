import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queen_slim/pages/widgets/index.dart';
import 'package:queen_slim/services/index.dart';
import 'package:queen_slim/widgets/index.dart';
import 'package:queen_slim/utils/index.dart';

class Home extends StatelessWidget {
  final WeightService _weightService = Get.find<WeightService>();

  Home({Key? key}) : super(key: key);

  Widget createNoteComponent() {
    final BuildContext context = Get.context!;
    return InkWell(
      onTap: () => {
        // 跳转到须知页面
        Get.toNamed('/note'),
      },
      child: Container(
        padding: EdgeInsets.only(
          top: Theme.of(context).queen().layout.padding / 2,
          bottom: Theme.of(context).queen().layout.padding / 2,
          left: Theme.of(context).queen().layout.padding,
          right: Theme.of(context).queen().layout.padding,
        ),
        decoration: BoxDecoration(
          color: Colors.orange.shade100,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            QueenDescription(
              text: 'common.page.home.notes'.tr,
            ),
            Icon(
              Icons.arrow_forward,
              size: Theme.of(context).queen().layout.iconSize,
            ),
          ],
        ),
      ),
    );
  }

  Widget createCompareWeightBottomComponent(double current, double previous) {
    final BuildContext context = Get.context!;
    final weightDiff = current - previous;
    late Color color;
    late IconData? icon;
    late String text = weightDiff.abs().toString();
    if (weightDiff > 0) {
      // 体重较之前上升，显示红色
      color = Colors.red;
      icon = Icons.arrow_upward;
    } else if (weightDiff < 0) {
      // 体重较之前下降，显示绿色
      color = Colors.green;
      icon = Icons.arrow_downward;
    } else {
      // 体重较之前保持不变，显示绿色，不显示icon
      color = Colors.green;
      text = '保持不变';
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        QueenCardBottom(
          value: text,
          color: color,
          unit: weightDiff == 0 ? null : 'common.widget.weight.unit'.tr,
        ),
        Visibility(
          visible: icon != null,
          child: Icon(
            icon,
            size: Theme.of(context).queen().layout.bottomValueFontSize,
            color: color,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double weightWidth = (screenWidth - Theme.of(context).queen().layout.padding * 2 - Theme.of(context).queen().layout.spacing * 2) / 2;

    return QueenBasePage(
      title: 'common.page.title'.tr,
      resizeToAvoidBottomInset: true,
      preferredHeight: Theme.of(context).queen().layout.homePreferredHeight,
      fixedTop: createNoteComponent(),
      main: Container(
        padding: EdgeInsets.only(
          top: Theme.of(context).queen().layout.padding / 2,
          left: Theme.of(context).queen().layout.padding,
          right: Theme.of(context).queen().layout.padding,
        ),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Obx(
            () => Wrap(
              runSpacing: Theme.of(context).queen().layout.spacing * 2,
              spacing: Theme.of(context).queen().layout.spacing * 2,
              children: [
                QueenWeight(
                  title: 'common.widget.weight.management'.tr,
                  width: weightWidth,
                  bottom: QueenCardBottom(
                    value: _weightService.weightOfToday.weight.toString(),
                    unit: 'common.widget.weight.unit'.tr,
                  ),
                ),
                QueenWeight(
                  title: 'common.widget.weight.today'.tr,
                  width: weightWidth,
                  bottom: QueenCardBottom(
                    value: (55.0).toString(),
                    unit: 'common.widget.weight.unit'.tr,
                  ),
                ),
                QueenWeight(
                  title: 'common.widget.weight.comparedToYesterday'.tr,
                  width: weightWidth,
                  bottom: createCompareWeightBottomComponent(_weightService.weightOfToday.weight, _weightService.weightOfYesterday.weight),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
