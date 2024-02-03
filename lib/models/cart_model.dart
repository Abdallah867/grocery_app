import 'dart:html';

import 'package:grocery_app/models/product_model.dart';

class CartModel {
  final String productId;
  final String cartId;
  final int numberOfProducts;
  final ProductModel product;

  CartModel({
    required this.product,
    required this.productId,
    required this.cartId,
    required this.numberOfProducts,
  });

  factory CartModel.fromJson(Map<String, dynamic> json, ProductModel product) {
    return CartModel(
        product: product,
        productId: json["productId"],
        cartId: json['\$id'],
        numberOfProducts: json['numberOfProducts']);
  }
}
