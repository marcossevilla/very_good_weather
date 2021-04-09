import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:very_good_weather/weather/weather.dart';
import 'package:errors/errors.dart';
import 'package:dartz/dartz.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

class MockWeather extends Mock implements WeatherResponse {}

void main() {
  late WeatherResponse weather;
  late WeatherRepository weatherRepository;
  late WeatherCubit weatherCubit;

  setUp(() {
    weather = MockWeather();
    weatherRepository = MockWeatherRepository();
    weatherCubit = WeatherCubit(
      getWeather: GetWeather(repository: weatherRepository),
    );
  });

  test(
    'initial state loads as expected',
    () {
      expect(weatherCubit.state, const WeatherState.initial());
    },
  );

  group(
    'SearchCubit',
    () {
      blocTest<WeatherCubit, WeatherState>(
        'get weather error flow',
        build: () {
          when(
            () => weatherRepository.getWeather(any()),
          ).thenAnswer((_) async => Left(ServerFailure()));

          return weatherCubit;
        },
        act: (cubit) => cubit.getWeather(0),
        expect: () => <WeatherState>[
          const WeatherState.loading(),
          const WeatherState.error(),
        ],
      );

      blocTest<WeatherCubit, WeatherState>(
        'get weather success flow',
        build: () {
          when(
            () => weatherRepository.getWeather(any()),
          ).thenAnswer((_) async => Right(weather));

          return weatherCubit;
        },
        act: (cubit) => cubit.getWeather(0),
        expect: () => <WeatherState>[
          const WeatherState.loading(),
          WeatherState.loaded(weather, Temperature.celsius),
        ],
      );
    },
  );
}
