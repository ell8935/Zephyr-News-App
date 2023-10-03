import 'package:flutter/material.dart';
import 'package:move_home_assignment/presentation/modules/home/widgets/article_feed.dart';
import 'package:move_home_assignment/presentation/modules/shared/widgets/filter_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [ArticleFeed(), FilterBar()],
    );
  }
}
