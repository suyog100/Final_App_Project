
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/constants/api_endpoint.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/networking/remote/http_service.dart';
import '../../domain/entity/paginated_products.dart';
import '../dto/product_dto.dart';
import '../model/product_model.dart';


final productDataSourceProvider = Provider<ProductDataSource>((ref) {
  final dio = ref.read(httpServiceProvider);
  return ProductDataSource(
    dio: dio,
    productModel: ref.read(productModelProvider),
  );
});
class ProductDataSource {
  final Dio dio;
  final ProductModel productModel;
  ProductDataSource({required this.dio, required this.productModel});
  Future<Either<Failure, List<ProductEntity>>> getProduct(int page) async {
    try {
      final response = await dio.get(
        ApiEndpoints.products,
        queryParameters: {
          '_page': page,
          '_limit': ApiEndpoints.limitPage,
        },
      );


      ProductDto getAllProductDto = ProductDto.fromJson(response.data);
      return Right(productModel.toEntityList(getAllProductDto.data));
    } on DioException catch (e) {

      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }
}
