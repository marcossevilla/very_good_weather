import '../../domain/domain.dart';

import '../datasources/local_data_source.dart';
import '../datasources/remote_data_source.dart';

/// Weather repository implementation
class WeatherRepository implements IWeatherRepository {
  WeatherRepository({
    required LocalDataSource localDataSource,
    required RemoteDataSource remoteDataSource,
  })   : _localDataSource = localDataSource,
        _remoteDataSource = remoteDataSource;

  final LocalDataSource _localDataSource;
  final RemoteDataSource _remoteDataSource;

  // TODO: Implement [IWeatherRepository] methods
}
