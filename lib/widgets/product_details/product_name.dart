import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/cubits/cubit/favourite_cubit.dart';
import 'package:grocery_app/models/product_model.dart';

import '../../constants.dart';
import 'like_butoon.dart';

class ProductNameWidget extends StatelessWidget {
  final ProductModel product;
  const ProductNameWidget({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // SizedBox(
        //   width: 25,
        // ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.productName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
            ),
            Text(
              product.productUnit,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: kGreyColor,
              ),
            ),
          ],
        ),
        BlocProvider(
          create: (context) => FavouriteCubit(),
          child: LikeButton(
            productId: product.productId,
          ),
        ),
      ],
    );
  }
}
