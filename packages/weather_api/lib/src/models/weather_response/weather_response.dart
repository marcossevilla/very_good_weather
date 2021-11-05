import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_api/src/models/models.dart';

part 'weather_response.g.dart';

@JsonSerializable()
class WeatherResponse extends Equatable {
  const WeatherResponse({
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
