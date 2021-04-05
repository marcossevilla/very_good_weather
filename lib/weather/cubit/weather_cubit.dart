import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather/weather.dart';

part 'weather_state.dart';
part 'weather_cubit.freezed.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit({
    required GetWeather getWeather,
  })   : _getWeather = getWeather,
        super(const WeatherState.initial());

  final GetWeather _getWeather;

  Future<void> getWeather(int locationId) async {
    emit(const WeatherState.loading());

    final result = await _getWeather(locationId);

    emit(
      result.fold(
        (error) => const WeatherState.error(),
        (weather) => WeatherState.loaded(weather, Temperature.celsius),
      ),
    );
  }

  void changeTemperature(Temperature temperature) {
    state.maybeWhen(
      loaded: (weather, _) => emit(WeatherState.loaded(weather, temperature)),
      orElse: () {},
    );
  }
}
