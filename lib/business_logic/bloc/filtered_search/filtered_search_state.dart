part of 'filtered_search_bloc.dart';

sealed class FilteredSearchState extends Equatable {
  const FilteredSearchState();

  @override
  List<Object> get props => [];
}

final class FilteredSearchInitial extends FilteredSearchState {}

final class FilteredSearchLoaded extends FilteredSearchState {
  final List<FilteredSearchEntity> articles;

  const FilteredSearchLoaded({this.articles = const <FilteredSearchEntity>[]});

  @override
  List<Object> get props => [articles];
}

class FilteredSearchError extends FilteredSearchState {
  final String errorMessage;

  const FilteredSearchError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
