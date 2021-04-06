import 'package:dio/dio.dart';
import 'package:errors/errors.dart' show ServerException;
import '../../../domain/domain.dart' show LocationResponse, WeatherResponse;

abstract class IWeatherRemoteDataSource {
  Future<List<LocationResponse>> searchLocation(String location);
  Future<WeatherResponse> getWeather(int locationId);
}

class WeatherRemoteDataSource implements IWeatherRemoteDataSource {
  WeatherRemoteDataSource({
    required Dio client,
  }) : _client = client;

  final Dio _client;

  @override
  Future<List<LocationResponse>> searchLocation(String location) async {
    try {
      final response = await _client.get(
        '/location/search/',
        queryParameters: {'query': location},
      );

      if (response.statusCode != 200) throw ServerException();

      final locations = <LocationResponse>[];

      for (final location in response.data) {
        locations.add(LocationResponse.fromJson(location));
      }

      return locations;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<WeatherResponse> getWeather(int locationId) async {
    try {
      final response = await _client.get('/location/$locationId/');
      if (response.statusCode != 200) throw ServerException();
      return WeatherResponse.fromJson(response.data);
    } catch (e) {
      throw ServerException();
    }
  }
}
