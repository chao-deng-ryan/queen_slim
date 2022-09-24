// ignore: todo
// TODO: 升级到nullsafe版本
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef OnLoadMore = Future<void> Function({
  EasyRefreshController controller,
});

typedef OnRefresh = Future<void> Function({
  EasyRefreshController controller,
});

class PullToRefreshState extends State<PullToRefresh> {
  PullToRefreshState(this.onLoadMore, this.onRefresh, this.child);

  final OnLoadMore? onLoadMore;
  final OnRefresh? onRefresh;
  final Widget? child;
  late EasyRefreshController _controller;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh.custom(
      enableControlFinishRefresh: true,
      enableControlFinishLoad: true,
      controller: _controller,
      topBouncing: false,
      bottomBouncing: false,
      header: onRefresh != null
          ? ClassicalHeader(
              refreshText: 'common.refresh.refreshText'.tr,
              refreshReadyText: 'common.refresh.refreshReadyText'.tr,
              refreshingText: 'common.refresh.refreshingText'.tr,
              refreshedText: 'common.refresh.refreshedText'.tr,
              showInfo: false,
            )
          : null,
      footer: onLoadMore != null ? ClassicalFooter() : null,
      onRefresh: onRefresh != null ? () => onRefresh!(controller: _controller) : null,
      onLoad: onLoadMore != null ? () => onLoadMore!(controller: _controller) : null,
      slivers: [
        SliverToBoxAdapter(
          child: child,
        ),
      ],
    );
  }
}

class PullToRefresh extends StatefulWidget {
  const PullToRefresh({
    Key? key,
    this.onLoadMore,
    this.onRefresh,
    required this.child,
  }) : super(key: key);
  final Widget child;
  final OnLoadMore? onLoadMore;
  final OnRefresh? onRefresh;

  @override
  PullToRefreshState createState() {
    // ignore: no_logic_in_create_state
    return PullToRefreshState(onLoadMore, onRefresh, child);
  }
}
