import 'package:finalproject/features/home/domain/entity/paginated_products.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/cart_entity.dart';
part 'cart_model.g.dart';

final cartModelProvider = Provider((ref) {
  return CartModel.empty();
});

@JsonSerializable()
class CartModel {
  @JsonKey(name: '_id')
  final String productId;
  final String productName;
  final int productPrice;
  final String productImage;
  final String productDescription;
  final int quantity;

  CartModel(
      {required this.productId,
      required this.productName,
      required this.productPrice,
      required this.productImage,
      required this.productDescription,
      required this.quantity});
  factory CartModel.empty() {
    return CartModel(
        productId: "",
        productName: "",
        productPrice: 0,
        productImage: "",
        productDescription: "",
        quantity: 0);
  }
  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);

  CartEntity toEntity() {
    return CartEntity(
        productId: productId,
        productName: productName,
        productPrice: productPrice,
        productImage: productImage,
        productDescription: productDescription,
        quantity: quantity);
  }

  List<CartEntity> toEntityList(List<CartModel> models) =>
      models.map((model) => model.toEntity()).toList();
}
