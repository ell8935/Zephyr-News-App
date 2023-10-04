part of 'focused_article_bloc.dart';

sealed class FocusedArticleEvent extends Equatable {
  const FocusedArticleEvent();

  @override
  List<Object> get props => [];
}

class LoadFocusedArticle extends FocusedArticleEvent {
  final ArticleEntity? article;

  const LoadFocusedArticle({
    this.article,
  });

  @override
  List<Object> get props => [article ?? ''];
}
