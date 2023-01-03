// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Home _$HomeFromJson(Map<String, dynamic> json) => Home(
      components: (json['components'] as List<dynamic>?)
              ?.map((e) => Component.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Component>[],
    );

Map<String, dynamic> _$HomeToJson(Home instance) => <String, dynamic>{
      'components': instance.components?.map((e) => e.toJson()).toList(),
    };

Component _$ComponentFromJson(Map<String, dynamic> json) => Component(
      title: json['title'] as String? ?? '',
      subtitle: json['subtitle'] as String? ?? '',
    );

Map<String, dynamic> _$ComponentToJson(Component instance) => <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
    };

Description _$DescriptionFromJson(Map<String, dynamic> json) => Description(
      description: json['description'] as String? ?? '',
      color: json['color'] as String? ?? '',
      type: _$enumDecodeNullable(_$DescriptionTypeEnumMap, json['type']) ??
          DescriptionType.text,
    );

Map<String, dynamic> _$DescriptionToJson(Description instance) =>
    <String, dynamic>{
      'description': instance.description,
      'color': instance.color,
      'type': _$DescriptionTypeEnumMap[instance.type],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$DescriptionTypeEnumMap = {
  DescriptionType.text: 'text',
  DescriptionType.newLine: 'newLine',
};
