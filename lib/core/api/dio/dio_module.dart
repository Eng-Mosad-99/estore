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
  PrettyDioLogger providePrettyDioLogger() => PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: true,
    error: true,
    compact: true,
    maxWidth: 90,
  );
  @singleton
  @injectable
  Dio provideDio(BaseOptions baseOptions, PrettyDioLogger prettyDioLogger) {
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
