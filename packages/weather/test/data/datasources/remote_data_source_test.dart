import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:errors/errors.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'package:weather/weather.dart';

import '../../fixtures/fixture_adapter.dart';

class MockDioClient extends Mock implements Dio {}

void main() {
  late Dio client;
  late WeatherRemoteDataSource dataSource;

  // test variables
  late List<LocationResponse> tLocationResponse;
  late WeatherResponse tWeatherResponse;

  setUp(() {
    client = MockDioClient();
    dataSource = WeatherRemoteDataSource(client: client);

    tLocationResponse = List<LocationResponse>.from(
      json
          .decode(fixture('location_fixture.json'))
          .map((x) => LocationResponse.fromJson(x)),
    );

    tWeatherResponse = WeatherResponse.fromJson(
      json.decode(fixture('weather_fixture.json')),
    );
  });

  void setUpClientSuccess(String data) {
    when(
      () => client.get(
        any(),
        queryParameters: any(named: 'queryParameters'),
      ),
    ).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(path: ''),
        data: json.decode(data),
        statusCode: 200,
      ),
    );
  }

  void setUpClientFailure() {
    when(() => client.get(any())).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(path: ''),
        statusCode: 400,
      ),
    );
  }

  group('searchLocation', () {
    final tQuery = 'man';

    test(
      'should return LocationResponse when response code is 200',
      () async {
        setUpClientSuccess(fixture('location_fixture.json'));

        final result = await dataSource.searchLocation(tQuery);

        expect(result, equals(tLocationResponse));
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
        setUpClientSuccess(fixture('weather_fixture.json'));

        final result = await dataSource.getWeather(
          tLocationResponse.first.woeid,
        );

        expect(result, equals(tWeatherResponse));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        setUpClientFailure();

        expect(
          () => dataSource.getWeather(tLocationResponse.first.woeid),
          throwsA(isA<ServerException>()),
        );
      },
    );
  });
}
