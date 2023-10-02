part of 'articles_bloc.dart';

sealed class ArticlesState extends Equatable {
  const ArticlesState();

  @override
  List<Object> get props => [];
}

final class ArticlesLoading extends ArticlesState {}

final class ArticlesLoaded extends ArticlesState {
  final List<Articles> articles;

  const ArticlesLoaded({this.articles = const <Articles>[]});
}
