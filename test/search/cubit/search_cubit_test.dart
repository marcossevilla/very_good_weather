import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:very_good_weather/search/search.dart';
import 'package:weather_repository/weather_repository.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

class MockLocation extends Mock implements LocationResponse {}

void main() {
  late LocationResponse location;
  late WeatherRepository weatherRepository;
  late SearchCubit searchCubit;

  setUp(() {
    location = MockLocation();
    weatherRepository = MockWeatherRepository();
    searchCubit = SearchCubit(weatherRepository: weatherRepository);
  });

  test(
    'initial state loads as expected',
    () => expect(searchCubit.state, const SearchInitial()),
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
