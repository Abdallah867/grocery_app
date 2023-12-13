import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/favourite/favourite_list_view.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: const Text(
          "My Favourite",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: 24.0,
          right: 24.0,
          bottom: 24,
          top: 8,
        ),
        child: CustomButton(text: "Add All To Cart", onPressed: () {}),
      ),
      body: const FavouriteListView(),
    );
  }
}
