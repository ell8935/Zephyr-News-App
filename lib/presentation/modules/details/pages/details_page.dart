import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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

  Future<void> _launchURL(String url) async {
    final finalUrl = Uri.parse(url);
    if (await canLaunchUrl(finalUrl)) {
      await launchUrl(finalUrl);
    }
  }

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
            '${content.substring(0, content.length - 16)}...', //this is to remove the tranctued text u get from the api
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16.0),
          url == ''
              ? const Text('Sorry this is the end')
              : ElevatedButton(
                  onPressed: () => _launchURL(url),
                  child: const Text('Keep reading'))
        ],
      ),
    );
  }
}
