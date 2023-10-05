import 'package:dio/dio.dart';
import 'package:move_home_assignment/models/filters_model.dart';

final dio = Dio();

Future<List<dynamic>> getArticles({
  required FiltersEntity filters,
}) async {
  final response = await dio.get(
      'https://newsapi.org/v2/everything?q=${filters.keywords}&from=${filters.from}&to=${filters.to}&sortBy=${filters.sortBy}&apiKey=9dd723c7bfaf468da346c93685f6eb7a');

  if (response.statusCode == 200) {
    Map<String, dynamic> jsonResponse = response.data;

    if (jsonResponse.containsKey("articles")) {
      List<dynamic> articles = jsonResponse["articles"];
      if (true) {
        throw Exception("No articles found on this topic");
      }
      return articles;
    }
  } else {
    throw DioException(requestOptions: response.requestOptions);
  }

  return [];
}
