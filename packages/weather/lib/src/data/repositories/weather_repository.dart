import 'package:errors/errors.dart';

import 'package:dartz/dartz.dart';
import 'package:network_manager/network_manager.dart' show INetworkManager;

import '../../domain/domain.dart' show IWeatherRepository, WeatherResponse;

import '../datasources/local_data_source.dart' show IWeatherLocalDataSource;
import '../datasources/remote_data_source.dart' show IWeatherRemoteDataSource;

/// Weather repository implementation
class WeatherRepository implements IWeatherRepository {
  WeatherRepository({
    required IWeatherLocalDataSource localDataSource,
    required IWeatherRemoteDataSource remoteDataSource,
    required INetworkManager networkManager,
  })   : _localDataSource = localDataSource,
        _remoteDataSource = remoteDataSource,
        _networkManager = networkManager;

  final IWeatherLocalDataSource _localDataSource;
  final IWeatherRemoteDataSource _remoteDataSource;
  final INetworkManager _networkManager;

  @override
  Future<Either<Failure, WeatherResponse>> getWeather(String location) async {
    if (await _networkManager.isConnected) {
      try {
        final weather = await _remoteDataSource.getWeather(location);
        await _localDataSource.cacheWeather(weather);
        return Right(weather);
      } catch (e) {
        return Left(ServerFailure());
      }
    }

    try {
      final weather = await _localDataSource.getCachedWeather();
      return Right(weather);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
