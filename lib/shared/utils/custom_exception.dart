class CustomException implements Exception {
  String message;
  String? statusCode;

  CustomException(this.message, {this.statusCode});
}
