part of 'weather_cubit.dart';

enum Temperature { celsius, fahrenheit }

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState.initial() = _Initial;

  const factory WeatherState.loading() = _Loading;

  const factory WeatherState.loaded(
    WeatherResponse weather,
    Temperature temperature,
  ) = _Loaded;

  const factory WeatherState.error([String? message]) = _Error;
}
