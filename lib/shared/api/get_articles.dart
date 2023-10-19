import 'package:dio/dio.dart';
import 'package:zephy_news_app/shared/models/filters_model.dart';
import 'package:zephy_news_app/shared/utils/custom_exception.dart';

final dio = Dio();

Future<List<dynamic>> getArticles({
  required FiltersEntity filters,
  bool? byCatagory = false,
  int? page = 1,
}) async {
  try {
    final response = await dio.get(
        // due to ease of use i've left the api key here but in a real project i would've put it inside .env file
        byCatagory != null && byCatagory
            ? 'https://newsapi.org/v2/top-headlines?country=us&category=${filters.category}&apiKey=9dd723c7bfaf468da346c93685f6eb7a'
            : 'https://newsapi.org/v2/everything?q=${filters.keywords}&from=${filters.from}&to=${filters.to}&page=$page&pageSize=10&apiKey=88d5e4c8e1ff4e5b8db84c8927fc94d6');

    Map<String, dynamic> jsonResponse = response.data;

    if (jsonResponse.containsKey("articles")) {
      List<dynamic> articles = jsonResponse["articles"];

      return articles;
    } else {
      throw CustomException("No articles found on this topic");
    }
  } on DioException catch (e) {
    throw CustomException(e.response!.data['message'],
        statusCode: e.response!.data['code']);
  }
}
