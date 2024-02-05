import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/cubits/cart_cubit/cart_cubit.dart';
import 'package:grocery_app/widgets/cart/cart_list_view.dart';

import '../../loading_widget.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartFetched) {
          return CartListView(products: state.products);
        } else if (state is CartInitial) {
          return const LoadingWidget();
        } else if (state is CartDeleting) {
          return CartListView(products: state.products);
        } else {
          return const Text('OOPS THERE WAS AN ERROR');
        }
      },
    );
  }
}
