// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationResponse _$LocationResponseFromJson(Map<String, dynamic> json) =>
    LocationResponse(
      woeid: json['woeid'] as int,
      title: json['title'] as String,
      lattLong: json['latt_long'] as String,
      locationType:
          $enumDecodeNullable(_$LocationTypeEnumMap, json['locationType']) ??
              LocationType.city,
    );

Map<String, dynamic> _$LocationResponseToJson(LocationResponse instance) =>
    <String, dynamic>{
      'woeid': instance.woeid,
      'title': instance.title,
      'latt_long': instance.lattLong,
      'locationType': _$LocationTypeEnumMap[instance.locationType],
    };

const _$LocationTypeEnumMap = {
  LocationType.city: 'city',
};
