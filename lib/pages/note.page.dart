import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queen_slim/widgets/index.dart';

class Note extends StatelessWidget {
  const Note({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QueenBasePage(
      title: 'common.page.home.notes'.tr,
      resizeToAvoidBottomInset: true,
      main: Image.asset('assets/images/note.jpg'),
    );
  }
}
