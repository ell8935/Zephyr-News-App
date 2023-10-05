part of 'focused_article_bloc.dart';

sealed class FocusedArticleState extends Equatable {
  const FocusedArticleState();

  @override
  List<Object> get props => [];
}

final class FocusedArticleInitial extends FocusedArticleState {}

final class FocusedArticleLoaded extends FocusedArticleState {
  final ArticleEntity article;

  const FocusedArticleLoaded({required this.article});

  @override
  List<Object> get props => [article];
}
