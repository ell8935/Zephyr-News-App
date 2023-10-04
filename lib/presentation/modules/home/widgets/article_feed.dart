import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:move_home_assignment/business_logic/bloc/articles/articles_bloc.dart';
import 'package:move_home_assignment/presentation/modules/home/widgets/article_card.dart';
import 'package:move_home_assignment/presentation/modules/home/widgets/article_card_skeleton.dart';

class ArticleFeed extends StatelessWidget {
  final bool? isHomePage; // Add this line

  const ArticleFeed({
    super.key,
    this.isHomePage = false,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesBloc, ArticlesState>(
      builder: (context, state) {
        if (state is ArticlesLoading) {
          return Expanded(
            child: ListView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return const ArticleCardSkeleton();
              },
            ),
          );
        } else if (state is ArticlesLoaded) {
          return Expanded(
            child: ListView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemCount: state.articles.length,
              itemBuilder: (BuildContext context, int index) {
                final today = DateFormat('EEEE').format(DateTime.now());

                final article = state.articles[index];
                if (index == 0 && isHomePage == true) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "$today's Top Stories",
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                            ),
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "HERE'S THE DEAL",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black,
                                ),
                              ),
                              Divider(
                                color: Colors.black,
                                thickness: 2,
                                height: 0,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return ArticleCard(
                  title: article.title,
                  author: article.author,
                  urlToImage: article.urlToImage,
                  description: article.description,
                  content: article.content,
                  url: article.url,
                );
              },
            ),
          );
        } else if (state is ArticlesError) {
          return Text('Error: ${state.errorMessage}');
        } else {
          return const Text('Press the button to load articles.');
        }
      },
    );
  }
}
