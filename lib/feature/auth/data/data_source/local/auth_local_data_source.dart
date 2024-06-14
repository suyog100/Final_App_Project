import 'package:dartz/dartz.dart';
import 'package:finalproject/core/networking/local/hive_service.dart';
import 'package:finalproject/feature/auth/domain/entity/auth_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/failure/failure.dart';
import '../../model/auth_hive_model.dart';

final authLocalDataSourceProvider = Provider(
      (ref) => AuthLocalDataSource(
    ref.read(hiveServiceProvider),
    ref.read(authHiveModelProvider),
  ),
);

class AuthLocalDataSource {
  final HiveService _hiveService;
  final AuthHiveModel _authHiveModel;

  AuthLocalDataSource(this._hiveService, this._authHiveModel);

  Future<Either<Failure, bool>> registerUser(AuthEntity user) async {
    try {
      await _hiveService.addUser(_authHiveModel.toHiveModel(user));
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  Future<Either<Failure, bool>> loginUser(
      String username,
      String password,
      ) async {
    try {
      AuthHiveModel? user = await _hiveService.login(username, password);
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}
