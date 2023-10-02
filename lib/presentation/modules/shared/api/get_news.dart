import 'package:dio/dio.dart';

final dio = Dio();

void getNews({
  String keywords = 'Good Morning',
  String from = '0',
  String to = '0',
}) async {
  final response = await dio.get(
      'https://newsapi.org/v2/everything?q=$keywords&from=$from&to=$to&apiKey=9dd723c7bfaf468da346c93685f6eb7a');
  //left the api key unprotected for easier of use when downloading from github
  //in a real project need to put in .env
  print(response);
}
