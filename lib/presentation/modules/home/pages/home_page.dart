import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_home_assignment/business_logic/bloc/articles/articles_bloc.dart';
import 'package:move_home_assignment/data/models/articles_model.dart';
import 'package:move_home_assignment/presentation/modules/home/widgets/article_feed.dart';
import 'package:move_home_assignment/presentation/modules/shared/api/get_articles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Articles> articleList = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesBloc, ArticlesState>(
      builder: (context, state) {
        if (state is ArticlesLoading) {
          return const CircularProgressIndicator();
        }
        if (state is ArticlesLoaded) {
          return Container(
            child: Text(state.articles[2].author),
          );
          // const ArticleFeed(); // Assuming ArticleFeed takes articleList as an argument
        } else {
          return Container();
        }
      },
    );
  }
}
