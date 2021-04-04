import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:very_good_weather/weather/weather.dart';

part 'search_state.dart';
part 'search_cubit.freezed.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({
    required SearchLocation searchLocation,
  })   : _search = searchLocation,
        super(const SearchState.initial());

  final SearchLocation _search;

  Future<void> searchLocation(String query) async {
    emit(const SearchState.loading());

    final result = await _search(query);

    emit(
      result.fold(
        (error) => const SearchState.error(),
        (locations) => SearchState.loaded(locations),
      ),
    );
  }
}
