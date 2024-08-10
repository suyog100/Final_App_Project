import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../../../core/failure/failure.dart';
import '../../data/repository/profile_repository_impl.dart';
import '../entity/profile_entity.dart';

final profileRepositoryProvider = Provider<IProfileRepository>((ref) {
  return ref.read(profileRemoteRepositoryProvider);
});

abstract class IProfileRepository {
  Future<Either<Failure, ProfileEntity>> getUser();
  Future<Either<Failure, bool>> editProfile(ProfileEntity profile,File? imageFile);
}
