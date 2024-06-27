import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/paginated_products.dart';

part 'product_model.g.dart';

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

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String? ?? '',

      productName: json['productName'] as String? ?? '',
      productPrice: (json['productPrice'] as num?)?.toDouble() ?? 0.0,
      productCategory: json['productCategory'] as String? ?? '',
      productDescription: json['productDescription'] as String? ?? '',
      productImage: json['productImage'] as String? ?? '',

    );
  }

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  Product toEntity() {
    return Product(
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
