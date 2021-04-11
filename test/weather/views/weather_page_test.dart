import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:very_good_weather/weather/weather.dart';

import '../../fixtures/fixture_adapter.dart';
import '../../helpers/pump_app.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

class MockWeatherCubit extends MockCubit<WeatherState> implements WeatherCubit {
}

class FakeWeatherState extends Fake implements WeatherState {}

void main() {
  setUpAll(() {
    registerFallbackValue<WeatherState>(FakeWeatherState());
  });

  group('WeatherPage', () {
    late WeatherCubit weatherCubit;

    setUp(() {
      weatherCubit = MockWeatherCubit();
    });

    testWidgets('renders initial weather state widget', (tester) async {
      when(
        () => weatherCubit.state,
      ).thenReturn(const WeatherState.initial());

      await tester.pumpApp(
        BlocProvider.value(
          value: weatherCubit,
          child: const WeatherPage(woeid: 0),
        ),
      );

      expect(
        find.byKey(const Key('weatherPage_noWeatherText')),
        findsOneWidget,
      );
    });

    testWidgets('renders loading weather state widget', (tester) async {
      when(
        () => weatherCubit.state,
      ).thenReturn(const WeatherState.loading());

      await tester.pumpApp(
        BlocProvider.value(
          value: weatherCubit,
          child: const WeatherPage(woeid: 0),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders error weather state widget', (tester) async {
      when(
        () => weatherCubit.state,
      ).thenReturn(const WeatherState.error());

      await tester.pumpApp(
        BlocProvider.value(
          value: weatherCubit,
          child: const WeatherPage(woeid: 0),
        ),
      );

      expect(
        find.byKey(const Key('weatherPage_errorWeatherText')),
        findsOneWidget,
      );
    });

    testWidgets('renders loaded weather state widget', (tester) async {
      final weather = WeatherResponse.fromJson(
        json.decode(fixture('weather_fixture.json')),
      );

      when(
        () => weatherCubit.state,
      ).thenReturn(WeatherState.loaded(weather, Temperature.celsius));

      await tester.pumpApp(
        BlocProvider.value(
          value: weatherCubit,
          child: const WeatherPage(woeid: 0),
        ),
      );

      expect(find.byType(WeatherData), findsOneWidget);
    });
  });
}
