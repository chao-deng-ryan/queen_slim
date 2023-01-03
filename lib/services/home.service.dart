// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:queen_slim/models/home.dart';
import 'package:queen_slim/services/index.dart';

class HomeService extends GetxService {
  // 常量
  static const STORAGE_KEY_HOME = 'home';

  final StorageService _storageService = Get.find<StorageService>();
  final Rx<Home> _home = Home().obs;

  Home get home => _home.value;

  set home(Home value) {
    _home.value = value;
  }

  Future<HomeService> initialize() async {
    final homeFromStorage = _storageService.findByKey<Home>(STORAGE_KEY_HOME);
    if (homeFromStorage != null) {
      // 本地有缓存时，从localStorage取出
      _home.value = homeFromStorage;
    } else {
      // 本地没有缓存时，开发阶段暂时先默认一个值
      _home.value = Home(components: []);
    }
    return this;
  }
}
