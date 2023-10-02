import 'package:flutter/material.dart';
import 'package:move_home_assignment/presentation/modules/home/widgets/article_card.dart';

class ArticleFeed extends StatelessWidget {
  const ArticleFeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return const ArticleCard(
                title: 'title',
                author: 'author',
                description: 'description',
              );
            },
          ),
        )
      ],
    );
  }
}
