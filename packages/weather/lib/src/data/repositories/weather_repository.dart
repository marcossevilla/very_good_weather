import 'package:errors/errors.dart';

import 'package:dartz/dartz.dart';

import '../../domain/domain.dart'
    show IWeatherRepository, LocationResponse, WeatherResponse;

import '../datasources/local_data_source.dart' show IWeatherLocalDataSource;
import '../datasources/remote_data_source.dart' show IWeatherRemoteDataSource;

/// Weather repository implementation
class WeatherRepository implements IWeatherRepository {
  WeatherRepository({
    required IWeatherLocalDataSource localDataSource,
    required IWeatherRemoteDataSource remoteDataSource,
  })   : _localDataSource = localDataSource,
        _remoteDataSource = remoteDataSource;

  final IWeatherLocalDataSource _localDataSource;
  final IWeatherRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, List<LocationResponse>>> searchLocation(
    String location,
  ) async {
    try {
      final locations = await _remoteDataSource.searchLocation(location);
      return Right(locations);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, WeatherResponse>> getWeather(int locationId) async {
    try {
      final weather = await _remoteDataSource.getWeather(locationId);
      await _localDataSource.cacheWeather(weather);
      return Right(weather);
    } catch (e) {
      try {
        final weather = await _localDataSource.getCachedWeather();
        return Right(weather);
      } catch (e) {
        return Left(ServerFailure());
      }
    }
  }
}
