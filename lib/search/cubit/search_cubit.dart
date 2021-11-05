import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:weather_api/weather_api.dart';
import 'package:weather_repository/weather_repository.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({
    required WeatherRepository weatherRepository,
  })  : _weatherRepository = weatherRepository,
        super(const SearchInitial());

  final WeatherRepository _weatherRepository;

  Future<void> searchLocation(String query) async {
    emit(const SearchLoading());

    try {
      final locations = await _weatherRepository.searchLocation(query);
      emit(SearchLoaded(locations));
    } catch (e) {
      emit(SearchError(error: e.toString()));
    }
  }
}
