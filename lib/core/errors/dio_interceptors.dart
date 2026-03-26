import 'package:dio/dio.dart';
import 'package:ecommerce_route/core/errors/app_exceptions.dart';

class DioInterceptors extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    AppException exception;
    final responseData = err.response?.data;

    String message = 'Something went wrong , please try again later';
    if (responseData is Map) {
      message =
          (responseData['errors']['msg'] as String?) ??
          (responseData['message'] as String?) ??
          message;
    }
    if (err.type == DioErrorType.connectionTimeout ||
        err.type == DioErrorType.connectionError) {
      exception = NetworkException(message: 'No Internet Connection');
    } else if (err.response?.statusCode != null) {
      exception = ServerException(
        message: message,
        statusCode: err.response?.statusCode,
      );
    } else {
      exception = UnExpectedException(message: message);
    }

    handler.next(
      DioException(requestOptions: err.requestOptions, error: exception),
    );
  }
}
