part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

class SearchInitial extends SearchState {
  const SearchInitial();
}

class SearchLoading extends SearchState {
  const SearchLoading();
}

class SearchLoaded extends SearchState {
  const SearchLoaded(this.locations);

  final List<LocationResponse> locations;

  @override
  List<Object?> get props => [locations];
}

class SearchError extends SearchState {
  const SearchError({this.error});

  final String? error;

  @override
  List<Object?> get props => [error];
}
