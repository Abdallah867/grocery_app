import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/product_cubit/product_cubit.dart';
import '../widgets/product/exclusive_offer_widget.dart';

class ShopView extends StatelessWidget {
  const ShopView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: 100,
          ),
        ),
        SliverToBoxAdapter(
          child: ExclusiveOfferWidget(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 40,
          ),
        ),
        SliverToBoxAdapter(
          child: ExclusiveOfferWidget(),
        ),
      ],
    );
  }
}
