import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/paginated_products.dart';

part 'product_model.g.dart';

final productModelProvider = Provider<ProductModel>((ref) {
  return ProductModel.empty();
});

@JsonSerializable()
class ProductModel extends Equatable {
  final String id;
  final String productName;
  final double productPrice;
  final String productCategory;
  final String productDescription;
  final String productImage;


  const ProductModel({
    required this.id,
    required this.productName,
    required this.productPrice,
    required this.productCategory,
    required this.productDescription,
    required this.productImage,

  });


  factory ProductModel.empty() {
    return const ProductModel(
      id: '',
      productName: '',
      productDescription: '',
      productImage: '',
      productPrice: 0,
      productCategory: '',
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  // to entity list
  List<ProductEntity> toEntityList(List<ProductModel> models) =>
      models.map((model) => model.toEntity()).toList();

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      productName: productName,
      productPrice: productPrice,
      productCategory: productCategory,
      productDescription: productDescription,
      productImage: productImage,

    );
  }

  @override
  List<Object?> get props => [
    id,
    productName,
    productPrice,
    productCategory,
    productDescription,
    productImage,
  ];
}
