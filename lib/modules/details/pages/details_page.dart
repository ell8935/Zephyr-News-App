import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_home_assignment/bloc/articles/articles_bloc.dart';
import 'package:move_home_assignment/shared/models/article_model.dart';
import 'package:move_home_assignment/shared/widgets/custom_app_bar.dart';
import 'package:move_home_assignment/shared/widgets/custom_error_box.dart';
import 'package:move_home_assignment/modules/home/widgets/article_feed.dart';
import 'package:move_home_assignment/modules/details/widgets/full_article.dart';
import 'package:move_home_assignment/modules/home/widgets/article_card_skeleton.dart';

class DetailsPage extends StatelessWidget {
  final ArticleEntity article;

  const DetailsPage({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    List<ArticleEntity> articles = [];

    return Scaffold(
      appBar: const CustomAppBar(),
      body: BlocBuilder<ArticlesBloc, ArticlesState>(
        builder: (context, state) {
          if (state is ArticlesLoading) {
            return const ArticleCardSkeleton();
          }
          if (state is ArticlesLoaded) {
            articles = state.articles;

            return ArticleFeed(
              articles: articles,
              topLevelWidget: FullArticle(article: article),
              excludeFromFeed: article,
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
                      topLevelWidget: FullArticle(article: article),
                      excludeFromFeed: article,
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
