import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_response.g.dart';

@JsonSerializable()
class WeatherResponse extends Equatable {
  WeatherResponse({
    this.consolidatedWeather,
    this.time,
    this.sunRise,
    this.sunSet,
    this.timezoneName,
    this.parent,
    this.sources,
    this.title,
    this.locationType,
    this.woeid,
    this.lattLong,
    this.timezone,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);

  final List<ConsolidatedWeather>? consolidatedWeather;
  final DateTime? time;
  final DateTime? sunRise;
  final DateTime? sunSet;
  final String? timezoneName;
  final Parent? parent;
  final List<Source>? sources;
  final String? title;
  final String? locationType;
  final int? woeid;
  final String? lattLong;
  final String? timezone;

  WeatherResponse copyWith({
    List<ConsolidatedWeather>? consolidatedWeather,
    DateTime? time,
    DateTime? sunRise,
    DateTime? sunSet,
    String? timezoneName,
    Parent? parent,
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
  List<Object?> get props => [
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
    this.id,
    this.weatherStateName,
    this.weatherStateAbbr,
    this.windDirectionCompass,
    this.created,
    this.applicableDate,
    this.minTemp,
    this.maxTemp,
    this.theTemp,
    this.windSpeed,
    this.windDirection,
    this.airPressure,
    this.humidity,
    this.visibility,
    this.predictability,
  });

  factory ConsolidatedWeather.fromJson(Map<String, dynamic> json) =>
      _$ConsolidatedWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$ConsolidatedWeatherToJson(this);

  final int? id;
  final String? weatherStateName;
  final String? weatherStateAbbr;
  final String? windDirectionCompass;
  final DateTime? created;
  final DateTime? applicableDate;
  final double? minTemp;
  final double? maxTemp;
  final double? theTemp;
  final double? windSpeed;
  final double? windDirection;
  final double? airPressure;
  final int? humidity;
  final double? visibility;
  final int? predictability;

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
  List<Object?> get props => [
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
class Parent extends Equatable {
  Parent({
    this.title,
    this.locationType,
    this.woeid,
    this.lattLong,
  });

  factory Parent.fromJson(Map<String, dynamic> json) => _$ParentFromJson(json);

  Map<String, dynamic> toJson() => _$ParentToJson(this);

  final String? title;
  final String? locationType;
  final int? woeid;
  final String? lattLong;

  Parent copyWith({
    String? title,
    String? locationType,
    int? woeid,
    String? lattLong,
  }) =>
      Parent(
        title: title ?? this.title,
        locationType: locationType ?? this.locationType,
        woeid: woeid ?? this.woeid,
        lattLong: lattLong ?? this.lattLong,
      );

  @override
  List<Object?> get props => [
        title,
        locationType,
        woeid,
        lattLong,
      ];
}

@JsonSerializable()
class Source extends Equatable {
  Source({
    this.title,
    this.slug,
    this.url,
    this.crawlRate,
  });

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);

  final String? title;
  final String? slug;
  final String? url;
  final int? crawlRate;

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
  List<Object?> get props => [
        title,
        slug,
        url,
        crawlRate,
      ];
}
