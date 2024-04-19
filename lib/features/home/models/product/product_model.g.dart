// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      json['id'] as String,
      json['name'] as String,
      json['short_desc'] as String,
      json['main_image'] as String,
      json['list_price'] as String,
      json['sale_price'] as String,
      json['discount'] as String,
      json['rating'],
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'short_desc': instance.shortDesc,
      'main_image': instance.mainImage,
      'list_price': instance.listPrice,
      'sale_price': instance.salePrice,
      'discount': instance.discount,
      'rating': instance.rating,
    };
