import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'package:errors/errors.dart';
import 'package:weather/src/domain/enums/location_type.dart';
import 'package:weather/weather.dart';

import '../../fixtures/fixture_adapter.dart';

class MockDioClient extends Mock implements Dio {}

void main() {
  late MockDioClient client;
  late WeatherRemoteDataSource dataSource;

  final fixtureStr = fixture('weather_fixture.json');
  final tWeatherResponse = WeatherResponse.fromJson(
    json.decode(fixtureStr),
  );

  setUp(() {
    client = MockDioClient();
    dataSource = WeatherRemoteDataSource(client: client);
  });

  void setUpHttpClientSuccess() {
    when(() => client.get(any())).thenAnswer(
      (_) async => Response(
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      ),
    );
  }

  void setUpHttpClientFailure() {
    when(() => client.get(any())).thenAnswer(
      (_) async => Response(
        statusCode: 404,
        requestOptions: RequestOptions(path: ''),
      ),
    );
  }

  final tLocationResponse = LocationResponse(
    woeid: 0,
    title: 'Managua',
    lattLong: '0201',
    locationType: LocationType.city,
  );

  group('searchLocation', () {
    final tQuery = 'managua';

    test(
      'should perform a GET request on with query as a queryParam',
      () async {
        setUpHttpClientSuccess();

        await dataSource.searchLocation(tQuery);

        verify(() => client.get('path', queryParameters: {'query': tQuery}));
      },
    );

    test(
      'should return WeatherResponse when  response code is 200',
      () async {
        setUpHttpClientSuccess();

        final result = await dataSource.searchLocation(tQuery);

        expect(() => result, equals(tLocationResponse));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        setUpHttpClientFailure();

        expect(
          () async => await dataSource.searchLocation(tQuery),
          throwsA(isA<ServerException>()),
        );
      },
    );
  });

  group('getWeather', () {
    test(
      'should perform a GET request on location endpoint',
      () async {
        setUpHttpClientSuccess();

        await dataSource.getWeather(tLocationResponse.woeid);
        // assert
        verify(() async => await client.get('/location/search/'));
      },
    );

    test(
      'should return WeatherResponse when the response code is 200',
      () async {
        setUpHttpClientSuccess();

        final result = await dataSource.getWeather(tLocationResponse.woeid);

        expect(() => result, equals(tWeatherResponse));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        setUpHttpClientFailure();

        expect(
          () => dataSource.getWeather(tLocationResponse.woeid),
          throwsA(isA<ServerException>()),
        );
      },
    );
  });
}
