// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:very_good_weather/app/app.dart';
import 'package:very_good_weather/app/app_config.dart';
import 'package:very_good_weather/search/search.dart';

void main() {
  group('App', () {
    testWidgets('renders SearchPage', (tester) async {
      final path = Directory.current.path;
      Hive.init(path);
      final appBox = await Hive.openBox(AppConfig.appBox);

      await tester.pumpWidget(App(box: appBox));
      expect(find.byType(SearchPage), findsOneWidget);
    });
  });
}
