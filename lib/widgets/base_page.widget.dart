import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:queen_slim/widgets/index.dart';
import 'package:queen_slim/utils/index.dart';

class BaseController extends GetxController {
  Rx<ThemeMode> theme = ThemeMode.light.obs;
}

class QueenBasePage extends StatelessWidget {
  final String? title;
  final bool? resizeToAvoidBottomInset;
  final bool? showChangeThemeButton;
  final List<Widget>? appbarActions;
  final Widget? appbarLeading;
  final Widget? fixedTop;
  final Widget? top;
  final Widget? main;
  final Widget? bottom;
  final Widget? fixedBottom;
  final Widget? floatingActionButton;
  final WillPopCallback? onWillPop;
  final OnLoadMore? onLoadMore;
  final OnRefresh? onRefresh;
  final Function()? onTitlePressed;

  const QueenBasePage({
    Key? key,
    this.title,
    this.appbarLeading,
    this.appbarActions,
    this.resizeToAvoidBottomInset = false,
    this.showChangeThemeButton = true,
    this.fixedTop,
    this.top,
    required this.main,
    this.bottom,
    this.fixedBottom,
    this.floatingActionButton,
    this.onWillPop,
    this.onLoadMore,
    this.onRefresh,
    this.onTitlePressed,
  }) : super(key: key);

  void setTitle(BuildContext context) {
    SystemChrome.setApplicationSwitcherDescription(
      ApplicationSwitcherDescription(
        label: title?.tr,
        primaryColor: Theme.of(context).queen().color.title.value,
      ),
    );
  }

  PreferredSizeWidget createAppBarComponent(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight + 30),
      child: Column(
        children: [
          GFAppBar(
            backgroundColor: Theme.of(context).backgroundColor,
            leading: () {
              if (appbarLeading != null) {
                return appbarLeading;
              } else {
                if (Get.key.currentState!.canPop()) {
                  return BackButton(
                    color: Theme.of(context).textTheme.button!.color,
                  );
                }
              }
            }(),
            automaticallyImplyLeading: false,
            title: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              alignment: Alignment.center,
              height: kToolbarHeight,
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: () {
                  if (onTitlePressed != null) {
                    onTitlePressed!();
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    title ?? '',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ),
            ),
            centerTitle: true,
            actions: appbarActions,
            elevation: 0,
          ),
          if (fixedTop != null) fixedTop!,
        ],
      ),
    );
  }

  Widget createPullToRefreshBodyComponent() {
    return SafeArea(
      child: PullToRefresh(
        onLoadMore: onLoadMore,
        onRefresh: onRefresh,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            if (top != null) top!,
            if (main != null)
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  // ignore: avoid_print
                  print('画面大小发生改变, 重新渲染...');
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: main,
                  );
                },
              ),
            if (bottom != null) bottom!,
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    setTitle(context);

    return WillPopScope(
      onWillPop: () {
        return onWillPop != null ? onWillPop!() : Future<bool>.value(true);
      },
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.bodyText1!,
        child: Scaffold(
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          appBar: createAppBarComponent(context),
          bottomSheet: SafeArea(
            // ignore: todo
            // TODO: 这里如果不设置高度会导致body无法显示，所以暂时先放一个0高度的框占位。
            child: fixedBottom ?? Container(height: 0.0),
          ),
          body: createPullToRefreshBodyComponent(),
        ),
      ),
    );
  }
}
