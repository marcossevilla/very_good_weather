import 'package:freezed_annotation/freezed_annotation.dart';

import '../../enums/location_type.dart';

part 'weather_response.freezed.dart';
part 'weather_response.g.dart';

@freezed
class WeatherResponse with _$WeatherResponse {
  const factory WeatherResponse({
    required String title,
    required LocationType locationType,
    required int woeid,
    required String lattLong,
  }) = _WeatherResponse;

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);
}
