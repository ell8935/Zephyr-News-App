import 'package:flutter/material.dart';
import 'package:zephy_news_app/modules/home/widgets/article_card_skeleton.dart';

class ArticleFeedSkeleton extends StatelessWidget {
  const ArticleFeedSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return const ArticleCardSkeleton();
      },
    );
  }
}
