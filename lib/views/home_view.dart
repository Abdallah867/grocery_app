import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/constants.dart';
import 'package:grocery_app/cubits/product_cubit/product_cubit.dart';
import 'package:grocery_app/views/shop_view.dart';

import '../widgets/product/exclusive_offer_widget.dart';
import 'category_view.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});
  List views = [
    const ShopView(),
    const CategoryView(),
  ];

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(),
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageIndex,
          selectedItemColor: kSecondaryColor,
          unselectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {
                    pageIndex = 0;
                    setState(() {});
                  },
                  child: const Icon(Icons.storefront_sharp)),
              label: "Store",
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {
                    pageIndex = 1;
                    setState(() {});
                  },
                  child: const Icon(Icons.manage_search_outlined)),
              label: "Explore",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: "Cart",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: "Favourite",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: "Account",
            ),
          ],
        ),
        body: widget.views[pageIndex],
      ),
    );
  }
}
