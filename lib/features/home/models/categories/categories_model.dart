import 'package:json_annotation/json_annotation.dart';
part 'categories_model.g.dart';

@JsonSerializable()
class CategoriesModel {
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'cat_name')
  String catName;
  @JsonKey(name: 'icon')
  String icon;
  

  CategoriesModel(
      this.id,
      this.catName,
      this.icon,

      );
  factory  CategoriesModel.fromJson(Map<String, dynamic> json) => _$CategoriesModelFromJson(json);
  Map<String, dynamic> toJson()=> _$CategoriesModelToJson(this);
}
