import 'dart:convert';

import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:weather_api/weather_api.dart';
import 'package:weather_repository/weather_repository.dart';

import '../fixtures/fixture_adapter.dart';

class MockWeatherApi extends Mock implements WeatherApi {}

class WeatherFake extends Fake implements WeatherResponse {}

void main() {
  late WeatherApi weatherApi;
  late WeatherRepository weatherRepository;

  late WeatherResponse weatherResponse;
  late List<LocationResponse> locationResponseList;

  setUpAll(() {
    registerFallbackValue(WeatherFake());
  });

  setUp(() {
    weatherApi = MockWeatherApi();
    weatherRepository = WeatherRepository(weatherApi: weatherApi);

    weatherResponse = WeatherResponse.fromJson(
      json.decode(fixture('weather_fixture.json')) as Map<String, dynamic>,
    );

    final decodedList = json.decode(
      fixture('location_fixture.json'),
    ) as List<dynamic>;

    locationResponseList = List<LocationResponse>.from(
      decodedList.map<LocationResponse>(
        (dynamic x) => LocationResponse.fromJson(x as Map<String, dynamic>),
      ),
    );
  });

  group('searchLocation', () {
    test(
      'throws when searchLocation fails',
      () async {
        when(
          () => weatherApi.searchLocation(any()),
        ).thenThrow(ServerException());

        final result = await weatherRepository.searchLocation('location');
        expect(result, LocationFailure());
      },
    );

    test(
      'returns locations when searchLocation succeeds',
      () async {
        when(
          () => weatherApi.searchLocation(any()),
        ).thenAnswer((_) async => locationResponseList);

        final result = await weatherRepository.searchLocation('location');
        expect(result, locationResponseList);
      },
    );
  });

  group('getWeather', () {
    test(
      'throws when getWeather fails',
      () async {
        when(
          () => weatherApi.getWeather(any()),
        ).thenThrow(ServerException());

        final result = await weatherRepository.getWeather(0);
        expect(result, WeatherFailure());
      },
    );

    test(
      'returns a weather when getWeather succeeds',
      () async {
        when(
          () => weatherApi.getWeather(any()),
        ).thenAnswer((_) async => weatherResponse);

        final result = await weatherRepository.getWeather(0);
        expect(result, weatherResponse);
      },
    );
  });
}
