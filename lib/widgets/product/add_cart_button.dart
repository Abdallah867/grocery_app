import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/cubits/cart_cubit/cart_cubit.dart';

import '../../constants.dart';
import '../../helper/show_snack_bar.dart';

class AddCartButton extends StatelessWidget {
  final String productId;
  const AddCartButton({
    super.key,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        showSnackBar(context, "Product added to cart succesfully");
      },
      builder: (context, state) {
        return FloatingActionButton(
          backgroundColor: kSecondaryColor,
          onPressed: () {
            BlocProvider.of<CartCubit>(context).addToCart(productId);
          },
          heroTag: UniqueKey(),
          elevation: 0,
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
        );
      },
    );
  }
}
