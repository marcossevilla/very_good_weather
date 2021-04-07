import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../weather/weather.dart';
import '../extensions/temperature_extension.dart';

const kDegrees = ['Celsius', 'Fahrenheit'];

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
    final theme = Theme.of(context);
    final h3 = theme.textTheme.headline3;

    final temp = weather.consolidatedWeather.first.theTemp;
    final isCelsius = temperature == Temperature.celsius ? true : false;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          weather.title,
          style: h3,
          textAlign: TextAlign.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              (isCelsius ? temp.celsius : temp.fahrenheit).toStringAsFixed(2),
              style: h3,
              textAlign: TextAlign.center,
            ),
            Text(isCelsius ? 'C' : 'F', style: h3),
          ],
        ),
        Text(
          weather.consolidatedWeather.first.weatherStateName,
          style: h3,
          textAlign: TextAlign.center,
        ),
        Align(child: _TemperatureToggle(isCelsius: isCelsius)),
      ],
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
    return ToggleButtons(
      selectedColor: Theme.of(context).accentColor,
      children: [
        for (final degree in kDegrees)
          Padding(padding: const EdgeInsets.all(12), child: Text(degree))
      ],
      isSelected: [isCelsius, !isCelsius],
      onPressed: (index) {
        var temp = index == 0 ? Temperature.celsius : Temperature.fahrenheit;
        context.read<WeatherCubit>().changeTemperature(temp);
      },
    );
  }
}
