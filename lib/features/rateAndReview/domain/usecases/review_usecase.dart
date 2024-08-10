import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../../../core/failure/failure.dart';
import '../../data/repository/review_repository_impl.dart';
import '../entity/review_entity.dart';
import '../repository/review_repository.dart';

final createReviewUseCaseProvider = Provider(
  (ref) {
    return CreateReviewUseCase(repository: ref.read(reviewRepositoryProvider));
  },
);

final getProductReviewsUseCaseProvider = Provider((ref) {
  return GetProductReviewsUseCase(
      repository: ref.read(reviewRepositoryProvider));
});

class CreateReviewUseCase {
  final ReviewRepository repository;

  CreateReviewUseCase({required this.repository});

  Future<Either<Failure, bool>> call(
      String? productId, double? rating, String? comment) {
    return repository.createReview(productId!, rating!, comment!);
  }
}

class GetProductReviewsUseCase {
  final ReviewRepository repository;

  GetProductReviewsUseCase({required this.repository});

  Future<Either<Failure, List<ReviewEntity>>> call(String productId) {
    return repository.getProductReviews(productId);
  }
}
