import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/constants/api_endpoint.dart';
import '../../domain/entity/paginated_products.dart';
import '../dto/product_dto.dart';


class ProductDataSource {
  final Dio _dio;
  ProductDataSource(this._dio);

  Future<Either<Failure, List<Product>>> getProducts(int page) async {
    //using try catch to catch the response
    try {
      final response = await _dio.get(
        //connecting the api for the product pagination
        ApiEndpoints.productPagination,
        //fetching the page and the limit form api end point
        queryParameters: {'page': page, '_limit': ApiEndpoints.limitPage},
      );
      final data = response.data as Map<String, dynamic>;
      final products = (data['products'] as List)
      //adding dto logic to control the fetching data from backend
          .map((e) => ProductDTO.fromJson(e).toEntity())
          .toList();
      return Right(products);
    } on DioException catch (e) {
      //catching the error and throw the message
      return Left(Failure(message: e.message.toString()));
    }
  }
}

class Failure {
  //returning the message from the failure
  final String message;
  Failure({required this.message});
}

final dioProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(
    baseUrl: ApiEndpoints.baseUrl,
    connectTimeout: ApiEndpoints.connectionTimeout,
    receiveTimeout: ApiEndpoints.receiveTimeout,
  ));
});

final productDataSourceProvider = Provider<ProductDataSource>((ref) {
  final dio = ref.read(dioProvider);
  return ProductDataSource(dio);
});