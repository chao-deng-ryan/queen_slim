# queen_slim

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## 开发环境配置

1. 执行下面命令，激活代码检查工具
   `flutter pub global activate dart_code_metrics`
   参考：https://github.com/dart-code-checker/dart-code-metrics
2.

## json 序列化命令

1.  `flutter pub run build_runner build`

## 运行代码

1.  `flutter run --dart-define=ENVIRONMENT=development`
    `flutter run --dart-define=ENVIRONMENT=test`

## 打包 apk 命令

1.  `flutter build apk --split-per-abi --dart-define=ENVIRONMENT=development --target-platform=android-arm --obfuscate --split-debug-info=HLQ_Struggle`
    `flutter build apk --split-per-abi --dart-define=ENVIRONMENT=test --target-platform=android-arm --obfuscate --split-debug-info=HLQ_Struggle`
    `flutter build apk --split-per-abi --dart-define=ENVIRONMENT=prepub --target-platform=android-arm --obfuscate --split-debug-info=HLQ_Struggle`
    `flutter build apk --split-per-abi --dart-define=ENVIRONMENT=release --target-platform=android-arm --obfuscate --split-debug-info=HLQ_Struggle`
