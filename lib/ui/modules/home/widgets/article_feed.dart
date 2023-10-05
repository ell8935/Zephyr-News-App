import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_home_assignment/bloc/articles/articles_bloc.dart';
import 'package:move_home_assignment/ui/modules/home/widgets/article_card.dart';
import 'package:move_home_assignment/ui/modules/home/widgets/article_feed_skeleton.dart';

class ArticleFeed extends StatelessWidget {
  final Widget? topLevelWidget;

  const ArticleFeed({
    super.key,
    this.topLevelWidget,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesBloc, ArticlesState>(
      builder: (context, state) {
        if (state is ArticlesLoading) {
          return const ArticleFeedSkeleton();
        }
        if (state is ArticlesError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Oops!'),
              const Text('Something went wrong'),
              Text(state.errorMessage),
              ElevatedButton(
                onPressed: () {
                  context
                      .read<ArticlesBloc>()
                      .add(const LoadArticlesWithFilters());
                },
                child: const Text('Retry'),
              ),
            ],
          );
        }

        if (state is ArticlesLoaded) {
          return Expanded(
            child: ListView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemCount: state.articles.length,
              itemBuilder: (BuildContext context, int index) {
                final article = state.articles[index];
                if (index == 0 && topLevelWidget != null) {
                  return Column(
                    children: [
                      topLevelWidget!,
                      ArticleCard(article: article),
                    ],
                  );
                }

                return ArticleCard(
                  article: article,
                );
              },
            ),
          );
        } else {
          return const Text('Press the button to load articles.');
        }
      },
    );
  }
}
