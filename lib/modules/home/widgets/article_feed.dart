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
    Key? key,
    this.topLevelWidget,
    this.excludeFromFeed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ArticleEntity> articles = [];

    return BlocBuilder<ArticlesBloc, ArticlesState>(
      builder: (context, state) {
        if (state is ArticlesLoading) {
          return const ArticleFeedSkeleton();
        }

        if (state is ArticlesLoaded) {
          articles = state.articles;
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
                itemCount: articles.length,
                itemBuilder: (BuildContext context, int index) {
                  final article = articles[index];
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
                },
              ),
            ),
          );
        }
        if (state is ArticlesError) {
          if (state.statusCode == 'apiKeyExhausted' ||
              state.statusCode == 'rateLimited') {
            return Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      itemCount: articles.length,
                      itemBuilder: (BuildContext context, int index) {
                        final article = articles[index];
                        final isTopLevel = index == 0 && topLevelWidget != null;
                        final isExcluded =
                            article.title == excludeFromFeed?.title;

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
                      },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.blueAccent,
                    height: 100,
                    child: Center(
                      child: Text(
                        "${state.errorMessage}Slow down buddy you're reading too fast!,\n Try again later",
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return Center(
              child: Column(
                children: [
                  CustomErrorMsg(
                    errorMsg: state.errorMessage,
                    statusCode: state.statusCode,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.all(10))),
                    onPressed: () {
                      context
                          .read<ArticlesBloc>()
                          .add(const LoadArticlesWithFilters());
                    },
                    child: const Text(
                      'Retry',
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                ],
              ),
            );
          }
        } else {
          return const Text('Press the button to load articles.');
        }
      },
    );
  }
}
