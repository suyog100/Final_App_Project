import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:uuid/uuid.dart';

import '../../../../app/constants/hive_table_constant.dart';
import '../../domain/entity/auth_entity.dart';

part 'auth_hive_model.g.dart';

final authHiveModelProvider = Provider(
      (ref) => AuthHiveModel.empty(),
);

@HiveType(typeId: HiveTableConstant.userTableId)
class AuthHiveModel {
  @HiveField(0)
  final String userId;

  @HiveField(1)
  final String username;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String password;


  // Constructor
  AuthHiveModel({
    String? userId,
    required this.email,
    required this.username,
    required this.password,
  }) : userId = userId ?? const Uuid().v4();

  // empty constructor
  AuthHiveModel.empty()
      : this(
    userId: '',
    email:'',
    username: '',
    password: '',
  );

  // Convert Hive Object to Entity
  AuthEntity toEntity() => AuthEntity(
    id: userId,
    username:username,
    email: email,
    password:password

  );

  // Convert Entity to Hive Object
  AuthHiveModel toHiveModel(AuthEntity entity) => AuthHiveModel(
    userId: const Uuid().v4(),
    username: entity.username,
    email: entity.email,
    password: entity.password,
  );

  // Convert Entity List to Hive List
  List<AuthHiveModel> toHiveModelList(List<AuthEntity> entities) =>
      entities.map((entity) => toHiveModel(entity)).toList();

  @override
  String toString() {
    return 'studentId: $userId, email: $email,  username: $username, password: $password';
  }
}
