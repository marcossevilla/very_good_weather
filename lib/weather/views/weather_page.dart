import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return Scaffold(
      appBar: AppBar(title: Text('The forecast is...')),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        buildWhen: (previous, current) => current != previous,
        builder: (_, state) {
          return state.when(
            initial: () => const Center(child: Text('This is WeatherPage')),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (weather, temp) => WeatherData(
              weather: weather,
              temperature: temp,
            ),
            error: (error) => Center(
              child: Text(error ?? 'Something went wrong'),
            ),
          );
        },
      ),
    );
  }
}
