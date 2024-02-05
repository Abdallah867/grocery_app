import 'package:flutter/material.dart';
import 'package:grocery_app/models/cart_model.dart';
import 'package:grocery_app/widgets/cart/cart_item.dart';

class CartListView extends StatelessWidget {
  final List<CartModel> products;
  const CartListView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, inte) => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Divider(),
      ),
      itemBuilder: (context, index) => CartItem(
        cartProduct: products[index],
      ),
      itemCount: products.length,
    );
  }
}
