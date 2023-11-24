import 'package:flutter/material.dart';
import 'package:grocery_app/models/product_model.dart';
import 'package:grocery_app/widgets/custom_button.dart';

import '../widgets/product_details/counter_widget.dart';
import '../widgets/product_details/expansion_widget.dart';
import '../widgets/product_details/image_widget.dart';
import '../widgets/product_details/product_name.dart';

class ProductDetailsView extends StatelessWidget {
  final ProductModel product;
  const ProductDetailsView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 317.0,
            flexibleSpace: FlexibleSpaceBar(
              background: ImageWidget(
                image: product.productImage,
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
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 25.0,
          ),
          child: CustomButton(
            text: "Add to cart",
            onPressed: () {},
          )),
    );
  }
}
