enum Environment {
  development,
  test,
  prepub,
  release,
}

extension EnvironmentExtension on Environment {
  String get value {
    switch (this) {
      case Environment.development:
        return 'development';
      case Environment.test:
        return 'test';
      case Environment.prepub:
        return 'prepub';
      case Environment.release:
        return 'release';
    }
  }
}
