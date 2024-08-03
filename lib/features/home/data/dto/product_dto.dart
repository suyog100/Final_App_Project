import 'package:finalproject/features/home/data/model/product_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_dto.g.dart';

@JsonSerializable()
class ProductDto {
  final bool success;
  final List<ProductModel> data;

  ProductDto({
    required this.success,
    required this.data,
  });

  Map<String, dynamic> toJson() => _$ProductDtoToJson(this);

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);
}