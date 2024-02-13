import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/constants.dart';
import 'package:grocery_app/cubits/cart_cubit/cart_cubit.dart';
import 'package:grocery_app/models/product_model.dart';
import 'package:grocery_app/views/product_details_view.dart';
import 'package:grocery_app/widgets/custom_text.dart';

import 'add_cart_button.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => CartCubit()..getProduct(product.productId),
                child: BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    return ProductDetailsView(
                      product: state is CartProductFetched
                          ? state.cartProduct
                          : product,
                    );
                  },
                ),
              ),
            ),
          );
        },
        child: Container(
          // margin: const EdgeInsets.only(left: 24),
          height: 248.51.h,
          width: 173.32.w,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(18),
            ),
            border: Border.all(
              color: const Color(0xFFE2E2E2),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 20.0.h,
                    ),
                    child: SizedBox(
                      height: 70.0.h,
                      child: Hero(
                        tag: kProductImageTag,
                        child: Image.network(
                          product.productImage,
                        ),
                      ),
                    ),
                  ),
                ),
                CustomText(
                  text: product.productName,
                  theme:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w900),
                ),
                CustomText(
                  text: product.productUnit,
                  theme: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF7C7C7C)),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "${product.productPrice}\$",
                      theme: TextStyle(
                          fontSize: 18.0.sp, fontWeight: FontWeight.w700),
                    ),
                    BlocProvider(
                      create: (context) => CartCubit(),
                      child: AddCartButton(productId: product.productId),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
