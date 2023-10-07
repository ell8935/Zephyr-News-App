import 'package:dio/dio.dart';
import 'package:move_home_assignment/shared/models/filters_model.dart';
import 'package:move_home_assignment/shared/utils/custom_exception.dart';

final dio = Dio();

Future<List<dynamic>> getArticles({
  required FiltersEntity filters,
  int? page = 1,
}) async {
  try {
    final response = await dio.get(
        // due to ease of use i've left the api key here but in a real project i would've put it inside .env file
        'https://newsapi.org/v2/everything?q=${filters.keywords}&from=${filters.from}&to=${filters.to}&apiKey=88d5e4c8e1ff4e5b8db84c8927fc94d6&page=$page&pageSize=10');
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
