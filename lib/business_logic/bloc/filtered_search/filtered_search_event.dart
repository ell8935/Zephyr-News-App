part of 'filtered_search_bloc.dart';

sealed class FilteredSearchEvent extends Equatable {
  const FilteredSearchEvent();

  @override
  List<Object> get props => [];
}

class LoadFilteredSearchParam extends FilteredSearchEvent {
  final List<FilteredSearchEntity> filteredSearch;

  const LoadFilteredSearchParam({
    this.filteredSearch = const <FilteredSearchEntity>[],
  });

  @override
  List<Object> get props => [filteredSearch];
}
