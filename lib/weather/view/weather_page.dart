import 'package:flutter/material.dart';

/// WeatherPage to show Weather information based on user's input
class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  /// Static method to return the widget as a PageRoute
  static Route go() {
    return MaterialPageRoute<void>(builder: (_) => const WeatherPage());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('This is WeatherPage'),
      ),
    );
  }
}
