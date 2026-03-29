import 'package:dio/dio.dart';
import 'package:ecommerce_route/core/api/api_service.dart';
import 'package:ecommerce_route/core/api/mappers/category_mapper.dart';
import 'package:ecommerce_route/core/errors/app_exceptions.dart';
import 'package:ecommerce_route/domain/entities/response/category/category.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data/data_sources/remote/category_remote_data_source.dart';

@Injectable(as: CategoryRemoteDataSource)
class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final ApiService apiService;
  CategoryRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<Category>?> getAllCategories() async {
    try {
      var categoryResponse = await apiService.getAllCategories();
      //! TODO: List<CategoryDto> ====> List<Category>
      return categoryResponse.data
              ?.map((catDto) => catDto!.toCategory())
              .toList() ??
          [];
    } on DioException catch (e) {
      String message = (e.error as AppException).message;
      throw ServerException(message: message); 
    }
  }
}
