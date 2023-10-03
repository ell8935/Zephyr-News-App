part of 'filtered_search_bloc.dart';

sealed class FilteredSearchEvent extends Equatable {
  const FilteredSearchEvent();

  @override
  List<Object> get props => [];
}

class LoadFilteredSearchKeywords extends FilteredSearchEvent {
  final String keywords;

  const LoadFilteredSearchKeywords({
    required this.keywords,
  });

  @override
  List<Object> get props => [keywords];
}

class LoadFilteredSearchDateRange extends FilteredSearchEvent {
  final String from;
  final String to;

  const LoadFilteredSearchDateRange({
    required this.from,
    required this.to,
  });

  @override
  List<Object> get props => [from, to];
}

class LoadFilteredSearchSortMethod extends FilteredSearchEvent {
  final String sortBy;

  const LoadFilteredSearchSortMethod({
    required this.sortBy,
  });

  @override
  List<Object> get props => [sortBy];
}
