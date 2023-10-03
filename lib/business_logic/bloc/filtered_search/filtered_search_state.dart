part of 'filtered_search_bloc.dart';

sealed class FilteredSearchState extends Equatable {
  const FilteredSearchState();

  @override
  List<Object> get props => [];
}

final class FilteredSearchInitial extends FilteredSearchState {}

class FilteredSearchLoaded extends FilteredSearchState {
  final FilteredSearchEntity filters; // Renamed to filters

  const FilteredSearchLoaded({required this.filters});

  @override
  List<Object> get props => [filters];
}

class FilteredSearchError extends FilteredSearchState {
  final String errorMessage;

  const FilteredSearchError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
