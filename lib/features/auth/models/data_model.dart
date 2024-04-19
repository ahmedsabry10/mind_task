import 'package:json_annotation/json_annotation.dart';
part 'data_model.g.dart';

@JsonSerializable()
class DataModel {
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'email')
  String email;
  @JsonKey(name: 'active')
  String active;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'notifications')
  String notifications;
  @JsonKey(name: 'profile_photo')
  String profilePhoto;
  @JsonKey(name: 'auth_key')
  String authKey;
  @JsonKey(name: 'Favorite_id')
  dynamic FavoriteId;
  

  DataModel(
      this.id,
      this.email,
      this.active,
      this.name,
      this.notifications,
      this.profilePhoto,
      this.authKey,
      );
  factory  DataModel.fromJson(Map<String, dynamic> json) => _$DataModelFromJson(json);
  Map<String, dynamic> toJson()=> _$DataModelToJson(this);
}
