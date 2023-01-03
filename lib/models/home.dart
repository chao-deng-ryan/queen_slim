import 'package:json_annotation/json_annotation.dart';
import 'package:queen_slim/enums/index.dart';

part 'home.g.dart';

@JsonSerializable(explicitToJson: true)
class Home {
  List<Component>? components;

  Home({
    this.components = const <Component>[],
  });

  factory Home.fromJson(Map<String, dynamic> srcJson) => _$HomeFromJson(srcJson);
  Map<String, dynamic> toJson() => _$HomeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Component {
  String title;
  String? subtitle;

  Component({
    this.title = '',
    this.subtitle = '',
  });

  factory Component.fromJson(Map<String, dynamic> srcJson) => _$ComponentFromJson(srcJson);
  Map<String, dynamic> toJson() => _$ComponentToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Description {
  String description;
  String? color;
  DescriptionType type = DescriptionType.text;

  Description({
    this.description = '',
    this.color = '',
    this.type = DescriptionType.text,
  });

  factory Description.fromJson(Map<String, dynamic> srcJson) => _$DescriptionFromJson(srcJson);
  Map<String, dynamic> toJson() => _$DescriptionToJson(this);
}
