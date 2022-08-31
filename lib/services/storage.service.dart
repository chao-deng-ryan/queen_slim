import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  // 常量定义key
  static const String environmentKey = "ENVIRONMENT";

  Future<StorageService> initialize() async {
    await GetStorage.init();
    return this;
  }
}
