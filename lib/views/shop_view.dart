import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/cubits/product_cubit/product_cubit.dart';
import '../widgets/product/filtered_product_widget.dart';

class ShopView extends StatelessWidget {
  const ShopView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 100,
          ),
        ),
        SliverToBoxAdapter(
          child: BlocProvider(
            create: (context) => ProductCubit(),
            child: const FilteredProductWidget(
              filter: "isExclusive",
              name: "Exclusive Offer",
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 40,
          ),
        ),
        SliverToBoxAdapter(
          child: BlocProvider(
            create: (context) => ProductCubit(),
            child: const FilteredProductWidget(
              filter: "isBestSelling",
              name: "Best Selling Offer",
            ),
          ),
        ),
      ],
    );
  }
}
