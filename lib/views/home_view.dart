import 'package:flutter/material.dart';
import 'package:grocery_app/constants.dart';

import '../widgets/product_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
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
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          ProductCard(),
        ],
      ),
    );
  }
}
