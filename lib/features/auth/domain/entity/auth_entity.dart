import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? id;
  final String email;
  final String username;
  final String phone;
  final String password;
  final String? location;

  const AuthEntity({
    this.id,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
    this.location,
  });

  @override
  List<Object?> get props => [id, email, phone, username, password, location];
}
