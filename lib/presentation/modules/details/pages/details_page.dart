import 'package:flutter/material.dart';
import 'package:move_home_assignment/presentation/modules/shared/widgets/custom_app_bar.dart';
import 'package:move_home_assignment/presentation/modules/home/widgets/article_feed.dart'; // Import the ArticleFeed widget

class DetailsPage extends StatelessWidget {
  final String title;
  final String author;
  final String urlToImage;
  final String description;
  final String content;
  final String url;

  const DetailsPage({
    super.key,
    required this.title,
    required this.author,
    required this.urlToImage,
    required this.description,
    required this.content,
    this.url = '',
  });

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Column(
        children: [
          CustomAppBar(),
          ArticleFeed(
            isDetails: true,
          )
        ],
      ),
    );
  }
}
