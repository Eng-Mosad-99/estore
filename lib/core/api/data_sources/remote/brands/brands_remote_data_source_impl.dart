import 'package:dio/dio.dart';
import 'package:ecommerce_route/core/api/api_service.dart';
import 'package:ecommerce_route/core/api/mappers/category_mapper.dart';
import 'package:ecommerce_route/core/errors/app_exceptions.dart';
import 'package:ecommerce_route/data/data_sources/remote/brand_remote_data_source.dart';
import 'package:ecommerce_route/domain/entities/response/common/category_or_brand.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BrandRemoteDataSource)
class BrandsRemoteDataSourceImpl implements BrandRemoteDataSource {
  final ApiService apiService;
  BrandsRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<CategoryOrBrand >?> getAllBrands() async {
    try {
      var brandResponse = await apiService.getAllBrands();
      //! TODO: List<CategoryDto> ====> List<Category>
      return brandResponse.data
              ?.map((catDto) => catDto!.toCategoryOrBrand())
              .toList() ??
          [];
    } on DioException catch (e) {
      String message = (e.error as AppException).message;
      throw ServerException(message: message); 
    }
  }
}
