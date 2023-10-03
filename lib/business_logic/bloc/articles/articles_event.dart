part of 'articles_bloc.dart';

sealed class ArticlesEvent extends Equatable {
  const ArticlesEvent();

  @override
  List<Object> get props => [];
}

class LoadArticles extends ArticlesEvent {
  final List<Articles> article;

  const LoadArticles({
    this.article = const <Articles>[],
  });

  @override
  List<Object> get props => [article];
}
