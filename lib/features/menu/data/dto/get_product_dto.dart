import 'package:finalproject/features/menu/data/model/product.dart';

import 'package:json_annotation/json_annotation.dart';
part 'get_product_dto.g.dart';


@JsonSerializable()
class GetProductDto {
  final bool success;
  @JsonKey(name:'products',defaultValue:[])
  final List<Product> data;

  GetProductDto({
    required this.success,
    required this.data,
  });

  factory GetProductDto.fromJson(Map<String, dynamic> json) =>
      _$GetProductDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetProductDtoToJson(this);
}
