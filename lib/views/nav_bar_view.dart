import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/constants.dart';
import 'package:grocery_app/cubits/cart_cubit/cart_cubit.dart';
import 'package:grocery_app/cubits/favourite_cubit/favourite_cubit.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../cubits/category_cubit/category_cubit.dart';
import 'cart_view.dart';
import 'category_view.dart';
import 'favourite_view.dart';
import 'shop_view.dart';

final PersistentTabController _controller =
    PersistentTabController(initialIndex: 0);

class NavBarView extends StatelessWidget {
  const NavBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartCubit()..getProducts(),
        ),
        BlocProvider(
          create: (context) => FavouriteCubit(),
        ),
      ],
      child: Scaffold(
        body: PersistentTabView(
          context,
          bottomScreenMargin: 0,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          backgroundColor: Colors.white, // Default is Colors.white.
          navBarStyle: NavBarStyle
              .style6, // Choose the nav bar style with this property.
        ),
      ),
    );
  }
}

List<Widget> _buildScreens() {
  return [
    const ShopView(),
    BlocProvider(
      create: (context) => CategoryCubit()..getCategories(),
      child: const CategoryView(),
    ),
    const CartView(),
    const FavouriteView(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    navBarIcon(Icons.storefront_sharp, "Store"),
    navBarIcon(Icons.manage_search_outlined, "Explore"),
    navBarIcon(Icons.shopping_cart_outlined, "Cart"),
    navBarIcon(Icons.favorite_border, "Favourite"),
    // navBarIcon(Icons.person_outline, "Account"),
  ];
}

PersistentBottomNavBarItem navBarIcon(IconData icon, String title) {
  return PersistentBottomNavBarItem(
    title: title,
    inactiveIcon: Icon(
      icon,
      color: Colors.black,
    ),
    icon: Icon(
      icon,
      size: 22,
      color: kSecondaryColor,
    ),
    activeColorPrimary: kSecondaryColor,
  );
}
