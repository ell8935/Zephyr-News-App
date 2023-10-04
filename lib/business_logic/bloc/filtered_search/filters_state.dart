part of 'filters_bloc.dart';

sealed class FiltersState extends Equatable {
  const FiltersState();

  @override
  List<Object> get props => [];
}

final class FiltersInitial extends FiltersState {}

class FiltersLoaded extends FiltersState {
  final FiltersEntity filters; // Renamed to filters

  const FiltersLoaded({required this.filters});

  @override
  List<Object> get props => [filters];
}

class FiltersError extends FiltersState {
  final String errorMessage;

  const FiltersError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
