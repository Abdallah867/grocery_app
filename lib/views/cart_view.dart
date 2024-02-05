import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/cubits/cart_cubit/cart_cubit.dart';
import 'package:grocery_app/widgets/custom_button.dart';

import '../custom_app_bar.dart';
import '../widgets/cart/cart_list.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("My Cart"),
      body: BlocProvider(
        create: (context) => CartCubit()..getProducts(),
        child: const CartList(),
      ),
      bottomNavigationBar: const CheckoutButton(),
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
        bottom: 24.h,
        top: 8.h,
      ),
      child: CustomButton(text: "Go to Checkout", onPressed: () {}),
    );
  }
}
