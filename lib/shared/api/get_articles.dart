import 'package:dio/dio.dart';
import 'package:move_home_assignment/shared/models/filters_model.dart';
import 'package:move_home_assignment/shared/utils/custom_exception.dart';

final dio = Dio();

Future<List<dynamic>> getArticles({
  required FiltersEntity filters,
  double? page = 1,
}) async {
  try {
    final response = await dio.get(
        // due to ease of use i've left the api key here but in a real project i would've put it inside .env file
        'https://newsapi.org/v2/everything?q=${filters.keywords}&from=${filters.from}&to=${filters.to}&sortBy=${filters.sortBy}&pageSize=20&page=$page&apiKey=88d5e4c8e1ff4e5b8db84c8927fc94d6');
    Map<String, dynamic> jsonResponse = response.data;

    if (jsonResponse.containsKey("articles")) {
      List<dynamic> articles = jsonResponse["articles"];

      if (articles.isEmpty) {
        throw CustomException("No articles found on this topic");
      }

      return articles;
    } else {
      throw CustomException("No articles found on this topic");
    }
  } on DioException catch (e) {
    throw CustomException(e.response!.data['message']);
  } catch (e) {
    throw CustomException("Something Went Wrong");
  }
}