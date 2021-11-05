import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_api/weather_api.dart';
import 'package:weather_repository/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit({
    required WeatherRepository weatherRepository,
  })  : _weatherRepository = weatherRepository,
        super(const WeatherInitial());

  final WeatherRepository _weatherRepository;

  Future<void> getWeather(int locationId) async {
    emit(const WeatherLoading());

    try {
      final weather = await _weatherRepository.getWeather(locationId);
      emit(WeatherLoaded(weather: weather));
    } catch (e) {
      emit(WeatherError(error: e.toString()));
    }
  }

  void changeTemperature(Temperature temperature) {
    final _state = state;
    if (_state is WeatherLoaded) {
      emit(
        WeatherLoaded(
          weather: _state.weather,
          temperature: temperature,
        ),
      );
    }
  }
}
