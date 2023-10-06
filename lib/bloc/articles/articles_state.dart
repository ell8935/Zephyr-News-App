part of 'articles_bloc.dart';

sealed class ArticlesState extends Equatable {
  const ArticlesState();

  @override
  List<Object> get props => [];
}

final class ArticlesLoading extends ArticlesState {}

final class ArticlesLoaded extends ArticlesState {
  final List<ArticleEntity> articles;

  const ArticlesLoaded({this.articles = const <ArticleEntity>[]});

  @override
  List<Object> get props => [articles];
}

class ArticlesError extends ArticlesState {
  final String errorMessage;
  final String? statusCode;
  const ArticlesError({required this.errorMessage, this.statusCode});

  @override
  List<Object> get props => [errorMessage, statusCode!];

  @override
  bool? get stringify => true;
}
