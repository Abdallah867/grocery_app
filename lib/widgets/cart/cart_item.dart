import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/cubits/cart_cubit/cart_cubit.dart';
import 'package:grocery_app/models/cart_model.dart';

import '../../constants.dart';
import '../product_details/counter_widget.dart';

class CartItem extends StatelessWidget {
  final CartModel cartProduct;
  const CartItem({
    super.key,
    required this.cartProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0.w, vertical: 15.h),
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Text(cartProduct.product.productName),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartProduct.product.productUnit,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: kGreyColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 12.0.h,
                  ),
                  CounterWidget(
                    counter: cartProduct.numberOfProducts,
                    productId: cartProduct.productId,
                    isInCartScreen: true,
                  ),
                ],
              ),
              leading: SizedBox(
                  width: 70.w,
                  child: Image.network(cartProduct.product.productImage)),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  BlocProvider.of<CartCubit>(context)
                      .deleteFromCart(cartProduct.productId);
                },
                icon: const Icon(
                  Icons.close,
                  color: Color(0xFFB3B3B3),
                ),
              ),
              const SizedBox(
                height: 43,
              ),
              Text(
                "${cartProduct.product.productPrice}\$",
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
