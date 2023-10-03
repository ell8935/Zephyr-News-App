import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_home_assignment/data/models/filtered_search_model.dart';

part 'filtered_search_event.dart';
part 'filtered_search_state.dart';

class FilteredSearchBloc
    extends Bloc<FilteredSearchEvent, FilteredSearchState> {
  FilteredSearchBloc() : super(FilteredSearchInitial()) {
    on<LoadFilteredSearchQuery>(_mapLoadFilteredSearchQueryToState);
  }

  FutureOr<void> _mapLoadFilteredSearchQueryToState(
      LoadFilteredSearchQuery event, Emitter<FilteredSearchState> emit) async {
    try {
      // You can add your search logic here and create a search result
      // For example:
      // final searchResults = await performSearch(event.searchQuery);
      // emit(FilteredSearchLoaded(searchResults: searchResults));

      // For now, let's simulate a delay and return a placeholder result
      await Future.delayed(const Duration(seconds: 1));
      emit(
        FilteredSearchLoaded(
          filters: FilteredSearchEntity(keywords: event.searchQuery),
        ),
      );
    } catch (e) {
      emit(const FilteredSearchError(errorMessage: 'An error occurred'));
    }
  }
}
