import 'package:flutter/material.dart';
import 'package:move_home_assignment/presentation/modules/shared/widgets/custom_app_bar.dart';
import 'package:move_home_assignment/presentation/modules/home/widgets/article_feed.dart'; // Import the ArticleFeed widget

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
            isDetails: true,
          )
        ],
      ),
    );
  }
}
