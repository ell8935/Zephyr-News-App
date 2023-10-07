import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_home_assignment/shared/api/get_articles.dart';
import 'package:move_home_assignment/shared/models/article_model.dart';
import 'package:move_home_assignment/shared/models/filters_model.dart';
import 'package:move_home_assignment/shared/utils/custom_exception.dart';

part 'articles_event.dart';
part 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  FiltersEntity filters = const FiltersEntity();

  ArticlesBloc() : super(ArticlesLoading()) {
    on<ArticlesLoadingEvent>(_onArticlesLoadingEvent);
    on<LoadArticlesWithFilters>(_onLoadArticlesWithFilters);
    on<LoadMoreArticlesWithFilters>(_onLoadMoreArticlesWithFilters);
  }

  FutureOr<void> _onArticlesLoadingEvent(
      ArticlesLoadingEvent event, Emitter<ArticlesState> emit) {
    emit(ArticlesLoading());
  }

  _onLoadArticlesWithFilters(
      LoadArticlesWithFilters event, Emitter<ArticlesState> emit) async {
    try {
      filters = event.filters;
      final articles = await getArticles(filters: event.filters);

      final List<ArticleEntity> articlesList = articles.map((articleData) {
        return ArticleEntity.fromJson(articleData);
      }).toList();

      emit(ArticlesLoaded(articles: articlesList));
    } catch (e) {
      if (e is CustomException) {
        emit(ArticlesError(errorMessage: e.message, statusCode: e.statusCode));
      } else {
        emit(const ArticlesError(
            errorMessage: 'Something went wrong', statusCode: 'sad'));
      }
    }
  }

  _onLoadMoreArticlesWithFilters(
      LoadMoreArticlesWithFilters event, Emitter<ArticlesState> emit) async {
    try {
      if (state is ArticlesLoaded) {
        // each page is 10 articles long
        final int page = (state as ArticlesLoaded).articles.length ~/ 10 + 1;

        final articles = await getArticles(filters: filters, page: page);

        final List<ArticleEntity> articlesList = articles.map((articleData) {
          return ArticleEntity.fromJson(articleData);
        }).toList();

        final List<ArticleEntity> newArticlesList = [
          ...(state as ArticlesLoaded).articles,
          ...articlesList
        ];

        emit(ArticlesLoaded(articles: newArticlesList));
      }
    } catch (e) {
      if (e is CustomException) {
        emit(ArticlesError(errorMessage: e.message, statusCode: e.statusCode));
      } else {
        emit(const ArticlesError(
            errorMessage: 'Something went wrong', statusCode: 'da'));
      }
    }
  }
}
