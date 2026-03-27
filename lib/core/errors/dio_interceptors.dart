import 'package:dio/dio.dart';
import 'package:ecommerce_route/core/errors/app_exceptions.dart';

class DioInterceptors extends Interceptor {
  @override
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    AppException exception;

    final responseData = err.response?.data;

    String message = 'Something went wrong , please try again later';

    if (responseData is Map) {
      message =
          responseData['message'] ?? responseData['errors']['msg'] ?? message;
    }

    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.connectionError) {
      exception = NetworkException(message: 'No Internet Connection');
    } else if (err.response != null) {
      exception = ServerException(
        message: message,
        statusCode: err.response?.statusCode,
      );
    } else {
      exception = UnExpectedException(message: message);
    }

    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        error: exception,
        type: err.type,
        response: err.response,
      ),
    );
  }
}
