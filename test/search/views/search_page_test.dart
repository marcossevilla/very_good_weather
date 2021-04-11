import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:very_good_weather/search/search.dart';

import '../../fixtures/fixture_adapter.dart';
import '../../helpers/pump_app.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

class MockSearchCubit extends MockCubit<SearchState> implements SearchCubit {}

class FakeSearchState extends Fake implements SearchState {}

void main() {
  setUpAll(() {
    registerFallbackValue<SearchState>(FakeSearchState());
  });

  group('SearchPage', () {
    late SearchCubit searchCubit;

    setUp(() {
      searchCubit = MockSearchCubit();
    });

    testWidgets('renders initial search state widget', (tester) async {
      when(
        () => searchCubit.state,
      ).thenReturn(const SearchState.initial());

      await tester.pumpApp(
        BlocProvider.value(
          value: searchCubit,
          child: const SearchPage(),
        ),
      );

      expect(
        find.byKey(const Key('searchPage_noLocationsText')),
        findsOneWidget,
      );
      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('renders loading search state widget', (tester) async {
      when(
        () => searchCubit.state,
      ).thenReturn(const SearchState.loading());

      await tester.pumpApp(
        BlocProvider.value(
          value: searchCubit,
          child: const SearchPage(),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders error search state widget', (tester) async {
      when(
        () => searchCubit.state,
      ).thenReturn(const SearchState.error());

      await tester.pumpApp(
        BlocProvider.value(
          value: searchCubit,
          child: const SearchPage(),
        ),
      );

      expect(
        find.byKey(const Key('searchPage_errorSearchText')),
        findsOneWidget,
      );
    });

    testWidgets('renders loaded weather state widget', (tester) async {
      final locationFixture = (json.decode(
        fixture('location_fixture.json'),
      ) as List);

      final locations = <LocationResponse>[];

      for (final location in locationFixture) {
        locations.add(LocationResponse.fromJson(location));
      }

      when(
        () => searchCubit.state,
      ).thenReturn(SearchState.loaded(locations));

      await tester.pumpApp(
        BlocProvider.value(
          value: searchCubit,
          child: const SearchPage(),
        ),
      );

      expect(find.byType(LocationsList), findsOneWidget);
    });
  });
}
