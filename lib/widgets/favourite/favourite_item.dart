import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/product_model.dart';

class FavouriteItem extends StatelessWidget {
  final ProductModel product;
  const FavouriteItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30),
      leading: Image.network(product.productImage),
      title: Text(product.productName),
      subtitle: Text(
        product.productUnit,
        style: const TextStyle(
          fontSize: 14,
          color: kGreyColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "${product.productPrice}\$",
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_forward_ios_sharp,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }
}
