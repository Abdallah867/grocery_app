import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/cubits/category_products_cubit/category_products_cubit.dart';
import 'package:grocery_app/models/product_model.dart';
import 'package:grocery_app/widgets/product/product_card.dart';

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
      body: BlocBuilder<CategoryProductsCubit, CategoryProductsState>(
        builder: (context, state) {
          if (state is CategoryProductsSuccess) {
            final List<ProductModel> categoryProduct = state.categoryProduct;
            return GridView.builder(
              itemCount: categoryProduct.length,
              itemBuilder: (context, index) =>
                  ProductCard(product: categoryProduct[index]),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 120,
                childAspectRatio: 7 / 9,
              ),
            );
          } else {
            return Text("OOPS THERE WAS AN ERROR");
          }
        },
      ),
    );
  }
}
