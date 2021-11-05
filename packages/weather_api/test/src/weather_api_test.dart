import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:weather_api/weather_api.dart';

import '../fixtures/fixture_adapter.dart';

class MockDioClient extends Mock implements Dio {}

void main() {
  late Dio client;
  late WeatherApi weatherApi;

  // test variables
  late List<LocationResponse> locationResponseList;
  late WeatherResponse weatherResponse;

  setUp(() {
    client = MockDioClient();
    weatherApi = WeatherApi(client: client);

    final decodedList = json.decode(
      fixture('location_fixture.json'),
    ) as List<dynamic>;

    locationResponseList = List<LocationResponse>.from(
      decodedList.map<LocationResponse>(
        (dynamic x) => LocationResponse.fromJson(x as Map<String, dynamic>),
      ),
    );

    weatherResponse = WeatherResponse.fromJson(
      json.decode(fixture('weather_fixture.json')) as Map<String, dynamic>,
    );
  });

  void setUpClientSuccess(String data) {
    when(
      () => client.get<dynamic>(
        any(),
        queryParameters: any(named: 'queryParameters'),
      ),
    ).thenAnswer(
      (_) async => Response<dynamic>(
        requestOptions: RequestOptions(path: ''),
        data: json.decode(data),
        statusCode: 200,
      ),
    );
  }

  void setUpClientFailure() {
    when(() => client.get<Response>(any())).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(path: ''),
        statusCode: 400,
      ),
    );
  }

  group('searchLocation', () {
    const query = 'man';

    test(
      'should return LocationResponse when response code is 200',
      () async {
        setUpClientSuccess(fixture('location_fixture.json'));
        final result = await weatherApi.searchLocation(query);
        expect(result, equals(locationResponseList));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        setUpClientFailure();
        expect(
          weatherApi.searchLocation(query),
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
        final result = await weatherApi.getWeather(
          locationResponseList.first.woeid,
        );
        expect(result, equals(weatherResponse));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        setUpClientFailure();
        expect(
          weatherApi.getWeather(locationResponseList.first.woeid),
          throwsA(isA<ServerException>()),
        );
      },
    );
  });
}
