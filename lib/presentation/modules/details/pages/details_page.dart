import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String title;
  final String author;
  final String urlToImage;
  final String description;
  final String content;
  final String url;

  const DetailsPage({
    super.key,
    required this.title,
    required this.author,
    required this.urlToImage,
    required this.description,
    required this.content,
    this.url = '',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title), // Display the title in the app bar
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          Image.network(
            urlToImage,
            fit: BoxFit.cover,
            height: 200, // Set the desired image height
          ),
          const SizedBox(height: 16.0),
          Text(
            'Author: $author',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16.0),
          Text(
            content,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16.0),
          Text(
            url,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
