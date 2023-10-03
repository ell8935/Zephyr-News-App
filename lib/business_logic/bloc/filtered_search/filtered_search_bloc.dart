import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_home_assignment/data/models/filtered_search_model.dart';

part 'filtered_search_event.dart';
part 'filtered_search_state.dart';

class FilteredSearchBloc
    extends Bloc<FilteredSearchEvent, FilteredSearchState> {
  FilteredSearchBloc() : super(FilteredSearchInitial()) {
    on<LoadFilteredSearchKeywords>(_mapLoadFilteredSearchKeywords);
    // on<LoadFilteredSearchDateRange>(_mapLoadFilteredSearchQueryToState);
    // on<LoadFilteredSearchSortMethod>(_mapLoadFilteredSearchQueryToState);
  }

  FutureOr<void> _mapLoadFilteredSearchKeywords(
      LoadFilteredSearchKeywords event,
      Emitter<FilteredSearchState> emit) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      emit(
        FilteredSearchLoaded(
          filters: FilteredSearchEntity(keywords: event.keywords),
        ),
      );
    } catch (e) {
      emit(const FilteredSearchError(errorMessage: 'An error occurred'));
    }
  }
}
