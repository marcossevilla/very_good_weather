// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherResponse _$WeatherResponseFromJson(Map<String, dynamic> json) =>
    WeatherResponse(
      consolidatedWeather: (json['consolidated_weather'] as List<dynamic>)
          .map((e) => ConsolidatedWeather.fromJson(e as Map<String, dynamic>))
          .toList(),
      time: DateTime.parse(json['time'] as String),
      sunRise: DateTime.parse(json['sun_rise'] as String),
      sunSet: DateTime.parse(json['sun_set'] as String),
      timezoneName: json['timezone_name'] as String,
      parent: LocationResponse.fromJson(json['parent'] as Map<String, dynamic>),
      sources: (json['sources'] as List<dynamic>)
          .map((e) => Source.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String,
      locationType: json['location_type'] as String,
      woeid: json['woeid'] as int,
      lattLong: json['latt_long'] as String,
      timezone: json['timezone'] as String,
    );

Map<String, dynamic> _$WeatherResponseToJson(WeatherResponse instance) =>
    <String, dynamic>{
      'consolidated_weather': instance.consolidatedWeather,
      'time': instance.time.toIso8601String(),
      'sun_rise': instance.sunRise.toIso8601String(),
      'sun_set': instance.sunSet.toIso8601String(),
      'timezone_name': instance.timezoneName,
      'parent': instance.parent,
      'sources': instance.sources,
      'title': instance.title,
      'location_type': instance.locationType,
      'woeid': instance.woeid,
      'latt_long': instance.lattLong,
      'timezone': instance.timezone,
    };
