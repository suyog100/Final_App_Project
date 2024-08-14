import 'package:json_annotation/json_annotation.dart';

import '../model/profile_model.dart';
part 'profile_dto.g.dart';

@JsonSerializable()
class ProfileDTO {
  @JsonKey(name: "data")
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
