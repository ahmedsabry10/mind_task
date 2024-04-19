// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataModel _$DataModelFromJson(Map<String, dynamic> json) => DataModel(
      json['id'] as String,
      json['email'] as String,
      json['active'] as String,
      json['name'] as String,
      json['notifications'] as String,
      json['profile_photo'] as String,
      json['auth_key'] as String,
    )..FavoriteId = json['Favorite_id'];

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'active': instance.active,
      'name': instance.name,
      'notifications': instance.notifications,
      'profile_photo': instance.profilePhoto,
      'auth_key': instance.authKey,
      'Favorite_id': instance.FavoriteId,
    };
