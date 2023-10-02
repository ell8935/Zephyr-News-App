import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:move_home_assignment/data/models/articles_model.dart';
import 'package:move_home_assignment/presentation/modules/shared/api/get_articles.dart';

part 'articles_event.dart';
part 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  ArticlesBloc() : super(ArticlesLoading()) {
    on<LoadArticles>(_onLoadArticles);
    on<AddArticles>(_onAddArticles);
    on<DeleteArticles>(_onDeleteArticles);
    on<UpdateArticles>(_onUpdateArticles);
  }

  void _onLoadArticles(LoadArticles event, Emitter<ArticlesState> emit) async {
    try {
      final articles = await getArticles();

      // Convert the list of dynamic objects to a list of Articles
      final List<Articles> articlesList = articles.map((articleData) {
        return Articles.fromJson(
            articleData); // Assuming you have a fromJson method in your Articles class
      }).toList();

      emit(ArticlesLoaded(articles: articlesList));
    } catch (e) {
      print(e);
      // Handle errors, for example, emit an error state
    }
  }

  void _onAddArticles(AddArticles event, Emitter<ArticlesState> emit) {}

  void _onDeleteArticles(DeleteArticles event, Emitter<ArticlesState> emit) {}

  void _onUpdateArticles(UpdateArticles event, Emitter<ArticlesState> emit) {}
}
