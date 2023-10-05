import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_home_assignment/shared/models/filters_model.dart';

part 'filters_event.dart';
part 'filters_state.dart';

class FiltersBloc extends Bloc<FiltersEvent, FiltersState> {
  FiltersBloc() : super(FiltersInitial()) {
    on<LoadFilters>(_mapLoadFilters);
  }

  FutureOr<void> _mapLoadFilters(
      LoadFilters event, Emitter<FiltersState> emit) async {
    try {
      FiltersEntity initialFilters = const FiltersEntity();

      final updatedFilters = initialFilters.copyWith(
          keywords: event.keywords, from: event.from, to: event.to);

      emit(
        FiltersLoaded(
          filters: FiltersEntity(
              keywords: updatedFilters.keywords,
              from: updatedFilters.from,
              to: updatedFilters.to),
        ),
      );
    } catch (e) {
      emit(const FiltersError(errorMessage: 'An error occurred'));
    }
  }
}
