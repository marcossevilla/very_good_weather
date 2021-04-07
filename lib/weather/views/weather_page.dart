import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_weather/l10n/l10n.dart';
import 'package:very_good_weather/weather/weather.dart';

import '../cubit/weather_cubit.dart';
import '../widgets/widgets.dart';

/// WeatherPage to show Weather information
/// based on previous location selection
class WeatherPage extends StatelessWidget {
  const WeatherPage({
    Key? key,
  }) : super(key: key);

  static Route go() {
    return MaterialPageRoute<void>(builder: (_) => const WeatherPage());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.forecastIntro)),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        buildWhen: (previous, current) => current != previous,
        builder: (_, state) {
          return state.when(
            initial: () => Center(child: Text(l10n.noWeather)),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (w, t) => WeatherData(weather: w, temperature: t),
            error: (error) => Center(child: Text(error ?? l10n.generalError)),
          );
        },
      ),
    );
  }
}
