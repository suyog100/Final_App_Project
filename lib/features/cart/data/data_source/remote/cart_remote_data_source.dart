import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:finalproject/features/cart/data/model/cart_model.dart';
import 'package:finalproject/features/cart/domain/entity/cart_entity.dart';

import 'package:riverpod/riverpod.dart';

import '../../../../../app/constants/api_endpoint.dart';
import '../../../../../core/failure/failure.dart';
import '../../../../../core/networking/remote/http_service.dart';
import '../../../../splash/shared_prefs/user_shared_prefs.dart';
import '../../dto/cart_dto.dart';

final cartRemoteDataSourceProvider = Provider<CartRemoteDataSource>(
  (ref) => CartRemoteDataSource(
      dio: ref.read(httpServiceProvider),
      userSharedPrefs: ref.read(userSharedPrefsProvider),
      cartModel: ref.read(cartModelProvider)),
);

class CartRemoteDataSource {
  final Dio dio;
  final CartModel cartModel;
  final UserSharedPrefs userSharedPrefs;

  CartRemoteDataSource({
    required this.dio,
    required this.userSharedPrefs,
    required this.cartModel,
  });

  Future<Either<Failure, bool>> addProductToCart(String productId) async {
    try {
      String? token;
      var data = await userSharedPrefs.getUserToken();
      data.fold(
        (l) => token = null,
        (r) => token = r,
      );

      if (token == null) {
        return Left(Failure(statusCode: '0', error: 'Token is null'));
      }

      var response = await dio.post(
        ApiEndpoints.addCart,
        data: {'productId': productId},
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return Left(Failure(
          error: response.statusMessage ?? 'Failed to add product to cart',
          statusCode: response.statusCode.toString(),
        ));
      }
    } on DioException catch (e) {
      return Left(Failure(
        error: e.message.toString(),
        statusCode: e.response?.statusCode.toString() ?? '0',
      ));
    }
  }

  Future<Either<Failure, List<CartEntity>>> getCartItems() async {
    try {
      String? token;
      var data = await userSharedPrefs.getUserToken();
      data.fold(
        (l) => token = null,
        (r) => token = r!,
      );

      if (token == null) {
        return Left(Failure(statusCode: '0', error: 'Token is null'));
      }

      var response = await dio.get(
        ApiEndpoints.getCartItems,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        print('Response data: ${response.data}');

        final List data = response.data['cartItem'];
        CartDto cartDtoList = CartDto.fromJson(response.data);

        print('Cart items data: $data');
        return Right(cartModel.toEntityList(cartDtoList.cartItem));
      } else {
        return Left(Failure(
          error: response.statusMessage ?? 'Failed to load cart items',
          statusCode: response.statusCode.toString(),
        ));
      }
    } on DioException catch (e) {
      return Left(Failure(
        error: e.message.toString(),
        statusCode: e.response?.statusCode.toString() ?? '0',
      ));
    }
  }

  Future<Either<Failure, bool>> removeProductFromCart(String productId) async {
    try {
      String? token;
      var data = await userSharedPrefs.getUserToken();
      data.fold(
        (l) => token = null,
        (r) => token = r!,
      );

      if (token == null) {
        return Left(Failure(statusCode: '0', error: 'Token is null'));
      }

      var response = await dio.delete(
        '${ApiEndpoints.removeCart}$productId',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return Left(Failure(
          error: response.statusMessage ?? 'Failed to remove product from cart',
          statusCode: response.statusCode.toString(),
        ));
      }
    } on DioException catch (e) {
      return Left(Failure(
        error: e.message.toString(),
        statusCode: e.response?.statusCode.toString() ?? '0',
      ));
    }
  }
}






//sdfffffffffff
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Menu'),
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//       ),
//       body: Column(
//         children: [
//           SearchBar(),
//           CategoryList(),
//           SortDropdown(),
//           if (errorMessage.isNotEmpty)
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(errorMessage, style: TextStyle(color: Colors.red)),
//             ),
//           Expanded(
//             child: FoodGrid(
//               foodItems: foodItems,
//               onLoadMore: fetchFoodItems,
//               hasMore: hasMore,
//               isLoading: isLoading,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// ... [Keep your existing SearchBar, CategoryList, and SortDropdown widgets] ...