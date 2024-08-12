import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String userId;
  final String username;
  final String email;
  final String phone;
  final String location;
  final String? profileImage;

  const ProfileEntity({
    required this.userId,
    required this.username,
    required this.phone,
    required this.location,
    required this.email,
    this.profileImage,
  });

  @override
  List<Object?> get props =>
      [userId, username, email, location, phone, profileImage];
}
