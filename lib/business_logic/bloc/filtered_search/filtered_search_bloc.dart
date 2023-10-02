import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'filtered_search_event.dart';
part 'filtered_search_state.dart';

class FilteredSearchBloc extends Bloc<FilteredSearchEvent, FilteredSearchState> {
  FilteredSearchBloc() : super(FilteredSearchInitial()) {
    on<FilteredSearchEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
