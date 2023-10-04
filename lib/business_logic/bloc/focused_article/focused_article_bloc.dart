import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:move_home_assignment/data/models/articles_model.dart';

part 'focused_article_event.dart';
part 'focused_article_state.dart';

class FocusedArticleBloc
    extends Bloc<FocusedArticleEvent, FocusedArticleState> {
  FocusedArticleBloc() : super(FocusedArticleInitial()) {
    on<LoadFocusedArticle>(_onLoadArticles);
  }

  FutureOr<void> _onLoadArticles(
      LoadFocusedArticle event, Emitter<FocusedArticleState> emit) {
    try {
      print(event.article);
      if (event.article != null) {
        ArticleEntity updatedArticle = ArticleEntity(
          url: event.article!.url,
          title: event.article!.title,
          author: event.article!.author,
          content: event.article!.content,
          urlToImage: event.article!.urlToImage,
          publishedAt: event.article!.publishedAt,
          description: event.article!.description,
        );

        emit(FocusedArticleLoaded(article: updatedArticle));
      } else {
        // Handle the case where event.article or its url is null
        // You can emit an error state or handle it as needed.
        // emit(FocusedArticleError("Article or URL is null"));
      }
    } catch (e) {
      print(e);
      // yield ArticlesError("Failed to load articles: $e");
    }
  }
}
