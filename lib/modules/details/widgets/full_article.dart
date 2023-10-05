import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_home_assignment/modules/home/widgets/article_card_skeleton.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:move_home_assignment/bloc/focused_article/focused_article_bloc.dart';

class FullArticle extends StatelessWidget {
  const FullArticle({
    Key? key,
  }) : super(key: key);

  Future<void> _launchURL(String url) async {
    final parsedUrl = Uri.parse(url);
    if (await canLaunchUrl(parsedUrl)) {
      await launchUrl(parsedUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FocusedArticleBloc, FocusedArticleState>(
      builder: (context, state) {
        if (state is FocusedArticleInitial) {
          return const ArticleCardSkeleton();
        }
        if (state is FocusedArticleLoaded) {
          final article = state.article;

          return Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Hero(
                  tag: article.url,
                  child: Image.network(
                    article.urlToImage,
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      //local image from assets when the network image fails to load
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
                const SizedBox(
                  height: 10,
                ),
                Text(
                  article.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  '${article.content.substring(0, article.content.length - 16)}...', //this is to remove the tranctued text u get from the api
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 16.0),
                article.url == ''
                    ? const Center(child: Text('Sorry this is the end'))
                    : Center(
                        child: ElevatedButton(
                          onPressed: () => _launchURL(article.url),
                          child: const Text('Keep reading'),
                        ),
                      ),
                const SizedBox(
                  height: 50,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "More news you might like",
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
          );
        } else {
          return const Center(
            child: Text('There was a problem loading the article'),
          );
        }
      },
    );
  }
}
