import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:weather/weather.dart';

import '../../fixtures/fixture_adapter.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  late SearchLocation useCase;
  late WeatherRepository repository;

  final tLocations = json.decode(fixture('location_fixture.json')) as List;

  final tLocationResponse = <LocationResponse>[];

  for (final location in tLocations) {
    tLocationResponse.add(LocationResponse.fromJson(location));
  }

  setUp(() {
    repository = MockWeatherRepository();
    useCase = SearchLocation(repository: repository);
  });

  test(
    'should get location on search from the repository',
    () async {
      when(
        () => repository.searchLocation(any()),
      ).thenAnswer((_) async => Right(tLocationResponse));

      final result = await useCase('man');

      expect(result, Right(tLocationResponse));

      verify(() => repository.searchLocation('man'));
      verifyNoMoreInteractions(repository);
    },
  );
}
