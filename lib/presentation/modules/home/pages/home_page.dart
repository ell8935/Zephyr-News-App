import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_home_assignment/business_logic/bloc/articles/articles_bloc.dart';
import 'package:move_home_assignment/data/models/articles_model.dart';
import 'package:move_home_assignment/presentation/modules/home/widgets/article_card.dart';
import 'package:move_home_assignment/presentation/modules/shared/widgets/custom_search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Articles> articleList = [];

  // Callback function to handle search
  void handleSearch() {
    // ArticlesBloc().add(const LoadArticles());
    // Implement your search logic here
    // For example, you can dispatch an event to the ArticlesBloc
    // BlocProvider.of<ArticlesBloc>(context).add(const LoadArticles());
    BlocProvider.of<ArticlesBloc>(context).add(const LoadArticles());

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomSearchBar(onSearchPressed: handleSearch), // Pass the callback

          BlocConsumer<ArticlesBloc, ArticlesState>(
            listener: (context, state) {
              if (state is ArticlesError) {
                print(Error());
              }
            },
            builder: (context, state) {
              if (state is ArticlesLoading) {
                return const CircularProgressIndicator();
              } else if (state is ArticlesLoaded) {
                print('THIS IS IN THE BlocBuilder ${state.articles[0]}');

                return Expanded(
                  child: ListView.builder(
                    itemCount: state.articles.length,
                    itemBuilder: (BuildContext context, int index) {
                      final article = state.articles[index];
                      return ArticleCard(
                        title: article.title,
                        author: article.author,
                        urlToImage: article.urlToImage,
                        description: article.description,
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
          ),
        ],
      ),
    );
  }
}
