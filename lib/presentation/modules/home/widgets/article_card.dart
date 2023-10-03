import 'package:flutter/material.dart';

class ArticleCard extends StatelessWidget {
  final String title;
  final String author;
  final String urlToImage;
  final String description;

  const ArticleCard({
    super.key,
    this.title = 'Placeholder Title',
    this.author = 'Placeholder Author',
    this.urlToImage = 'Need to put stock image',
    this.description = 'Placeholder Description',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            debugPrint('Card tapped.');
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(
                urlToImage,
                fit: BoxFit.contain,
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
