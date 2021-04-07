import 'dart:convert';

import 'package:errors/errors.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:weather/weather.dart';

import '../../fixtures/fixture_adapter.dart';

class MockDatabase extends Mock implements Box {}

class MockWeather extends Mock implements WeatherResponse {}

void main() {
  late MockDatabase database;
  late WeatherLocalDataSource dataSource;

  setUp(() {
    database = MockDatabase();
    dataSource = WeatherLocalDataSource(db: database);
  });

  final weatherFixture = fixture('weather_fixture.json');

  final tWeatherResponse = WeatherResponse.fromJson(
    json.decode(weatherFixture),
  );

  group('getCachedWeather', () {
    test(
      'should return WeatherResponse from database if it\'s there',
      () async {
        when(database.get(any)).thenReturn(weatherFixture);

        final result = await dataSource.getCachedWeather();

        verify(database.get(kCachedBoxKey));

        expect(result, equals(tWeatherResponse));
      },
    );

    test(
      'should throw CacheException when there\'s no cached weather',
      () {
        when(database.get(any)).thenReturn(null);

        final call = dataSource.getCachedWeather;

        expect(call, throwsA(isA<CacheException>()));
      },
    );
  });

  group('cacheWeather', () {
    test(
      'should cache weather by inserting it in database',
      () async {
        await dataSource.cacheWeather(tWeatherResponse);

        final expectedJson = json.encode(tWeatherResponse.toJson());

        verify(() async => await database.put(kCachedBoxKey, expectedJson));
      },
    );
  });
}
