import 'package:finalproject/features/cart/data/model/cart_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/cart_entity.dart';
part 'cart_dto.g.dart';

@JsonSerializable()
class CartDto {
  final bool success;
  final List<CartModel> cartItem;
  // @JsonKey(name: '_id')
  // final String productId;
  // final String productName;
  // final int productPrice;
  // final String productImage;
  // final String productDescription;
  // final int quantity;

  CartDto({
    required this.success,
    required this.cartItem,
    // required this.productId,
    // required this.productName,
    // required this.productPrice,
    // required this.productImage,
    // required this.productDescription,
    // required this.quantity,
  });

  factory CartDto.fromJson(Map<String, dynamic> json) =>
      _$CartDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CartDtoToJson(this);
}
