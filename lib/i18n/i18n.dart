import 'dart:ui';
import 'package:get/get.dart';

class I18N {
  final String key;
  final Map<String, String> params;

  I18N(this.key, {this.params = const {}});

  String? translate() {
    return key.trParams(params);
  }
}

// ignore: avoid_classes_with_only_static_members
class SupportedLocale {
  static Locale get zh => const Locale('zh');
}
