import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../location_response/location_response.dart' show LocationResponse;

part 'weather_response.g.dart';

@JsonSerializable()
class WeatherResponse extends Equatable {
  WeatherResponse({
    required this.consolidatedWeather,
    required this.time,
    required this.sunRise,
    required this.sunSet,
    required this.timezoneName,
    required this.parent,
    required this.sources,
    required this.title,
    required this.locationType,
    required this.woeid,
    required this.lattLong,
    required this.timezone,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);

  @JsonKey(name: 'consolidated_weather')
  final List<ConsolidatedWeather> consolidatedWeather;

  final DateTime time;

  @JsonKey(name: 'sun_rise')
  final DateTime sunRise;

  @JsonKey(name: 'sun_set')
  final DateTime sunSet;

  @JsonKey(name: 'timezone_name')
  final String timezoneName;

  final LocationResponse parent;

  final List<Source> sources;

  final String title;

  @JsonKey(name: 'location_type')
  final String locationType;

  final int woeid;

  @JsonKey(name: 'latt_long')
  final String lattLong;

  final String timezone;

  WeatherResponse copyWith({
    List<ConsolidatedWeather>? consolidatedWeather,
    DateTime? time,
    DateTime? sunRise,
    DateTime? sunSet,
    String? timezoneName,
    LocationResponse? parent,
    List<Source>? sources,
    String? title,
    String? locationType,
    int? woeid,
    String? lattLong,
    String? timezone,
  }) =>
      WeatherResponse(
        consolidatedWeather: consolidatedWeather ?? this.consolidatedWeather,
        time: time ?? this.time,
        sunRise: sunRise ?? this.sunRise,
        sunSet: sunSet ?? this.sunSet,
        timezoneName: timezoneName ?? this.timezoneName,
        parent: parent ?? this.parent,
        sources: sources ?? this.sources,
        title: title ?? this.title,
        locationType: locationType ?? this.locationType,
        woeid: woeid ?? this.woeid,
        lattLong: lattLong ?? this.lattLong,
        timezone: timezone ?? this.timezone,
      );

  @override
  List<Object> get props => [
        consolidatedWeather,
        time,
        sunRise,
        sunSet,
        timezoneName,
        parent,
        sources,
        title,
        locationType,
        woeid,
        lattLong,
        timezone,
      ];
}

@JsonSerializable()
class ConsolidatedWeather extends Equatable {
  ConsolidatedWeather({
    required this.id,
    required this.weatherStateName,
    required this.weatherStateAbbr,
    required this.windDirectionCompass,
    required this.created,
    required this.applicableDate,
    required this.minTemp,
    required this.maxTemp,
    required this.theTemp,
    required this.windSpeed,
    required this.windDirection,
    required this.airPressure,
    required this.humidity,
    required this.visibility,
    required this.predictability,
  });

  factory ConsolidatedWeather.fromJson(Map<String, dynamic> json) =>
      _$ConsolidatedWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$ConsolidatedWeatherToJson(this);

  final int id;

  @JsonKey(name: 'weather_state_name')
  final String weatherStateName;

  @JsonKey(name: 'weather_state_abbr')
  final String weatherStateAbbr;

  @JsonKey(name: 'wind_direction_compass')
  final String windDirectionCompass;
  final DateTime created;

  @JsonKey(name: 'applicable_date')
  final DateTime applicableDate;

  @JsonKey(name: 'min_temp')
  final double minTemp;

  @JsonKey(name: 'max_temp')
  final double maxTemp;

  @JsonKey(name: 'the_temp')
  final double theTemp;

  @JsonKey(name: 'wind_speed')
  final double windSpeed;

  @JsonKey(name: 'wind_direction')
  final double windDirection;

  @JsonKey(name: 'air_pressure')
  final double airPressure;

  final int humidity;

  final double visibility;

  final int predictability;

  ConsolidatedWeather copyWith({
    int? id,
    String? weatherStateName,
    String? weatherStateAbbr,
    String? windDirectionCompass,
    DateTime? created,
    DateTime? applicableDate,
    double? minTemp,
    double? maxTemp,
    double? theTemp,
    double? windSpeed,
    double? windDirection,
    double? airPressure,
    int? humidity,
    double? visibility,
    int? predictability,
  }) =>
      ConsolidatedWeather(
        id: id ?? this.id,
        weatherStateName: weatherStateName ?? this.weatherStateName,
        weatherStateAbbr: weatherStateAbbr ?? this.weatherStateAbbr,
        windDirectionCompass: windDirectionCompass ?? this.windDirectionCompass,
        created: created ?? this.created,
        applicableDate: applicableDate ?? this.applicableDate,
        minTemp: minTemp ?? this.minTemp,
        maxTemp: maxTemp ?? this.maxTemp,
        theTemp: theTemp ?? this.theTemp,
        windSpeed: windSpeed ?? this.windSpeed,
        windDirection: windDirection ?? this.windDirection,
        airPressure: airPressure ?? this.airPressure,
        humidity: humidity ?? this.humidity,
        visibility: visibility ?? this.visibility,
        predictability: predictability ?? this.predictability,
      );

  @override
  List<Object> get props => [
        id,
        weatherStateName,
        weatherStateAbbr,
        windDirectionCompass,
        created,
        applicableDate,
        minTemp,
        maxTemp,
        theTemp,
        windSpeed,
        windDirection,
        airPressure,
        humidity,
        visibility,
        predictability,
      ];
}

@JsonSerializable()
class Source extends Equatable {
  Source({
    required this.title,
    required this.slug,
    required this.url,
    required this.crawlRate,
  });

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);

  final String title;
  final String slug;
  final String url;

  @JsonKey(name: 'crawl_rate')
  final int crawlRate;

  Source copyWith({
    String? title,
    String? slug,
    String? url,
    int? crawlRate,
  }) =>
      Source(
        title: title ?? this.title,
        slug: slug ?? this.slug,
        url: url ?? this.url,
        crawlRate: crawlRate ?? this.crawlRate,
      );

  @override
  List<Object> get props => [
        title,
        slug,
        url,
        crawlRate,
      ];
}
