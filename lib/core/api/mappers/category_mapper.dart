import '../../../domain/entities/response/common/category_or_brand.dart';
import '../models/response/common/category_or_brand_dto.dart';

extension CategoryMapper on CategoryOrBrandDto {
  CategoryOrBrand toCategoryOrBrand() {
    return CategoryOrBrand(
      name: name,
      id: id,
      slug: slug,
      image: image,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
