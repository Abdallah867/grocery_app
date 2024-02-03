import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/cubits/category_products_cubit/category_products_cubit.dart';
import 'package:grocery_app/models/product_model.dart';
import 'package:grocery_app/widgets/product/product_card.dart';

import '../custom_app_bar.dart';
import '../loading_widget.dart';

class ProductsListView extends StatefulWidget {
  final String categoryName;
  const ProductsListView({super.key, required this.categoryName});

  @override
  State<ProductsListView> createState() => _ProductsListViewState();
}

class _ProductsListViewState extends State<ProductsListView> {
  @override
  void initState() {
    BlocProvider.of<CategoryProductsCubit>(context)
        .getCategoryProducts(widget.categoryName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(widget.categoryName),
      body: BlocBuilder<CategoryProductsCubit, CategoryProductsState>(
        builder: (context, state) {
          if (state is CategoryProductsSuccess) {
            final List<ProductModel> categoryProduct = state.categoryProduct;

            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
              child: GridView.builder(
                itemCount: categoryProduct.length,
                itemBuilder: (context, index) =>
                    ProductCard(product: categoryProduct[index]),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 6 / 9,
                ),
              ),
            );
          } else if (state is CategoryProductsLoading) {
            return const LoadingWidget();
          } else {
            return const Text("OOPS THERE WAS AN ERROR");
          }
        },
      ),
    );
  }
}
