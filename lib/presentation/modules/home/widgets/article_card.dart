import 'package:flutter/material.dart';
import 'package:move_home_assignment/presentation/modules/details/pages/details_page.dart';

class ArticleCard extends StatelessWidget {
  final String title;
  final String author;
  final String urlToImage;
  final String description;
  final String content;
  final String url;

  const ArticleCard({
    Key? key,
    this.title = 'Placeholder Title',
    this.author = 'Placeholder Author',
    this.urlToImage = 'Need to put stock image',
    this.description = 'Placeholder Description',
    this.content = 'Placeholder Content',
    this.url = 'Placeholder url',
  }) : super(key: key);

  void _navigateToDetailsPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsPage(
          title: title,
          author: author,
          urlToImage: urlToImage,
          description: description,
          content: content,
          url: url,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWell(
          onTap: () {
            _navigateToDetailsPage(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    urlToImage,
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
                      ' $author',
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 126, 126, 126)),
                    ),
                  ],
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  description,
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
