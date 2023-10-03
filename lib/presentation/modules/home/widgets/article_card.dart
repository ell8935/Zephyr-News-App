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
    super.key,
    this.title = 'Placeholder Title',
    this.author = 'Placeholder Author',
    this.urlToImage = 'Need to put stock image',
    this.description = 'Placeholder Description',
    this.content = 'Placeholder Content',
    this.url = 'Placeholder url',
  });

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
    return Center(
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            debugPrint('Card tapped.');
            _navigateToDetailsPage(context);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  urlToImage,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Wrap(
                children: [
                  const Text(
                    'by',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    ' $author',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                description,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
