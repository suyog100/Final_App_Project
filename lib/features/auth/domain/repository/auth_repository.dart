import 'package:dartz/dartz.dart';
import 'package:finalproject/core/common/internet_checker.dart';
import 'package:finalproject/features/auth/data/repository/auth_remote_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../data/repository/auth_local_repository.dart';
import '../entity/auth_entity.dart';

final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  final checkConnectivity = ref.read(connectivityStatusProvider);

  return ref.read(authRemoteRepositoryProvider);
});

abstract class IAuthRepository {
  Future<Either<Failure, bool>> registerUser(AuthEntity user);
  Future<Either<Failure, bool>> loginUser(String email, String password);
}
