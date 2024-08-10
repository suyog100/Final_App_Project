
import 'package:json_annotation/json_annotation.dart';

import '../model/profile_model.dart';



@JsonSerializable()
class ProfileDTO {
  @JsonKey(name: "userDetails")
  final ProfileModel userData;
  final bool success;

  ProfileDTO({
    required this.userData,
    required this.success,
  });
  factory ProfileDTO.fromJson(Map<String, dynamic> json) =>
      _$ProfileDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDTOToJson(this);
}
