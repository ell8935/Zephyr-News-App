import 'package:flutter/material.dart';
import 'package:move_home_assignment/presentation/modules/home/widgets/article_card_skeleton.dart';

class ArticleFeedSkeleton extends StatelessWidget {
  const ArticleFeedSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return const ArticleCardSkeleton();
        },
      ),
    );
  }
}