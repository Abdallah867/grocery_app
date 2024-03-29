import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/cubits/cart_cubit/cart_cubit.dart';
import 'package:grocery_app/loading_widget.dart';
import 'package:grocery_app/widgets/custom_button.dart';

import '../custom_app_bar.dart';
import '../widgets/cart/cart_list_view.dart';

class CartView extends StatelessWidget {
  final String? productId;
  const CartView({super.key, this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getProducts(),
      child: Scaffold(
        appBar: customAppBar("My Cart"),
        body: BlocBuilder<CartCubit, CartState>(builder: (context, state) {
          if (state is CartFetched) {
            return CartListView(products: state.products);
          } else if (state is CartInitial) {
            return const LoadingWidget();
          } else if (state is CartDeleting) {
            return CartListView(products: state.products);
          } else {
            return const Text('OOPS THERE WAS AN ERROR');
          }
        }),
        bottomNavigationBar: const CheckoutButton(),
      ),
    );
  }
}

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24.0.w,
        right: 24.0.w,
        bottom: 24.0.h,
        top: 8.h,
      ),
      child: CustomButton(text: "Go to Checkout", onPressed: () {}),
    );
  }
}
// (
//         