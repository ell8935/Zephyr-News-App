import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:move_home_assignment/data/models/filtered_search_model.dart';

part 'filtered_search_event.dart';
part 'filtered_search_state.dart';

class FilteredSearchBloc
    extends Bloc<FilteredSearchEvent, FilteredSearchState> {
  FilteredSearchBloc() : super(FilteredSearchInitial()) {
    on<LoadFilteredSearchQuery>(_onLoadFilteredSearchQuery);
  }

  _onLoadFilteredSearchQuery(
      LoadFilteredSearchQuery event, Emitter<FilteredSearchState> emit) async {}
}
