import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_home_assignment/bloc/articles/articles_bloc.dart';
import 'package:move_home_assignment/ui/modules/home/widgets/article_card.dart';
import 'package:move_home_assignment/ui/modules/home/widgets/greetings_card.dart';
import 'package:move_home_assignment/ui/modules/details/widgets/full_article.dart';
import 'package:move_home_assignment/ui/modules/home/widgets/article_feed_skeleton.dart';

class ArticleFeed extends StatelessWidget {
  final bool? isHomePage;
  final bool? isDetails;

  const ArticleFeed({
    super.key,
    this.isHomePage = false,
    this.isDetails = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesBloc, ArticlesState>(
      builder: (context, state) {
        if (state is ArticlesLoading) {
          return const ArticleFeedSkeleton();
        } else if (state is ArticlesLoaded) {
          return Expanded(
            child: ListView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemCount: state.articles.length,
              itemBuilder: (BuildContext context, int index) {
                final article = state.articles[index];
                if (index == 0 && isHomePage == true) {
                  return const GreetingsCard();
                }
                if (index == 0 && isDetails == true) {
                  return const FullArticle();
                }

                return ArticleCard(
                  article: article,
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
