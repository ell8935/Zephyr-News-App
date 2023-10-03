import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:move_home_assignment/data/models/filtered_search_model.dart';

part 'filtered_search_event.dart';
part 'filtered_search_state.dart';

class FilteredSearchBloc
    extends Bloc<FilteredSearchEvent, FilteredSearchState> {
  FilteredSearchBloc() : super(FilteredSearchInitial()) {
    // on<LoadFilteredSearchParam>(_onLoadFilteredSearchParam);
  }

  // _onLoadFilteredSearchParam(LoadFilteredSearchParam event, Emitter<FilteredSearchState> emit) async {
  //   try {
  //     final searchParams = await getArticles();

  //     final List<FilteredSearchEntity> articlesList = articles.map((articleData) {
  //       return FilteredSearchEntity.fromJson(articleData);
  //     }).toList();

  //     emit(FilteredSearchLoaded(articles: articlesList));
  //     print('ArticlesLoaded emitted');
  //   } catch (e) {
  //     emit(const FilteredSearchError(errorMessage: 'Failed to load articles'));
  //   }
  // }
}
