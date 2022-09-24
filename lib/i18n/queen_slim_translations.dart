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

          // widget
          "common.widget.weight.title": "体重管理",
          "common.widget.weight.unit": "公斤",
        },
      };
}
