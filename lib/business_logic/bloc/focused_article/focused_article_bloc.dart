import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'focused_article_event.dart';
part 'focused_article_state.dart';

class FocusedArticleBloc extends Bloc<FocusedArticleEvent, FocusedArticleState> {
  FocusedArticleBloc() : super(FocusedArticleInitial()) {
    on<FocusedArticleEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
