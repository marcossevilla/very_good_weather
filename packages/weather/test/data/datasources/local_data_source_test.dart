import 'dart:convert';
import 'dart:ffi';

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
    dataSource = WeatherLocalDataSource(box: database);
  });

  final weatherFixture = fixture('weather_fixture.json');

  final tWeatherResponse = WeatherResponse.fromJson(
    json.decode(weatherFixture),
  );

  group('getCachedWeather', () {
    test(
      'should return WeatherResponse from database if it\'s there',
      () async {
        when(
          () => database.get(any()),
        ).thenReturn(weatherFixture);

        final result = dataSource.getCachedWeather();

        verify(() => database.get(kCachedBoxKey)).called(1);

        expect(result, equals(tWeatherResponse));
      },
    );

    test(
      'should throw CacheException when there\'s no cached weather',
      () {
        when(() => database.get(any())).thenReturn(null);

        expect(
          () => dataSource.getCachedWeather(),
          throwsA(isA<CacheException>()),
        );
      },
    );
  });

  group('cacheWeather', () {
    test(
      'should cache weather by inserting it in database',
      () async {
        when(
          () => database.put(any(), any()),
        ).thenAnswer((_) async => Void);

        await dataSource.cacheWeather(tWeatherResponse);

        final expectedJson = json.encode(tWeatherResponse.toJson());

        verify(() => database.put(kCachedBoxKey, expectedJson));
      },
    );
  });
}
