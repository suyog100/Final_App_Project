import 'package:finalproject/features/home/domain/entity/paginated_products.dart';

class ProductTestData {
  ProductTestData._();

  static List<ProductEntity> getProductTestData() {
    List<ProductEntity> lstProjects = [
      const ProductEntity(
          id: "6680067b635213702ef03d8c",
          productName: "momo",
          productPrice: 150,
          productCategory: "Asian",
          productDescription: "A Neplese Dish ",
          productImage: "1719666299835-momo.jpg",
      ),
      const ProductEntity(
        id: "66800695635213702ef03d8e",
        productName: "chowmein",
        productPrice: 150,
        productCategory: "Asian",
        productDescription: "A Neplese Dish ",
        productImage: "1719666325154-focused-on-you-e2-SLgEmzyg-unsplash.jpg",
      ),
    ];

    return lstProjects;
  }
}
