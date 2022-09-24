import 'package:json_annotation/json_annotation.dart';

part 'weight.g.dart';

@JsonSerializable(explicitToJson: true)
class Weight {
  String date;
  double weight;

  Weight({
    this.date = '',
    this.weight = 0.0,
  });

  factory Weight.fromJson(Map<String, dynamic> srcJson) => _$WeightFromJson(srcJson);
  Map<String, dynamic> toJson() => _$WeightToJson(this);
}
