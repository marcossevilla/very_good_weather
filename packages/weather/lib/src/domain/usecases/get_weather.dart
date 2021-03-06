import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';

import '../entities/weather_response/weather_response.dart';
import '../repositories/iweather_repository.dart';

class GetWeather {
  GetWeather({
    required IWeatherRepository repository,
  }) : _repository = repository;

  final IWeatherRepository _repository;

  Future<Either<Failure, WeatherResponse>> call(
    int locationId,
  ) async {
    return _repository.getWeather(locationId);
  }
}
