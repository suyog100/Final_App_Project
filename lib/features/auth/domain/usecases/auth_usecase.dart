import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../entity/auth_entity.dart';
import '../repository/auth_repository.dart';

final authUseCaseProvider = Provider((ref) {
  return AuthUseCase(ref.read(authRepositoryProvider));
});

class AuthUseCase {
  final IAuthRepository _authRepository;

  AuthUseCase(this._authRepository);

  Future<Either<Failure, bool>> registerUser(AuthEntity? user) async {
    return _authRepository.registerUser(user!);
  }

  Future<Either<Failure, bool>> loginUser(
      String? email, String? password) async {
    return _authRepository.loginUser(email!, password!);
  }
}
