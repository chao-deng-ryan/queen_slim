import 'dart:ffi';

enum DescriptionType {
  text,
  newLine,
}

extension DescriptionTypeExtension on DescriptionType {
  String get value {
    switch (this) {
      case DescriptionType.text:
        return 'text';
      case DescriptionType.newLine:
        return 'newLine';
    }
  }
}
