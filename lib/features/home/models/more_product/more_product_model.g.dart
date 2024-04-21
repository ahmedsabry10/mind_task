// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'more_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoreProductModel _$MoreProductModelFromJson(Map<String, dynamic> json) =>
    MoreProductModel(
      json['status'] as bool,
      json['msg'] as String,
      (json['data'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MoreProductModelToJson(MoreProductModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.message,
      'data': instance.data,
    };
