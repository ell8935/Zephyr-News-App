import 'package:dio/dio.dart';
import 'package:move_home_assignment/models/filters_model.dart';

final dio = Dio();

class NoArticlesFoundException implements Exception {
  final String message;

  NoArticlesFoundException(this.message);
}

Future<List<dynamic>> getArticles({
  required FiltersEntity filters,
}) async {
  final response = await dio.get(
      'https://newsapi.org/v2/everything?q=${filters.keywords}&from=${filters.from}&to=${filters.to}&sortBy=${filters.sortBy}&apiKey=9dd723c7bfaf468da346c93685f6eb7a');

  if (response.statusCode == 200) {
    Map<String, dynamic> jsonResponse = response.data;

    if (jsonResponse.containsKey("articles")) {
      List<dynamic> articles = jsonResponse["articles"];
      if (articles.isEmpty) {
        throw NoArticlesFoundException("No articles found on this topic");
      }
      return articles;
    }
  } else {
    throw DioErrorException(
        "Dio request failed with status code: ${response.statusCode}");
  }

  // If there are no articles or an error occurred, return an initial data list
  return [];
}

class DioErrorException implements Exception {
  final String message;

  DioErrorException(this.message);
}
