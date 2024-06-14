import 'package:equatable/equatable.dart';


class AuthEntity extends Equatable {
  final String? id;
  final String email;
  final String username;
  final String password;

  const AuthEntity({
    this.id,
    required this.email,
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props =>
      [id, email, username, password];
}
