import 'package:flutter/material.dart';
import 'package:move_home_assignment/modules/details/widgets/full_article.dart';
import 'package:move_home_assignment/modules/home/widgets/article_feed.dart';
import 'package:move_home_assignment/shared/models/article_model.dart';
import 'package:move_home_assignment/shared/widgets/custom_app_bar.dart';

class DetailsPage extends StatelessWidget {
  final ArticleEntity article;

  const DetailsPage({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          const CustomAppBar(),
          ArticleFeed(
            excludeFromFeed: article,
            topLevelWidget: FullArticle(article: article),
          )
        ],
      ),
    );
  }
}
