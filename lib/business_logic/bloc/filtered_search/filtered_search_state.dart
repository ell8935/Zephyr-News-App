part of 'filtered_search_bloc.dart';

sealed class FilteredSearchState extends Equatable {
  const FilteredSearchState();
  
  @override
  List<Object> get props => [];
}

final class FilteredSearchInitial extends FilteredSearchState {}
