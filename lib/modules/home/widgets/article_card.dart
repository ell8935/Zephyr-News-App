import 'package:flutter/material.dart';
import 'package:zephy_news_app/shared/models/article_model.dart';
import 'package:zephy_news_app/modules/details/pages/details_page.dart';

class ArticleCard extends StatelessWidget {
  final ArticleEntity article;

  const ArticleCard({
    Key? key,
    required this.article,
  }) : super(key: key);

  void _navigateToDetailsPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsPage(
          article: article,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkResponse(
          onTap: () => _navigateToDetailsPage(context),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  child: Hero(
                    tag: article.url,
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
                ),
                //facebook is here because the api return the url of facebook as author
                article.author.isEmpty | article.author.contains('facebook')
                    ? const SizedBox.shrink()
                    : Wrap(
                        children: [
                          const Text(
                            'by',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 126, 126, 126),
                            ),
                          ),
                          Text(
                            ' ${article.author}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 126, 126, 126),
                            ),
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
