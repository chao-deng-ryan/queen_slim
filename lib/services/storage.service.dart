import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:queen_slim/models/weight.dart';

class StorageService extends GetxService {
  // 常量定义key
  static const String weightsKey = 'WEIGHT';

  final _localStorage = GetStorage();

  Future<StorageService> initialize() async {
    await GetStorage.init();
    return this;
  }

  List<Weight> get weights {
    if (_localStorage.read<List<Map<String, dynamic>>>(weightsKey) != null) {
      final weightMapsFromStorage = _localStorage.read<List<Map<String, dynamic>>>(weightsKey)!;
      final weightObjects = weightMapsFromStorage.map((weightJson) => Weight.fromJson(weightJson));
      return weightObjects.toList();
    } else {
      return [];
    }
  }

  set weights(List<Weight> weights) {
    _localStorage.write(weightsKey, weights.map((e) => e.toJson()));
  }
}
