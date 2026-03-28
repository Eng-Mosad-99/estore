import 'package:dio/dio.dart';
import 'package:ecommerce_route/core/api/api_service.dart';
import 'package:ecommerce_route/core/api/end_points.dart';
import 'package:ecommerce_route/core/errors/dio_interceptors.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class GetItModule {
  @singleton
  @injectable
  BaseOptions provideBaseOptions() => BaseOptions(
    baseUrl: EndPoints.baseUrl,
    receiveDataWhenStatusError: true,
    connectTimeout: const Duration(seconds: 20),
    receiveTimeout: const Duration(seconds: 20),
  );

  @singleton
  @injectable
  PrettyDioLogger providePrettyDioLogger() => CustomDioLogger();
  @singleton
  @injectable
  Dio provideDio(BaseOptions baseOptions, CustomDioLogger prettyDioLogger) {
    var dio = Dio(baseOptions);
    //! TODO: Add Interceptors
    dio.interceptors.add(DioInterceptors());
    dio.interceptors.add(prettyDioLogger);
    return dio;
  }

@singleton
@injectable
  ApiService provideApiService(Dio dio) => ApiService(dio);
}

class CustomDioLogger extends PrettyDioLogger {
  final bool requestHeader, requestBody, responseBody, error, compact;
  final int maxWidth;
  CustomDioLogger({
    this.requestHeader = false,
    this.requestBody = false,
    this.responseBody = true,
    this.error = true,
    this.compact = true,
    this.maxWidth = 90,
  }) : super(
         requestHeader: requestHeader,
         requestBody: requestBody,
         responseBody: responseBody,
         error: error,
         compact: compact,
         maxWidth: maxWidth,
       );

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response != null) {
      logPrint('🔴 Response Data: ${err.response?.data}');
      logPrint('🔴 Status Code: ${err.response?.statusCode}');
      logPrint('🔴 Headers: ${err.response?.headers}');
    } else if (err.message != null) {
      logPrint('🔴 Error Message: ${err.message}');
    } else {
      logPrint('🔴 Error Details: ${err.error}');
    }
    super.onError(err, handler);
  }
}
