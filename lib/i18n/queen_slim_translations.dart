import 'package:get/get.dart';

class QueenSlimTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'zh': {
          "common.environment.development": "开发",
          "common.environment.test": "测试",
          "common.environment.prepub": "预发布",
          "common.environment.release": "正式",
          "service.httpService.requestErrorMessage": "服务器连接失败。未知错误。",

          // common
          "common.exception.http.request": "http请求异常。",

          // refresh
          "common.refresh.refreshText": "下拉即可刷新",
          "common.refresh.refreshReadyText": "释放刷新",
          "common.refresh.refreshingText": "加载中...",
          "common.refresh.refreshedText": "刷新成功",

          // page
          "common.page.title": "皇后与瘦子",
          "common.page.home.notes": "新手须知",

          // widget
          "common.widget.weight.management": "体重管理",
          "common.widget.weight.today": "今日体重",
          "common.widget.weight.comparedToYesterday": "较昨日",
          "common.widget.weight.healthIndex": "健康指数",
          "common.widget.weight.up": "增加",
          "common.widget.weight.down": "下降",
          "common.widget.weight.unit": "公斤",
        },
      };
}
