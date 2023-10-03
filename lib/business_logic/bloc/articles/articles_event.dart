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

class AddArticles extends ArticlesEvent {
  final Articles article;

  const AddArticles({required this.article});

  @override
  List<Object> get props => [article];
}

class UpdateArticles extends ArticlesEvent {
  final Articles article;

  const UpdateArticles({required this.article});

  @override
  List<Object> get props => [article];
}

class DeleteArticles extends ArticlesEvent {
  final Articles article;

  const DeleteArticles({required this.article});

  @override
  List<Object> get props => [article];
}
