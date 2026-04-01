import 'package:dio/dio.dart';
import 'package:ecommerce_route/core/api/end_points.dart';
import 'package:ecommerce_route/core/api/models/request/login_request_dto.dart';
import 'package:ecommerce_route/core/api/models/request/register_request_dto.dart';
import 'package:ecommerce_route/core/api/models/response/auth_response_dto.dart';
import 'package:ecommerce_route/core/api/models/response/brands/brands_response_dto.dart';

import 'package:retrofit/retrofit.dart';

import 'models/response/category/category_response_dto.dart';
import 'models/response/products/product_response_dto.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  @POST(EndPoints.login)
  Future<AuthResponseDto> login(@Body() LoginRequestDto loginRequestDto);

  @POST(EndPoints.register)
  Future<AuthResponseDto> register(@Body() RegisterRequestDto registerRequestDto);
  
  @GET(EndPoints.categories)
  Future<CategoryResponseDto> getAllCategories();

  @GET(EndPoints.brands)
  Future<BrandResponseDto> getAllBrands();
  @GET(EndPoints.products)
  Future<ProductResponseDto> getAllProducts();
  
}