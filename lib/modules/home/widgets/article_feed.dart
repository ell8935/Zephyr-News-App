import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_home_assignment/bloc/articles/articles_bloc.dart';
import 'package:move_home_assignment/modules/home/widgets/article_card.dart';
import 'package:move_home_assignment/shared/models/article_model.dart';

class ArticleFeed extends StatelessWidget {
  final List<ArticleEntity> articles;
  final ArticleEntity? excludeFromFeed;
  final Widget? topLevelWidget;

  const ArticleFeed({
    Key? key,
    this.topLevelWidget,
    this.excludeFromFeed,
    required this.articles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo is ScrollEndNotification &&
            scrollInfo.metrics.extentAfter == 0) {
          context.read<ArticlesBloc>().add(const LoadMoreArticlesWithFilters());
        }
        return false;
      },
      child: ListView.builder(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
    );
  }
}
