// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:very_good_weather/app/app.dart';
import 'package:very_good_weather/app/app_bloc_observer.dart';
import 'app/app_config.dart';

Future<void> main() async {
  Bloc.observer = AppBlocObserver();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  final weatherApi = WeatherApi(
    client: Dio(
      BaseOptions(
        baseUrl: AppConfig.apiUrl,
      ),
    ),
  );

  final weatherRepository = WeatherRepository(weatherApi: weatherApi);

  await runZonedGuarded(
    () async => runApp(
      App(weatherRepository: weatherRepository),
    ),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
