import 'package:flutter/material.dart';
import 'package:move_home_assignment/presentation/modules/shared/widgets/custom_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:move_home_assignment/presentation/modules/home/widgets/article_feed.dart'; // Import the ArticleFeed widget

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
      appBar: const CustomAppBar(),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: Expanded(
              child: ListView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: const EdgeInsets.all(16.0),
                children: <Widget>[
                  Image.network(
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
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
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
            ),
          ),

          // Place the ArticleFeed at the bottom
          const ArticleFeed(),
        ],
      ),
    );
  }
}
