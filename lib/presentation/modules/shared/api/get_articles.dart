import 'package:dio/dio.dart';

final dio = Dio();

Future<List<dynamic>> getArticles(
    {String keywords = 'Good Morning',
    String from = '0',
    String to = '0',
    String sortBy = 'popularity'}) async {
  final response = await dio.get(
      'https://newsapi.org/v2/everything?q=$keywords&from=$from&to=$to&sortBy=$sortBy&apiKey=9dd723c7bfaf468da346c93685f6eb7a');

  if (response.statusCode == 200) {
    // Check if the response status code is 200 (OK)
    Map<String, dynamic> jsonResponse = response.data;

    if (jsonResponse.containsKey("articles")) {
      // Check if "articles" key exists in the response
      List<dynamic> articles = jsonResponse["articles"];
      // print(articles);
      return articles;
    } else {
      // "articles" key not found in the response
      return [];
    }
  } else {
    // Handle any error here
    throw Exception('Failed to load articles');
  }
}
