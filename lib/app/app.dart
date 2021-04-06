// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:very_good_weather/app/app_config.dart';
import 'package:very_good_weather/l10n/l10n.dart';
import 'package:very_good_weather/search/search.dart';
import 'package:very_good_weather/weather/weather.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.box,
  }) : super(key: key);

  final Box box;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => WeatherRepository(
            localDataSource: WeatherLocalDataSource(prefs: box),
            remoteDataSource: WeatherRemoteDataSource(
              client: Dio(BaseOptions(baseUrl: AppConfig.apiUrl)),
            ),
          ),
        ),
      ],
      child: const AppMultiBloc(),
    );
  }
}

class AppMultiBloc extends StatelessWidget {
  const AppMultiBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchCubit(
            searchLocation: SearchLocation(
              repository: context.read<WeatherRepository>(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => WeatherCubit(
            getWeather: GetWeather(
              repository: context.read<WeatherRepository>(),
            ),
          ),
        ),
      ],
      child: const AppCore(),
    );
  }
}

class AppCore extends StatelessWidget {
  const AppCore({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: const Color(0xFF13B9FF),
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
      ),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: const SearchPage(),
    );
  }
}
