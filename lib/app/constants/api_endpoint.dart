class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  static const String baseUrl = "http://10.0.2.2:3000/api/";
  static const String imageBaseUrl = "http://10.0.2.2:3000/";
  //static const String baseUrl = "http://localhost:3000/api/v1/";
  //static const String baseUrl = "http://192.168.4.4:3000/api/v1/   http://10.0.2.2";

  // ====================== Auth Routes ======================
  static const String login = "user/login";
  static const String register = "user/register";
  static const String imageUrl = "http://10.0.2.2:3000/products/";
  static const String uploadImage = "user/uploadImage";
  static const String currentUser = "user/getMe";

  //product routes
  static const String products = "products/get_all_products";
  //fetching the data for pagination form the backend
  static const String productPagination = "products/pagination";
  //for the pagination providing the limit page for the api end point
  static const limitPage = 2;

  // Cart Operations
  static const String addCart = "products/add_cart";
  static const String removeCart = "products/remove_cart/";
  static const String getCartItems = "products/get_cart";

  //get user
  static const String getUser = "user/getUser";

  //search products
  static const String searchProducts = "products/search";

  //forgot route
  static const String forgotPassword = "user/forgot_password";
  static const String verifyOtp = "user/verify_otp";
}
