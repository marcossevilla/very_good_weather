import 'dart:convert';
import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:weather/weather.dart';

import '../../fixtures/fixture_adapter.dart';

class MockRemoteDataSource extends Mock implements WeatherRemoteDataSource {}

class MockLocalDataSource extends Mock implements WeatherLocalDataSource {}

class WeatherFake extends Fake implements WeatherResponse {}

void main() {
  late WeatherRemoteDataSource remoteDataSource;
  late WeatherLocalDataSource localDataSource;
  late WeatherRepository weatherRepository;

  late WeatherResponse tWeatherResponse;
  late List<LocationResponse> tLocationResponse;

  setUpAll(() {
    registerFallbackValue<WeatherResponse>(WeatherFake());
  });

  setUp(() {
    localDataSource = MockLocalDataSource();
    remoteDataSource = MockRemoteDataSource();
    weatherRepository = WeatherRepository(
      localDataSource: localDataSource,
      remoteDataSource: remoteDataSource,
    );

    tWeatherResponse = WeatherResponse.fromJson(
      json.decode(fixture('weather_fixture.json')),
    );

    tLocationResponse = List<LocationResponse>.from(
      json
          .decode(fixture('location_fixture.json'))
          .map((x) => LocationResponse.fromJson(x)),
    );
  });

  group('searchLocation', () {
    test(
      'throws when searchLocation fails',
      () async {
        when(
          () => remoteDataSource.searchLocation(any()),
        ).thenThrow(ServerException());

        final result = await weatherRepository.searchLocation('location');

        expect(result, Left(ServerFailure()));
      },
    );

    test(
      'returns locations when searchLocation succeeds',
      () async {
        when(
          () => remoteDataSource.searchLocation(any()),
        ).thenAnswer((_) async => tLocationResponse);

        final result = await weatherRepository.searchLocation('location');

        expect(result, Right(tLocationResponse));
      },
    );
  });

  group('getWeather', () {
    test(
      'throws when getWeather fails',
      () async {
        when(
          () => remoteDataSource.getWeather(any()),
        ).thenThrow(ServerException());

        final result = await weatherRepository.getWeather(0);

        expect(result, Left(ServerFailure()));
      },
    );

    test(
      'returns a weather when getWeather succeeds',
      () async {
        when(
          () => remoteDataSource.getWeather(any()),
        ).thenAnswer((_) async => tWeatherResponse);

        when(
          () => localDataSource.cacheWeather(any()),
        ).thenAnswer((_) async => Void);

        final result = await weatherRepository.getWeather(0);

        expect(result, Right(tWeatherResponse));
      },
    );
  });
}
