import 'package:finalproject/features/search/domain/entity/search_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_model.g.dart';

@JsonSerializable()
class SearchModel {
  @JsonKey(name: '_id')
  final String productId;
  final String productName;
  final int productPrice;
  final String productDescription;
  final String productCategory;

  final String productImage;

  const SearchModel({
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.productDescription,
    required this.productCategory,
    required this.productImage,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) =>
      _$SearchModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchModelToJson(this);

  GetSearchEntity toEntity() => GetSearchEntity(
        productId: productId,
        productName: productName,
        productDescription: productDescription,
        productCategory: productCategory,
        productPrice: productPrice,
        productImage: productImage,
      );

  SearchModel.empty()
      : productId = '',
        productName = '',
        productDescription = '',
        productCategory = '',
        productPrice = 0,
        productImage = '';
}
