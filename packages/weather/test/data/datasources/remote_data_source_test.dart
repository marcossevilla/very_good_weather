import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:errors/errors.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'package:weather/weather.dart';

import '../../fixtures/fixture_adapter.dart';

class MockDioClient extends Mock implements Dio {}

class MockResponse extends Mock implements Response {}

void main() {
  late Dio client;
  late Response response;
  late WeatherRemoteDataSource dataSource;

  final tWeatherResponse = WeatherResponse.fromJson(
    json.decode(fixture('weather_fixture.json')),
  );

  final tLocations = json.decode(fixture('location_fixture.json')) as List;

  final tLocationResponse = <LocationResponse>[];

  for (final location in tLocations) {
    tLocationResponse.add(LocationResponse.fromJson(location));
  }

  setUp(() {
    client = MockDioClient();
    response = MockResponse();
    dataSource = WeatherRemoteDataSource(client: client);
  });

  void setUpClientSuccess(Object data) {
    when(() => response.statusCode).thenReturn(200);
    when(() => response.data).thenReturn(data);
    when(() async => client.get(any())).thenAnswer((_) async => response);
  }

  void setUpClientFailure() {
    when(() => response.statusCode).thenReturn(400);
    when(() async => await client.get(any())).thenAnswer((_) async => response);
  }

  group('searchLocation', () {
    final tQuery = 'man';

    test(
      'should return LocationResponse when response code is 200',
      () async {
        setUpClientSuccess(tLocations);

        final result = await dataSource.searchLocation(tQuery);

        expect(() => result, equals(tLocationResponse));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        setUpClientFailure();

        expect(
          () async => await dataSource.searchLocation(tQuery),
          throwsA(isA<ServerException>()),
        );
      },
    );
  });

  group('getWeather', () {
    test(
      'should return WeatherResponse when the response code is 200',
      () async {
        setUpClientSuccess(tWeatherResponse);

        final result = await dataSource.getWeather(tLocations.first.woeid);

        expect(result, equals(tWeatherResponse));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        setUpClientFailure();

        expect(
          () async => await dataSource.getWeather(tLocations.first.woeid),
          throwsA(isA<ServerException>()),
        );
      },
    );
  });
}
