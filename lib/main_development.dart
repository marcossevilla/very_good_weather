// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:very_good_weather/app/app.dart';
import 'package:very_good_weather/app/app_bloc_observer.dart';
import 'package:very_good_weather/app/app_config.dart';

void main() async {
  Bloc.observer = AppBlocObserver();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await runZonedGuarded(
    () async {
      await Hive.initFlutter();
      final appBox = await Hive.openBox(AppConfig.appBox);
      runApp(App(box: appBox));
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
