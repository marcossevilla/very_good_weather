import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_weather/weather/weather.dart';

import '../cubit/weather_cubit.dart';
import '../extensions/temperature_extension.dart';

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
      appBar: AppBar(),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (_, state) {
          return state.when(
            initial: () => const Center(child: Text('This is WeatherPage')),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (weather, temp) => WeatherView(
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

class WeatherView extends StatelessWidget {
  const WeatherView({
    Key? key,
    required this.weather,
    required this.temperature,
  }) : super(key: key);

  final WeatherResponse weather;
  final Temperature temperature;

  @override
  Widget build(BuildContext context) {
    final h3 = Theme.of(context).textTheme.headline3;
    final temp = weather.consolidatedWeather.first.theTemp;
    final isCelsius = temperature.index == 0 ? true : false;

    return RefreshIndicator(
      onRefresh: () => context.read<WeatherCubit>().getWeather(weather.woeid),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weather.title,
            style: h3,
            textAlign: TextAlign.center,
          ),
          Text(
            '${isCelsius ? temp.celsius : temp.fahrenheit}',
            style: h3,
            textAlign: TextAlign.center,
          ),
          Text(
            weather.timezoneName,
            style: h3,
            textAlign: TextAlign.center,
          ),
          Align(
            child: SwitchListTile.adaptive(
              value: isCelsius,
              onChanged: (value) {
                final temp =
                    value ? Temperature.celsius : Temperature.fahrenheit;
                context.read<WeatherCubit>().changeTemperature(temp);
              },
            ),
          ),
        ],
      ),
    );
  }
}
