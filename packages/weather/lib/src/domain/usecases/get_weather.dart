import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';

import '../entities/weather_response.dart';
import '../repositories/iweather_repository.dart';

class GetWeather {
  GetWeather({required IWeatherRepository repository})
      : _repository = repository;

  final IWeatherRepository _repository;

  /// Callable class method
  Future<Either<Failure, WeatherResponse>> call() async {
    /// TODO: Call specific repository method
  }
}
