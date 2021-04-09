import 'dart:convert';

import 'package:errors/errors.dart' show CacheException;
import 'package:hive/hive.dart' show Box;
import '../../../domain/domain.dart' show WeatherResponse;

/// Key to keep track of last cached weather
const kCachedBoxKey = 'WEATHER_CACHE';

abstract class IWeatherLocalDataSource {
  Future<WeatherResponse> getCachedWeather();
  Future<void> cacheWeather(WeatherResponse weatherResponse);
}

class WeatherLocalDataSource implements IWeatherLocalDataSource {
  WeatherLocalDataSource({
    required Box box,
  }) : _box = box;

  final Box _box;

  @override
  Future<void> cacheWeather(WeatherResponse weatherResponse) {
    return _box.put(kCachedBoxKey, json.encode(weatherResponse.toJson()));
  }

  @override
  Future<WeatherResponse> getCachedWeather() async {
    final jsonStr = _box.get(kCachedBoxKey);

    if (jsonStr != null) {
      final trivia = WeatherResponse.fromJson(json.decode(jsonStr));
      return Future.value(trivia);
    } else {
      throw CacheException();
    }
  }
}
