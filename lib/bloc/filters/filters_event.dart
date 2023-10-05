part of 'filters_bloc.dart';

sealed class FiltersEvent extends Equatable {
  const FiltersEvent();

  @override
  List<Object> get props => [];
}

class LoadFilters extends FiltersEvent {
  final String? keywords;
  final String? from;
  final String? to;

  const LoadFilters({
    this.from,
    this.to,
    this.keywords,
  });

  @override
  List<Object> get props => [
        keywords ?? '',
        from ?? '',
        to ?? '',
      ];
}
