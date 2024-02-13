import 'package:grocery_app/models/product_model.dart';

class CartModel extends ProductModel {
  final String productId;
  final String cartId;
  final int numberOfProducts;
  final ProductModel product;

  CartModel({
    required this.product,
    required this.productId,
    required this.cartId,
    required this.numberOfProducts,
  }) : super(
          productId: product.productId,
          productName: product.productName,
          productUnit: product.productUnit,
          productDetail: product.productDetail,
          productImage: product.productImage,
          productPrice: product.productPrice,
          review: product.review,
          isExclusive: product.isExclusive,
          isBestSelling: product.isBestSelling,
        );

  factory CartModel.fromJson(Map<String, dynamic> json, ProductModel product) {
    return CartModel(
        product: product,
        productId: json["productId"],
        cartId: json['\$id'],
        numberOfProducts: json['numberOfProducts']);
  }
}
