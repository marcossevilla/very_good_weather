import 'package:dio/dio.dart';
import 'package:weather_api/src/models/models.dart';

class ServerException implements Exception {}

class WeatherApi {
  WeatherApi({required Dio client}) : _client = client;

  final Dio _client;

  Future<List<LocationResponse>> searchLocation(String location) async {
    try {
      final response = await _client.get<Response<Map<String, dynamic>>>(
        '/location/search/',
        queryParameters: <String, dynamic>{'query': location},
      );

      if (response.statusCode != 200) throw ServerException();

      final locations = <LocationResponse>[];
      final locationsMap = response.data! as List;

      for (final location in locationsMap) {
        locations.add(
          LocationResponse.fromJson(location as Map<String, dynamic>),
        );
      }

      return locations;
    } catch (e) {
      throw ServerException();
    }
  }

  Future<WeatherResponse> getWeather(int locationId) async {
    try {
      final response = await _client.get<Response>('/location/$locationId/');
      if (response.statusCode != 200) throw ServerException();
      return WeatherResponse.fromJson(response.data! as Map<String, dynamic>);
    } catch (e) {
      throw ServerException();
    }
  }
}
