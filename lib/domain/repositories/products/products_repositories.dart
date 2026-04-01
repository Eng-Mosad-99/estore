import 'package:ecommerce_route/domain/entities/response/products/product.dart';

abstract class ProductsRepositories {
  Future<List<Product>?> getAllProducts();
}