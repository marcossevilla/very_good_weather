part of 'search_cubit.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;

  const factory SearchState.loading() = _Loading;

  const factory SearchState.loaded(List<LocationResponse> locations) = _Loaded;

  const factory SearchState.error([String? message]) = _Error;
}
