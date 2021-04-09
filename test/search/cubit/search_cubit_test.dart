import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:very_good_weather/search/search.dart';
import 'package:very_good_weather/weather/weather.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

class MockLocation extends Mock implements LocationResponse {}

void main() {
  late LocationResponse location;
  late WeatherRepository weatherRepository;
  late SearchCubit searchCubit;

  setUp(() {
    location = MockLocation();
    weatherRepository = MockWeatherRepository();
    searchCubit = SearchCubit(
      searchLocation: SearchLocation(repository: weatherRepository),
    );
  });

  test(
    'initial state loads as expected',
    () {
      expect(searchCubit.state, const SearchState.initial());
    },
  );

  group(
    'SearchCubit',
    () {
      blocTest<SearchCubit, SearchState>(
        'search location error flow',
        build: () {
          when(
            () => weatherRepository.searchLocation(any()),
          ).thenAnswer((_) async => Left(ServerFailure()));

          return searchCubit;
        },
        act: (cubit) => cubit.searchLocation('query'),
        expect: () => <SearchState>[
          const SearchState.loading(),
          const SearchState.error(),
        ],
      );

      blocTest<SearchCubit, SearchState>(
        'search location success flow',
        build: () {
          when(
            () => weatherRepository.searchLocation(any()),
          ).thenAnswer((_) async => Right([location]));

          return searchCubit;
        },
        act: (cubit) => cubit.searchLocation('query'),
        expect: () => <SearchState>[
          const SearchState.loading(),
          SearchState.loaded([location]),
        ],
      );
    },
  );
}
