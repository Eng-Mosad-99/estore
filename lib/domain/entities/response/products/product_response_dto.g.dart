// GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'product_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

import 'package:ecommerce_route/core/api/models/response/products/product_response_dto.dart';

ProductResponseDto _$ProductResponseDtoFromJson(Map<String, dynamic> json) =>
    ProductResponseDto(
      results: (json['results'] as num?)?.toInt(),
      metadata: json['metadata'] ,
      data: json['data'] ,
          
    );

Map<String, dynamic> _$ProductResponseDtoToJson(ProductResponseDto instance) =>
    <String, dynamic>{
      'results': instance.results,
      'metadata': instance.metadata,
      'data': instance.data,
    };
