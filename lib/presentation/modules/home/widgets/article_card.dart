import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_home_assignment/business_logic/bloc/focused_article/focused_article_bloc.dart';
import 'package:move_home_assignment/data/models/articles_model.dart';
import 'package:move_home_assignment/presentation/modules/details/pages/details_page.dart';

class ArticleCard extends StatelessWidget {
  final ArticleEntity article;

  const ArticleCard({
    Key? key,
    required this.article,
  }) : super(key: key);

  // void handleFieldChange(BuildContext context, FiltersEntity currentFilters,
  //     String query, String fieldName) {
  //   FiltersEntity updatedFilters;
  //   switch (fieldName) {
  //     case 'keywords':
  //       updatedFilters = currentFilters.copyWith(keywords: query);
  //       break;
  //     case 'sortBy':
  //       updatedFilters = currentFilters.copyWith(sortBy: query);
  //       break;
  //     default:
  //       updatedFilters = currentFilters;
  //   }
  //   BlocProvider.of<FiltersBloc>(context).add(LoadFilters(
  //     keywords: updatedFilters.keywords,
  //     from: updatedFilters.from,
  //     to: updatedFilters.to,
  //     sortBy: updatedFilters.sortBy,
  //   ));
  // }

//   void _handleDispatchArticle(BuildContext context){

//     BlocProvider.of<FocusedArticleBloc>(context).add(LoadFocusedArticle(
// article: author
//     ));

//   }
  void _navigateToDetailsPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsPage(
          title: article.title,
          author: article.author,
          urlToImage: article.urlToImage,
          description: article.description,
          content: article.content,
          url: article.url,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: () => _navigateToDetailsPage(context),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    article.urlToImage,
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      // Display a local image from assets when the network image fails to load
                      return Image.asset(
                        'assets/images/imageNotFound.png',
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                Wrap(
                  children: [
                    const Text(
                      'by',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 126, 126, 126)),
                    ),
                    Text(
                      ' ${article.author}',
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 126, 126, 126)),
                    ),
                  ],
                ),
                Text(
                  article.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  article.description,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(
          thickness: 0.5,
          color: Color.fromARGB(255, 212, 211, 211),
        ),
      ],
    );
  }
}
