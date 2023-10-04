import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_home_assignment/business_logic/bloc/articles/articles_bloc.dart';
import 'package:move_home_assignment/presentation/modules/home/widgets/article_card.dart';
import 'package:move_home_assignment/presentation/modules/home/widgets/article_card_skeleton.dart';

class ArticleFeed extends StatelessWidget {
  const ArticleFeed({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesBloc, ArticlesState>(
      builder: (context, state) {
        if (state is ArticlesLoading) {
          return Expanded(
            child: ListView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return const ArticleCardSkeleton();
              },
            ),
          );
        } else if (state is ArticlesLoaded) {
          return Expanded(
            child: ListView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemCount: state.articles.length,
              itemBuilder: (BuildContext context, int index) {
                final article = state.articles[index];

                return ArticleCard(
                  title: article.title,
                  author: article.author,
                  urlToImage: article.urlToImage,
                  description: article.description,
                  content: article.content,
                  url: article.url,
                );
              },
            ),
          );
        } else if (state is ArticlesError) {
          return Text('Error: ${state.errorMessage}');
        } else {
          return const Text('Press the button to load articles.');
        }
      },
    );
  }
}
