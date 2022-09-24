import 'package:flutter/material.dart';
import 'package:queen_slim/utils/index.dart';
import 'package:queen_slim/widgets/index.dart';

class QueenCardTitle extends StatelessWidget {
  final String title;
  final String subTitle;

  const QueenCardTitle({
    this.title = '',
    this.subTitle = '',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QueenTitle(
          text: title,
          color: Theme.of(context).queen().color.title,
        ),
        Padding(
          padding: EdgeInsets.only(top: Theme.of(context).queen().layout.padding / 4),
          child: QueenSubtitle(
            text: subTitle,
            color: Theme.of(context).queen().color.subTitle,
          ),
        ),
      ],
    );
  }
}
