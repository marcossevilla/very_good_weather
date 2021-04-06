import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../weather/weather.dart';
import '../extensions/temperature_extension.dart';

class WeatherData extends StatelessWidget {
  const WeatherData({
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
    final isCelsius = temperature == Temperature.celsius ? true : false;

    return RefreshIndicator(
      onRefresh: () => context.read<WeatherCubit>().getWeather(weather.woeid),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Text(
              weather.title,
              style: h3,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  (isCelsius ? temp.celsius : temp.fahrenheit)
                      .toStringAsFixed(2),
                  style: h3,
                  textAlign: TextAlign.center,
                ),
                Text(isCelsius ? 'C' : 'F', style: h3),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              weather.consolidatedWeather.first.weatherStateName,
              style: h3,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Align(child: _TemperatureToggle(isCelsius: isCelsius)),
          ],
        ),
      ),
    );
  }
}

class _TemperatureToggle extends StatelessWidget {
  const _TemperatureToggle({
    Key? key,
    required this.isCelsius,
  }) : super(key: key);

  final bool isCelsius;

  @override
  Widget build(BuildContext context) {
    final labels = ['Celsius', 'Fahrenheit'];

    return ToggleButtons(
      children: [
        for (final label in labels)
          Padding(padding: const EdgeInsets.all(12), child: Text(label))
      ],
      isSelected: [isCelsius, !isCelsius],
      onPressed: (index) {
        var temp = index == 0 ? Temperature.celsius : Temperature.fahrenheit;
        context.read<WeatherCubit>().changeTemperature(temp);
      },
    );
  }
}
