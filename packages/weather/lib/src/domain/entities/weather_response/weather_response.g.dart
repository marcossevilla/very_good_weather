// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WeatherResponse _$_$_WeatherResponseFromJson(Map<String, dynamic> json) {
  return _$_WeatherResponse(
    title: json['title'] as String,
    locationType: _$enumDecode(_$LocationTypeEnumMap, json['locationType']),
    woeid: json['woeid'] as int,
    lattLong: json['lattLong'] as String,
  );
}

Map<String, dynamic> _$_$_WeatherResponseToJson(_$_WeatherResponse instance) =>
    <String, dynamic>{
      'title': instance.title,
      'locationType': _$LocationTypeEnumMap[instance.locationType],
      'woeid': instance.woeid,
      'lattLong': instance.lattLong,
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

const _$LocationTypeEnumMap = {
  LocationType.city: 'city',
};
