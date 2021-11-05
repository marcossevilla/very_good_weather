import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pedantic/pedantic.dart';
import 'package:very_good_weather/weather/weather.dart';

class LocationsList extends StatelessWidget {
  const LocationsList({
    Key? key,
    required this.locations,
  }) : super(key: key);

  final List<LocationResponse> locations;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        for (final location in locations)
          ListTile(
            title: Text(location.title),
            subtitle: Text(location.lattLong),
            onTap: () async {
              final id = location.woeid;
              unawaited(context.read<WeatherCubit>().getWeather(id));
              await Navigator.of(context).push(WeatherPage.go(id));
            },
          ),
      ]),
    );
  }
}
