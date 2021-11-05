import 'package:weather_api/weather_api.dart';

class LocationFailure implements Exception {}

class WeatherFailure implements Exception {}

class WeatherRepository {
  const WeatherRepository({required WeatherApi weatherApi})
      : _weatherApi = weatherApi;

  final WeatherApi _weatherApi;

  Future<List<LocationResponse>> searchLocation(String location) async {
    try {
      final locations = await _weatherApi.searchLocation(location);
      return locations;
    } catch (_) {
      throw LocationFailure();
    }
  }

  Future<WeatherResponse> getWeather(int locationId) async {
    try {
      final weather = await _weatherApi.getWeather(locationId);
      return weather;
    } catch (_) {
      throw WeatherFailure();
    }
  }
}
