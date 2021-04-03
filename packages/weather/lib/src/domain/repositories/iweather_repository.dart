import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';

import '../entities/weather_response/weather_response.dart';

/// Repository interface for weather
abstract class IWeatherRepository {
  Future<Either<Failure, WeatherResponse>> getWeather(String location);
}
