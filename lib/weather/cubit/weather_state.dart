part of 'weather_cubit.dart';

enum Temperature { celsius, fahrenheit }

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object?> get props => [];
}

class WeatherInitial extends WeatherState {
  const WeatherInitial();
}

class WeatherLoading extends WeatherState {
  const WeatherLoading();
}

class WeatherLoaded extends WeatherState {
  const WeatherLoaded({
    required this.weather,
    this.temperature = Temperature.celsius,
  });

  final WeatherResponse weather;
  final Temperature temperature;

  @override
  List<Object?> get props => [weather];
}

class WeatherError extends WeatherState {
  const WeatherError({this.error});

  final String? error;

  @override
  List<Object?> get props => [error];
}
