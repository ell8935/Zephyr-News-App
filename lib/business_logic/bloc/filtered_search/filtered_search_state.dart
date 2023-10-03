part of 'filtered_search_bloc.dart';

sealed class FilteredSearchState extends Equatable {
  const FilteredSearchState();

  @override
  List<Object> get props => [];
}

final class FilteredSearchInitial extends FilteredSearchState {}

class FilteredSearchLoaded extends FilteredSearchState {
  final FilteredSearchEntity searchResults; // Renamed to searchResults

  const FilteredSearchLoaded({required this.searchResults});

  @override
  List<Object> get props => [searchResults];
}

class FilteredSearchError extends FilteredSearchState {
  final String errorMessage;

  const FilteredSearchError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
