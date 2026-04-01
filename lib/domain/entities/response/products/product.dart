
import 'package:json_annotation/json_annotation.dart';

import '../common/category_or_brand.dart';
import 'sub_category.dart';
part 'product.g.dart';

@JsonSerializable()
class Product {
  @JsonKey(name: 'sold')
  final int? sold;
  @JsonKey(name: 'images')
  final List<String?>? images;
  @JsonKey(name: 'subcategory')
  final List<Subcategory?>? subcategory;
  @JsonKey(name: 'ratingsQuantity')
  final int? ratingsQuantity;
  @JsonKey(name: '_id')
  final String? id;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'slug')
  final String? slug;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'quantity')
  final int? quantity;
  @JsonKey(name: 'price')
  final int? price;
  @JsonKey(name: 'imageCover')
  final String? imageCover;
  @JsonKey(name: 'category')
  final CategoryOrBrand? category;
  @JsonKey(name: 'brand')
  final CategoryOrBrand? brand;
  @JsonKey(name: 'ratingsAverage')
  final double? ratingsAverage;
  @JsonKey(name: 'createdAt')
  final String? createdAt;
  @JsonKey(name: 'updatedAt')
  final String? updatedAt;

  Product({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
  });


}
