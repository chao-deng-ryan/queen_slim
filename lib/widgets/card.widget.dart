import 'package:flutter/material.dart';
import 'package:queen_slim/utils/index.dart';

class QueenCard extends StatelessWidget {
  final Widget? title;
  final Widget? content;
  final Widget? bottom;
  final String? backgroundColor;
  final BorderRadius? borderRadius;
  final double? maxWidth;
  final double? minWidth;
  final double? minHeight;
  final Function? onPress; //点击回调的方法，可选
  final Function? onLongPress; //长按回调的方法，可选

  const QueenCard({
    Key? key,
    this.title,
    this.content,
    this.bottom,
    this.onPress,
    this.onLongPress,
    this.backgroundColor,
    this.borderRadius,
    this.maxWidth,
    this.minWidth = 0,
    this.minHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //　常量定义
    // 边框圆角
    final BorderRadius cardBorderRadius = borderRadius ?? BorderRadius.circular(Theme.of(context).queen().layout.borderRadius);

    // return ConstrainedBox(
    //   constraints: BoxConstraints(minHeight: minHeight ?? 88, maxWidth: maxWidth!, minWidth: minWidth!),
    //   child: Card(
    //     elevation: 1,
    //     margin: EdgeInsets.all(Theme.of(context).queen().layout.margin / 2),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         if (title != null) title!,
    //         if (content != null) content!,
    //         if (bottom != null) bottom!,
    //       ],
    //     ),
    //   ),
    // );

    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: minHeight ?? 68, maxWidth: maxWidth!, minWidth: minWidth!),
      child: AnimatedPhysicalModel(
        duration: const Duration(seconds: 1),
        shadowColor: Theme.of(context).queen().color.backgroundColor,
        shape: BoxShape.rectangle,
        color: Theme.of(context).queen().color.backgroundColor,
        elevation: 4.5,
        borderRadius: cardBorderRadius,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: () {
            if (onPress is Function) {
              onPress!(); //点击回调
            }
          },
          onLongPress: () {
            if (onLongPress is Function) {
              onLongPress!(); //长按回调
            }
          },
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: borderRadius,
            ),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.centerStart,
              children: [
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (title != null) title!,
                    if (content != null) content!,
                    if (bottom != null) bottom!,
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
