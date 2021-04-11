import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:weather/weather.dart';

import '../../fixtures/fixture_adapter.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  late GetWeather useCase;
  late WeatherRepository repository;

  setUp(() {
    repository = MockWeatherRepository();
    useCase = GetWeather(repository: repository);
  });

  final tWeatherResponse = WeatherResponse.fromJson(
    json.decode(fixture('weather_fixture.json')),
  );

  test(
    'should get weather from the repository',
    () async {
      when(
        () => repository.getWeather(any()),
      ).thenAnswer((_) async => Right(tWeatherResponse));

      final result = await useCase(0);

      expect(result, Right(tWeatherResponse));

      verify(() => repository.getWeather(0));
      verifyNoMoreInteractions(repository);
    },
  );
}
