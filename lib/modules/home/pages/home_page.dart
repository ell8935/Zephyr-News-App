import 'package:flutter/material.dart';
import 'package:move_home_assignment/modules/home/widgets/article_feed.dart';
import 'package:move_home_assignment/modules/home/widgets/greetings_card.dart';
import 'package:move_home_assignment/shared/widgets/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: CustomAppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ArticleFeed(
              topLevelWidget: GreetingsCard(),
            )
          ],
        ));
  }
}
