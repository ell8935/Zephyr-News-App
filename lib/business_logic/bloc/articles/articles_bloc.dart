import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:move_home_assignment/data/models/articles_model.dart';

part 'articles_event.dart';
part 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  ArticlesBloc() : super(ArticlesLoading()) {
    on<LoadArticles>(_onLoadArticles);
    on<AddArticles>(_onAddArticles);
    on<DeleteArticles>(_onDeleteArticles);
    on<UpdateArticles>(_onUpdateArticles);
  }

  void _onLoadArticles(LoadArticles event, Emitter<ArticlesState> emit) {
    emit(
      ArticlesLoaded(articles: event.article),
    );
  }

  void _onAddArticles(AddArticles event, Emitter<ArticlesState> emit) {}

  void _onDeleteArticles(DeleteArticles event, Emitter<ArticlesState> emit) {}

  void _onUpdateArticles(UpdateArticles event, Emitter<ArticlesState> emit) {}
}
