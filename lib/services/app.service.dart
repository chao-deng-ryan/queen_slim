import 'package:get/get.dart';
import 'package:queen_slim/config.dart';
import 'package:queen_slim/environment/environment.enum.dart';
import 'package:queen_slim/services/http.service.dart';
import 'package:queen_slim/services/log.service.dart';
import 'package:queen_slim/services/storage.service.dart';

class AppService extends GetxService {
  // 初始化app
  Future<AppService> initialize() async {
    // 1. 先注册缓存和环境的service, 用于获取当前环境, 以初始化config
    await Get.putAsync(() => StorageService().initialize());

    // 2.2 根据当前环境,初始化config
    await Config.initialize(Environment.test);

    // 3. 完成各个service的注册
    await Get.putAsync(() => LogService().initialize());

    // 3.1 注册与环境url相关的service, 根据config使用相应的环境url
    final HttpService httpService = await Get.putAsync(() => HttpService().initialize(Config.instance.baseUrl));

    await httpService.setBaseUrl(Config.instance.baseUrl);

    // 3.2 根据config,判断是否使用mockService
    // if (Config.instance.isMock) {
    //   mockUtilHttpService();
    //   mockAuthenticationHttpService();
    //   mockQueenSlimHttpService();
    // }

    return this;
  }
}
