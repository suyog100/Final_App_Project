

import '../../domain/entity/review_entity.dart';
import '../dto/review_dto.dart';

class ReviewModel {
  final List<ReviewDTO> reviews;

  ReviewModel({required this.reviews});

  factory ReviewModel.fromJson(List<dynamic> json) {
    return ReviewModel(
      reviews: json.map((e) => ReviewDTO.fromJson(e)).toList(),
    );
  }

  List<ReviewEntity> toEntities() {
    return reviews.map((dto) => dto.toEntity()).toList();
  }
}
