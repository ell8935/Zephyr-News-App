part of 'filtered_search_bloc.dart';

sealed class FilteredSearchEvent extends Equatable {
  const FilteredSearchEvent();

  @override
  List<Object> get props => [];
}

class LoadFilteredSearchQuery extends FilteredSearchEvent {
  final String searchQuery;

  const LoadFilteredSearchQuery({
    required this.searchQuery,
  });

  @override
  List<Object> get props => [searchQuery];
}
