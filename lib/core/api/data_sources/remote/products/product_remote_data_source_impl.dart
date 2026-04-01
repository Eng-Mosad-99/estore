import 'package:dio/dio.dart';
import 'package:ecommerce_route/core/api/api_service.dart';
import 'package:ecommerce_route/core/api/mappers/products_mapper.dart';
import 'package:ecommerce_route/core/errors/app_exceptions.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data/data_sources/remote/product_remote_data_source.dart';
import '../../../../../domain/entities/response/products/product.dart';

@Injectable(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final ApiService apiService;
  ProductRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<Product>?> getAllProducts() async {
    try {
      var productResponse = await apiService.getAllProducts();
      //! TODO: List<ProductDto> ====> List<Product>
      return productResponse.data
              ?.map((productDto) => productDto!.toProduct())
              .toList() ??
          [];
    } on DioException catch (e) {
      String message = (e.error as AppException).message;
      throw ServerException(message: message); 
    }
  }
}
