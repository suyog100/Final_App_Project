import 'package:dartz/dartz.dart';


import '../../../../core/failure/failure.dart';
import '../entity/review_entity.dart';

abstract class ReviewRepository {
  Future<Either<Failure, bool>> createReview(
      String productId, double rating, String comment);
  Future<Either<Failure, List<ReviewEntity>>> getProductReviews(String productId);
}
