part of 'articles_bloc.dart';

sealed class ArticlesEvent extends Equatable {
  const ArticlesEvent();

  @override
  List<Object> get props => [];
}

class LoadArticlesWithFilters extends ArticlesEvent {
  final FiltersEntity filters;

  const LoadArticlesWithFilters({
    this.filters = const FiltersEntity(),
  });

  @override
  List<Object> get props => [filters];
}
