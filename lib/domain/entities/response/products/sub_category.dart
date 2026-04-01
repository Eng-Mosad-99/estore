
import 'package:json_annotation/json_annotation.dart';
part 'sub_category.g.dart';
@JsonSerializable()
class Subcategory {
  @JsonKey(name: '_id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'slug')
  final String? slug;
  @JsonKey(name: 'category')
  final String? category;

  Subcategory( {
    this.id,
    this.name,
    this.slug,
    this.category,
  });


}
