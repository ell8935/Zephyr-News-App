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
      LoadFocusedArticle event, Emitter<FocusedArticleState> emit) async* {
    yield FocusedArticleInitial();
    try {
      // Fetch articles here. Replace this with your actual data fetching logic.
      const ArticleEntity article = ArticleEntity(
          url: 's',
          title: 's',
          author: 's',
          content: 's',
          urlToImage: 's',
          publishedAt: 's',
          description: 's');
      yield const FocusedArticleLoaded(article: article);
    } catch (e) {
      print(e);
      // yield ArticlesError("Failed to load articles: $e");
    }
  }
}
