import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queen_slim/i18n/i18n.dart';
import 'package:queen_slim/i18n/queen_slim_translations.dart';
import 'package:queen_slim/pages/index.page.dart';
import 'package:queen_slim/services/app.service.dart';
import 'package:queen_slim/services/log.service.dart';
import 'package:queen_slim/themes.dart';

Future<void> queenApp() async {
  Get.isLogEnable = false;
  // 初始化app
  // 1. 判断缓存中环境是否需要初始化, 需要时才初始化
  // 2. 按照环境对config进行初始化
  // 3. 根据config, 完成各个service的注册
  await Get.putAsync(() => AppService().initialize());

  const initialRoute = '/';

  runApp(GetMaterialApp(
    initialBinding: BindingsBuilder(
      () => {
        // 感觉没有必要用
      },
    ),
    translations: QueenSlimTranslations(),
    locale: Get.deviceLocale,
    fallbackLocale: SupportedLocale.zh,
    themeMode: ThemeMode.light,
    theme: lightTheme,
    darkTheme: darkTheme,
    defaultTransition: Transition.fade,
    debugShowCheckedModeBanner: false,
    // transitionDuration: const Duration(seconds: 3),
    getPages: [
      GetPage(
        name: "/",
        transition: Transition.fade,
        page: () => const Index(),
      ),
    ],
    initialRoute: initialRoute,
    routingCallback: (Routing? routing) {
      if (routing is Routing) {
        final LogService logService = Get.find<LogService>();
        logService.d(routing.route);
      }
    },
    unknownRoute: GetPage(name: '/404', page: () => const Text('Not Found')),
  ));
}
