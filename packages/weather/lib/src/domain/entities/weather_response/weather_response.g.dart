// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherResponse _$WeatherResponseFromJson(Map<String, dynamic> json) {
  return WeatherResponse(
    consolidatedWeather: (json['consolidatedWeather'] as List<dynamic>?)
        ?.map((e) => ConsolidatedWeather.fromJson(e as Map<String, dynamic>))
        .toList(),
    time: json['time'] == null ? null : DateTime.parse(json['time'] as String),
    sunRise: json['sunRise'] == null
        ? null
        : DateTime.parse(json['sunRise'] as String),
    sunSet: json['sunSet'] == null
        ? null
        : DateTime.parse(json['sunSet'] as String),
    timezoneName: json['timezoneName'] as String?,
    parent: json['parent'] == null
        ? null
        : Parent.fromJson(json['parent'] as Map<String, dynamic>),
    sources: (json['sources'] as List<dynamic>?)
        ?.map((e) => Source.fromJson(e as Map<String, dynamic>))
        .toList(),
    title: json['title'] as String?,
    locationType: json['locationType'] as String?,
    woeid: json['woeid'] as int?,
    lattLong: json['lattLong'] as String?,
    timezone: json['timezone'] as String?,
  );
}

Map<String, dynamic> _$WeatherResponseToJson(WeatherResponse instance) =>
    <String, dynamic>{
      'consolidatedWeather': instance.consolidatedWeather,
      'time': instance.time?.toIso8601String(),
      'sunRise': instance.sunRise?.toIso8601String(),
      'sunSet': instance.sunSet?.toIso8601String(),
      'timezoneName': instance.timezoneName,
      'parent': instance.parent,
      'sources': instance.sources,
      'title': instance.title,
      'locationType': instance.locationType,
      'woeid': instance.woeid,
      'lattLong': instance.lattLong,
      'timezone': instance.timezone,
    };

ConsolidatedWeather _$ConsolidatedWeatherFromJson(Map<String, dynamic> json) {
  return ConsolidatedWeather(
    id: json['id'] as int?,
    weatherStateName: json['weatherStateName'] as String?,
    weatherStateAbbr: json['weatherStateAbbr'] as String?,
    windDirectionCompass: json['windDirectionCompass'] as String?,
    created: json['created'] == null
        ? null
        : DateTime.parse(json['created'] as String),
    applicableDate: json['applicableDate'] == null
        ? null
        : DateTime.parse(json['applicableDate'] as String),
    minTemp: (json['minTemp'] as num?)?.toDouble(),
    maxTemp: (json['maxTemp'] as num?)?.toDouble(),
    theTemp: (json['theTemp'] as num?)?.toDouble(),
    windSpeed: (json['windSpeed'] as num?)?.toDouble(),
    windDirection: (json['windDirection'] as num?)?.toDouble(),
    airPressure: (json['airPressure'] as num?)?.toDouble(),
    humidity: json['humidity'] as int?,
    visibility: (json['visibility'] as num?)?.toDouble(),
    predictability: json['predictability'] as int?,
  );
}

Map<String, dynamic> _$ConsolidatedWeatherToJson(
        ConsolidatedWeather instance) =>
    <String, dynamic>{
      'id': instance.id,
      'weatherStateName': instance.weatherStateName,
      'weatherStateAbbr': instance.weatherStateAbbr,
      'windDirectionCompass': instance.windDirectionCompass,
      'created': instance.created?.toIso8601String(),
      'applicableDate': instance.applicableDate?.toIso8601String(),
      'minTemp': instance.minTemp,
      'maxTemp': instance.maxTemp,
      'theTemp': instance.theTemp,
      'windSpeed': instance.windSpeed,
      'windDirection': instance.windDirection,
      'airPressure': instance.airPressure,
      'humidity': instance.humidity,
      'visibility': instance.visibility,
      'predictability': instance.predictability,
    };

Parent _$ParentFromJson(Map<String, dynamic> json) {
  return Parent(
    title: json['title'] as String?,
    locationType: json['locationType'] as String?,
    woeid: json['woeid'] as int?,
    lattLong: json['lattLong'] as String?,
  );
}

Map<String, dynamic> _$ParentToJson(Parent instance) => <String, dynamic>{
      'title': instance.title,
      'locationType': instance.locationType,
      'woeid': instance.woeid,
      'lattLong': instance.lattLong,
    };

Source _$SourceFromJson(Map<String, dynamic> json) {
  return Source(
    title: json['title'] as String?,
    slug: json['slug'] as String?,
    url: json['url'] as String?,
    crawlRate: json['crawlRate'] as int?,
  );
}

Map<String, dynamic> _$SourceToJson(Source instance) => <String, dynamic>{
      'title': instance.title,
      'slug': instance.slug,
      'url': instance.url,
      'crawlRate': instance.crawlRate,
    };
