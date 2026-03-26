abstract class AppException implements Exception {
  final String message;
  int? statusCode;

  AppException({required this.message, this.statusCode});
}

class ServerException extends AppException {
  ServerException({required super.message, super.statusCode});
}

class NetworkException extends AppException {
  NetworkException({required super.message, super.statusCode});
}

class UnExpectedException extends AppException {
  UnExpectedException({required super.message, super.statusCode});
}
