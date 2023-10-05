import 'package:flutter/material.dart';
import 'package:move_home_assignment/modules/details/widgets/full_article.dart';
import 'package:move_home_assignment/modules/home/widgets/article_feed.dart';
import 'package:move_home_assignment/shared/widgets/custom_app_bar.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Column(
        children: [
          CustomAppBar(),
          ArticleFeed(
            topLevelWidget: FullArticle(),
          )
        ],
      ),
    );
  }
}
