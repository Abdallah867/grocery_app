import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/custom_button.dart';

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

class FavouriteItem extends StatelessWidget {
  const FavouriteItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30),
      leading: Image.asset("assets/images/banana.png"),
      title: const Text('Bell Pepper Red'),
      subtitle: const Text(
        '1kg, Price',
        style: TextStyle(
          fontSize: 14,
          color: kGreyColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "4,99\$",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_forward_ios_sharp,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }
}

class FavouriteListView extends StatelessWidget {
  const FavouriteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, int) => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Divider(),
      ),
      itemBuilder: (context, index) => const FavouriteItem(),
      itemCount: 4,
    );
  }
}
