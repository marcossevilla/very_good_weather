import 'dart:convert';

import 'package:dio/dio.dart' show Dio;
import 'package:errors/errors.dart' show ServerException;
import '../../domain/domain.dart' show LocationResponse, WeatherResponse;

abstract class IWeatherRemoteDataSource {
  Future<List<LocationResponse>> searchLocation(String location);
  Future<WeatherResponse> getWeather(int locationId);
}

class WeatherRemoteDataSource implements IWeatherRemoteDataSource {
  WeatherRemoteDataSource({
    required Dio client,
    required String url,
  })   : _client = client,
        _url = url;

  final Dio _client;
  final String _url;

  @override
  Future<List<LocationResponse>> searchLocation(String location) async {
    try {
      final response = await _client.get(
        '$_url/location/search/',
        queryParameters: {'query': location},
      );

      if (response.statusCode != 200) throw ServerException();

      final decode = json.decode(response.data) as List;
      final locations = <LocationResponse>[];

      for (final location in decode) {
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
      final response = await _client.get('$_url/location/$locationId/');

      if (response.statusCode != 200) throw ServerException();

      final decode = json.decode(response.data);
      return WeatherResponse.fromJson(decode);
    } catch (e) {
      throw ServerException();
    }
  }
}
