part of 'articles_bloc.dart';

sealed class ArticlesEvent extends Equatable {
  const ArticlesEvent();

  @override
  List<Object> get props => [];
}

class LoadArticles extends ArticlesEvent {
  final List<ArticleEntity> article;

  const LoadArticles({
    this.article = const <ArticleEntity>[],
  });

  @override
  List<Object> get props => [article];
}

class LoadArticlesWithFilters extends ArticlesEvent {
  final FiltersEntity filters;

  const LoadArticlesWithFilters({
    required this.filters,
  });

  @override
  List<Object> get props => [filters];
}
