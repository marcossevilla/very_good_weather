import 'dart:convert';

import 'package:dio/dio.dart' show Dio;
import 'package:errors/errors.dart' show ServerException;
import '../../domain/domain.dart' show WeatherResponse;

abstract class IWeatherRemoteDataSource {
  Future<WeatherResponse> getWeather(String location);
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
  Future<WeatherResponse> getWeather(String location) async {
    try {
      final response = await _client.get(
        '$_url/location/search/?query=$location',
      );
      final decode = json.decode(response.data);
      return WeatherResponse.fromJson(decode);
    } catch (e) {
      throw ServerException();
    }
  }
}
