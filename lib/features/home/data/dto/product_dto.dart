
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/paginated_products.dart';
import '../model/product_model.dart';


part 'product_dto.g.dart';

@JsonSerializable()
class ProductDTO {
  final String id;
  final String productName;
  final double productPrice;
  final String productCategory;
  final String productDescription;
  final String productImage;

  ProductDTO({
    required this.id,

    required this.productName,
    required this.productPrice,
    required this.productCategory,
    required this.productDescription,
    required this.productImage,
  });

  factory ProductDTO.fromJson(Map<String, dynamic> json) {
    //providing all backend logic in the dto
    print('Parsing ProductDTO from JSON: $json');
    return ProductDTO(
      id: json['id'] as String? ?? '',
      productName: json['productName'] as String? ?? '',
      productPrice: (json['productPrice'] as num?)?.toDouble() ?? 0.0,
      productCategory: json['productCategory'] as String? ?? '',
      productDescription: json['productDescription'] as String? ?? '',
      productImage: json['productImage'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => _$ProductDTOToJson(this);

  Product toEntity() {
    return Product(
      //fetching the data from entity
      id: id,
      productName: productName,
      productPrice: productPrice,
      productCategory: productCategory,
      productDescription: productDescription,
      productImage: productImage,
    );
  }

  factory ProductDTO.fromEntity(Product product) {
    return ProductDTO(
      id: product.id,
      productName: product.productName,
      productPrice: product.productPrice,
      productCategory: product.productCategory,
      productDescription: product.productDescription,
      productImage: product.productImage,
    );
  }

  factory ProductDTO.fromModel(ProductModel model) {
    return ProductDTO(
      id: model.id,

      productName: model.productName,
      productPrice: model.productPrice,
      productCategory: model.productCategory,
      productDescription: model.productDescription,
      productImage: model.productImage,
    );
  }

  ProductModel toModel() {
    return ProductModel(
      id: id,
      productName: productName,
      productPrice: productPrice,
      productCategory: productCategory,
      productDescription: productDescription,
      productImage: productImage,
    );
  }
}
