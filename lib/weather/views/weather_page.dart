import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather.dart';

import '../cubit/weather_cubit.dart';

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
    return BlocProvider(
      create: (context) => WeatherCubit(
        getWeather: GetWeather(
          repository: context.read<WeatherRepository>(),
        ),
      ),
      child: const Scaffold(
        body: Center(
          child: Text('This is WeatherPage'),
        ),
      ),
    );
  }
}
