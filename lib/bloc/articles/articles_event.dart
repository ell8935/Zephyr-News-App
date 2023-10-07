part of 'articles_bloc.dart';

sealed class ArticlesEvent extends Equatable {
  const ArticlesEvent();

  @override
  List<Object> get props => [];
}

class LoadArticlesWithFilters extends ArticlesEvent {
  final bool? byCategory;
  final FiltersEntity filters;

  const LoadArticlesWithFilters(
      {this.byCategory, this.filters = const FiltersEntity()});

  @override
  List<Object> get props => [filters, byCategory ?? ''];
}

class ArticlesLoadingEvent extends ArticlesEvent {
  @override
  List<Object> get props => [];
}
