import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_home_assignment/bloc/articles/articles_bloc.dart';
import 'package:move_home_assignment/modules/home/widgets/article_card.dart';
import 'package:move_home_assignment/modules/home/widgets/article_feed_skeleton.dart';
import 'package:move_home_assignment/shared/models/article_model.dart';
import 'package:move_home_assignment/shared/widgets/custom_error_msg.dart';

class ArticleFeed extends StatelessWidget {
  final ArticleEntity? excludeFromFeed;
  final Widget? topLevelWidget;

  const ArticleFeed({
    super.key,
    this.topLevelWidget,
    this.excludeFromFeed,
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
            children: [
              CustomErrorMsg(
                errorMsg: state.errorMessage,
              ),
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
          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (scrollInfo is ScrollEndNotification &&
                  scrollInfo.metrics.extentAfter == 0) {
                context
                    .read<ArticlesBloc>()
                    .add(const LoadMoreArticlesWithFilters());
              }
              return false;
            },
            child: Expanded(
              child: ListView.builder(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  itemCount: state.articles.length,
                  itemBuilder: (BuildContext context, int index) {
                    final article = state.articles[index];
                    final isTopLevel = index == 0 && topLevelWidget != null;
                    final isExcluded = article.title == excludeFromFeed?.title;

                    if (isTopLevel) {
                      return Column(children: [
                        topLevelWidget!,
                        if (!isExcluded) ArticleCard(article: article),
                      ]);
                    }

                    if (isExcluded) {
                      return const SizedBox();
                    }

                    return ArticleCard(article: article);
                  }),
            ),
          );
        } else {
          return const Text('Press the button to load articles.');
        }
      },
    );
  }
}
