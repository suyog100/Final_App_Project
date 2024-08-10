import 'package:json_annotation/json_annotation.dart';



@JsonSerializable()
class UserDTO {
  @JsonKey(name: '_id')
  final String id;
  final String fullName;

  UserDTO({
    required this.id,
    required this.fullName,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserDTOToJson(this);
}
