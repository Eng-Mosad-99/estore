import 'package:ecommerce_route/domain/entities/response/products/product.dart';

abstract class ProductRemoteDataSource {
  Future<List<Product>?> getAllProducts();
}