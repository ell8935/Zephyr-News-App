part of 'focused_article_bloc.dart';

sealed class FocusedArticleState extends Equatable {
  const FocusedArticleState();
  
  @override
  List<Object> get props => [];
}

final class FocusedArticleInitial extends FocusedArticleState {}
