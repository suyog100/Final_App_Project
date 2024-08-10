import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../../../core/failure/failure.dart';
import '../../domain/entity/profile_entity.dart';
import '../../domain/repository/profile_repository.dart';
import '../data_source/profile_remote_data_source.dart';

final profileRemoteRepositoryProvider = Provider<IProfileRepository>((ref) {
  return ProfileRemoteRepository(ref.read(profileRemoteDataSourceProvider));
});

class ProfileRemoteRepository implements IProfileRepository {
  final ProfileRemoteDataSource _profileRemoteDataSource;
  ProfileRemoteRepository(this._profileRemoteDataSource);

  @override
  Future<Either<Failure, ProfileEntity>> getUser() {
    return _profileRemoteDataSource.getUser();
  }

  @override
  Future<Either<Failure, bool>> editProfile(ProfileEntity profile,File? imageFile) {
  return _profileRemoteDataSource.editProfile(profile,imageFile);
}
}
