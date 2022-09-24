import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queen_slim/widget/base_page.widget.dart';
import 'package:queen_slim/utils/theme.util.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QueenBasePage(
      title: 'common.page.title'.tr,
      resizeToAvoidBottomInset: true,
      main: Container(
        padding: EdgeInsets.all(Theme.of(context).queen().layout.padding),
        child: const Text('内容'),
      ),
    );
  }
}
