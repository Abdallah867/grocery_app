import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/models/product_model.dart';
import 'package:grocery_app/views/cart_view.dart';
import 'package:grocery_app/widgets/custom_button.dart';

import '../cubits/cart_cubit/cart_cubit.dart';
import '../helper/show_snack_bar.dart';
import '../widgets/product_details/counter_widget.dart';
import '../widgets/product_details/expansion_widget.dart';
import '../widgets/product_details/image_widget.dart';
import '../widgets/product_details/product_name.dart';

class ProductDetailsView extends StatelessWidget {
  final ProductModel product;
  const ProductDetailsView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..findIfProductExists(product.productId),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 317.0.h,
              flexibleSpace: FlexibleSpaceBar(
                background: ImageWidget(
                  image: product.productImage,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0.w),
                child: Column(
                  children: [
                    SizedBox(height: 47.h),
                    ProductNameWidget(product: product),
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CounterWidget(),
                        Text(
                          "4.99\$",
                          style: TextStyle(
                              fontSize: 24.sp, fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    ExpansionWidget(
                      productDetail: product.productDetail,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 20.0.h,
              horizontal: 25.0.w,
            ),
            child: BlocConsumer<CartCubit, CartState>(
              listener: (context, state) {
                if (state is CartAdding) {
                  showSnackBar(context, "Product added to cart succesfully");
                }
              },
              builder: (context, state) {
                if (state is IsProductExists) {
                  return state.isExists
                      ? CustomButton(
                          text: "Go to cart",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CartView(),
                              ),
                            );
                          })
                      : CustomButton(
                          text: "Add to cart",
                          onPressed: () {
                            BlocProvider.of<CartCubit>(context)
                                .addToCart(product.productId);
                          },
                        );
                } else {
                  return const Text('An error Occured');
                }
              },
            )),
      ),
    );
  }
}
