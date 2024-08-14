import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/profile_entity.dart';
part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  @JsonKey(name: '_id')
  final String userId;
  final String username;
  final String email;
  final String? profileImage; // Make the image field nullable
  final String? location;
  final String phone;
  // final int? otpReset;
  // final DateTime? otpResetExpires;

  ProfileModel({
    required this.userId,
    required this.username,
    required this.email,
    required this.phone,
    this.location,
    this.profileImage, // Allow null values
    // this.otpReset,
    // this.otpResetExpires,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);

  ProfileEntity toEntity() {
    return ProfileEntity(
      userId: userId,
      username: username,
      email: email,
      profileImage: profileImage,
      location: location,
      phone: phone,
    );
  }
}
