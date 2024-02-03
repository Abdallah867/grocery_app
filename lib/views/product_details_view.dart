import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/models/product_model.dart';
import 'package:grocery_app/widgets/custom_button.dart';

import '../cubits/cart_cubit/cart_cubit.dart';
import '../helper/show_snack_bar.dart';
import '../widgets/product_details/counter_widget.dart';
import '../widgets/product_details/expansion_widget.dart';
import '../widgets/product_details/image_widget.dart';
import '../widgets/product_details/product_name.dart';

class ProductDetailsView extends StatelessWidget {
  final ProductModel product;
  final imageTag;
  const ProductDetailsView(
      {super.key, required this.product, required this.imageTag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 317.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: imageTag,
                child: ImageWidget(
                  image: product.productImage,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 47,
                  ),
                  ProductNameWidget(
                    product: product,
                  ),
                  const SizedBox(height: 30),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CounterWidget(),
                      Text(
                        "4.99\$",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  ExpansionWidget(
                    productDetail: product.productDetail,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BlocProvider(
        create: (context) => CartCubit(),
        child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 25.0,
            ),
            child: BlocConsumer<CartCubit, CartState>(
              listener: (context, state) {
                if (state is CartAdding) {
                  showSnackBar(context, "Product added to cart succesfully");
                }
              },
              builder: (context, state) {
                return CustomButton(
                  text: "Add to cart",
                  onPressed: () {
                    BlocProvider.of<CartCubit>(context)
                        .addToCart(product.productId);
                  },
                );
              },
            )),
      ),
    );
  }
}
