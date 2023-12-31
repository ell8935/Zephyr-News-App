import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zephy_news_app/bloc/articles/articles_bloc.dart';
import 'package:zephy_news_app/shared/models/article_model.dart';
import 'package:zephy_news_app/shared/widgets/custom_app_bar.dart';
import 'package:zephy_news_app/shared/widgets/custom_error_box.dart';
import 'package:zephy_news_app/shared/widgets/quick_search_bar.dart';
import 'package:zephy_news_app/modules/home/widgets/article_feed.dart';
import 'package:zephy_news_app/modules/home/widgets/greetings_card.dart';
import 'package:zephy_news_app/modules/home/widgets/article_feed_skeleton.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ArticleEntity> articles = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: BlocBuilder<ArticlesBloc, ArticlesState>(
        builder: (context, state) {
          if (state is ArticlesLoading) {
            return const ArticleFeedSkeleton();
          }
          if (state is ArticlesLoaded) {
            articles = state.articles;

            return ArticleFeed(
              articles: articles,
              topLevelWidget: const Column(
                children: [QuickSearchBar(), GreetingsCard()],
              ),
            );
          }
          if (state is ArticlesError) {
            if (state.statusCode == 'rateLimited' ||
                state.statusCode == 'apiKeyExhausted' ||
                state.statusCode == 'maximumResultsReached') {
              return Column(
                children: [
                  Expanded(
                    child: ArticleFeed(
                      articles: articles,
                      topLevelWidget: const Column(
                        children: [QuickSearchBar(), GreetingsCard()],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.blueAccent,
                    height: 100,
                    child: const Center(
                      child: Text(
                        "Slow down buddy you're reading too fast!,\n Try again later",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  )
                ],
              );
            } else {
              return CustomErrorBox(
                errorMessage: state.errorMessage,
                statusCode: state.statusCode,
              );
            }
          }
          return const Center(
            child: Text(
              "What are you waiting for?\n Search something!",
              style: TextStyle(fontSize: 20),
            ),
          );
        },
      ),
    );
  }
}
