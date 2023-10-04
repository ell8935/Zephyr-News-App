import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FullArticle extends StatelessWidget {
  final String urlToImage;

  final String author;

  final String title;
  final String content;
  final String url;

  const FullArticle(
      {Key? key,
      required this.urlToImage,
      required this.author,
      required this.title,
      required this.content,
      required this.url})
      : super(key: key);

  Future<void> _launchURL(String url) async {
    final finalUrl = Uri.parse(url);
    if (await canLaunchUrl(finalUrl)) {
      await launchUrl(finalUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    print({
      title,
    });
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
              ? const Center(child: Text('Sorry this is the end'))
              : Center(
                  child: ElevatedButton(
                    onPressed: () => _launchURL(url),
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
  }
}
