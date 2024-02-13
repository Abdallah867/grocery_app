import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/models/product_model.dart';
import 'package:grocery_app/widgets/product/product_card.dart';

class ProductsListView extends StatelessWidget {
  final List<ProductModel> products;
  const ProductsListView({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0),
        child: ListView.separated(
          separatorBuilder: (context, inte) => SizedBox(
            width: 24.w,
          ),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>
              ProductCard(product: products[index]),
          itemCount: products.length,
        ),
      ),
    );
  }
}
