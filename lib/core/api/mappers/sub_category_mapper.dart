
import 'package:ecommerce_route/core/api/models/response/products/sub_category_dto.dart';
import 'package:ecommerce_route/domain/entities/response/products/sub_category.dart';

extension SubCategoryMapper on SubcategoryDto {
  Subcategory toSubCategory() {
    return Subcategory(
      name: name,
      id: id,
      slug: slug,
   category: category,
    );
  }
}
