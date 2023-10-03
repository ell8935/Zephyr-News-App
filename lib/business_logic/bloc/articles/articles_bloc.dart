import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:move_home_assignment/data/models/articles_model.dart';
import 'package:move_home_assignment/presentation/modules/shared/api/get_articles.dart';

part 'articles_event.dart';
part 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  ArticlesBloc() : super(ArticlesLoading()) {
    on<LoadArticles>(_onLoadArticles);
  }

  void _onLoadArticles(LoadArticles event, Emitter<ArticlesState> emit) async {
    try {
      final articles = await getArticles();

      final List<Articles> articlesList = articles.map((articleData) {
        return Articles.fromJson(articleData);
      }).toList();

      emit(ArticlesLoaded(articles: articlesList));
      print('THIS IS IN THE BLOC  ${articlesList[0].title}');

      print('ArticlesLoaded emitted');
    } catch (e) {
      print(e);
      emit(const ArticlesError(errorMessage: 'Failed to load articles'));
    }
  }
}
