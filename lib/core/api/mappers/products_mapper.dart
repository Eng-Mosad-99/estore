import 'package:ecommerce_route/core/api/mappers/category_mapper.dart';
import 'package:ecommerce_route/core/api/mappers/sub_category_mapper.dart';
import 'package:ecommerce_route/core/api/models/response/products/product_dto.dart';
import 'package:ecommerce_route/domain/entities/response/products/product.dart';

import '../../../domain/entities/response/common/category_or_brand.dart';
import '../models/response/common/category_or_brand_dto.dart';

extension ProductsMapper on ProductDto {
  Product toProduct() {
    return Product(
      title: title,
      id: id,
      slug: slug,
      images: images,
      description: description,
      category: category?.toCategoryOrBrand(),
      price: price,
      subcategory: subcategory?.map((e) => e?.toSubCategory()).toList(),
      ratingsAverage: ratingsAverage,
      ratingsQuantity: ratingsQuantity,
      sold: sold,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
