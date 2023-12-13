import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/cubits/product_cubit/product_cubit.dart';

import '../../constants.dart';
import '../../cubits/product_cubit/product_state.dart';
import '../custom_text.dart';
import 'product_list_view.dart';

class FilteredProductWidget extends StatefulWidget {
  final String name;
  final String filter;
  const FilteredProductWidget({
    super.key,
    required this.filter,
    required this.name,
  });

  @override
  State<FilteredProductWidget> createState() => _FilteredProductWidgetState();
}

class _FilteredProductWidgetState extends State<FilteredProductWidget> {
  @override
  void initState() {
    print("baby");
    BlocProvider.of<ProductCubit>(context).getProducts(widget.filter);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ExclusiveProductSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: widget.name,
                      theme: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const CustomText(
                      text: "See all",
                      theme: TextStyle(
                        color: kSecondaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              ProductsListView(
                products: state.exclusiveProducts,
              ),
            ],
          );
        } else {
          return const Text("OOPS THERE WAS AN ERROR");
        }
      },
    );
  }
}
