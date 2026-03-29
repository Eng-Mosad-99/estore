import 'package:ecommerce_route/core/api/models/response/common/category_or_brand_dto.dart';
import 'package:json_annotation/json_annotation.dart';
import '../common/category_or_brand.dart';
import '../common/meta_data.dart';

part 'brand_response.g.dart';

@JsonSerializable()
class BrandResponse {
  @JsonKey(name: 'results')
  final int? results;
  @JsonKey(name: 'metadata')
  final Metadata? metadata;
  @JsonKey(name: 'data')
  final List<CategoryOrBrand?>? data;

  BrandResponse({this.results, this.metadata, this.data});

}

