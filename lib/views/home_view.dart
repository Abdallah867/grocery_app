import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/constants.dart';
import 'package:grocery_app/cubits/cart_cubit/cart_cubit.dart';
import 'package:grocery_app/views/cart_view.dart';
import 'package:grocery_app/views/favourite_view.dart';
import 'package:grocery_app/views/profile_view.dart';
import 'package:grocery_app/views/shop_view.dart';

import '../cubits/category_cubit/category_cubit.dart';
import 'category_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    // BlocProvider.of<ProductCubit>(context).getProducts();
    // BlocProvider.of<CategoryCubit>(context).getCategories();
    super.initState();
  }

  List views = [
    const ShopView(),
    BlocProvider(
      create: (context) => CategoryCubit()..getCategories(),
      child: const CategoryView(),
    ),
    const CartView(),
    const FavouriteView(),
    const ProfileView(),
  ];
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          pageIndex = index;
          setState(() {});
        },
        currentIndex: pageIndex,
        selectedItemColor: kSecondaryColor,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront_sharp),
            label: "Store",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_search_outlined),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Favourite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Account",
          ),
        ],
      ),
      body: views[pageIndex],
    );
  }
}
