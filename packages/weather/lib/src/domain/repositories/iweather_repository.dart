import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';

import '../entities/location_response/location_response.dart';
import '../entities/weather_response/weather_response.dart';

/// Repository interface for weather
abstract class IWeatherRepository {
  Future<Either<Failure, List<LocationResponse>>> searchLocation(
    String location,
  );
  Future<Either<Failure, WeatherResponse>> getWeather(int locationId);
}
