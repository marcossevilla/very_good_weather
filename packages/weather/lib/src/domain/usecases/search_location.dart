import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';

import '../entities/location_response/location_response.dart';
import '../repositories/iweather_repository.dart';

class SearchLocation {
  SearchLocation({
    required IWeatherRepository repository,
  }) : _repository = repository;

  final IWeatherRepository _repository;

  Future<Either<Failure, List<LocationResponse>>> call(
    String location,
  ) async {
    return _repository.searchLocation(location);
  }
}
