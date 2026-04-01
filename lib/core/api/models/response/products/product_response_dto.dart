import 'package:ecommerce_route/core/api/models/response/brands/meta_data_dto.dart';
import 'package:ecommerce_route/core/api/models/response/products/product_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_response_dto.g.dart';

@JsonSerializable()
class ProductResponseDto {
  @JsonKey(name: 'results')
  final int? results;
  @JsonKey(name: 'metadata')
  final MetadataDto? metadata;
  @JsonKey(name: 'data')
  final List<ProductDto?>? data;

  ProductResponseDto({this.results, this.metadata, this.data});

  factory ProductResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProductResponseDtoToJson(this);
}
