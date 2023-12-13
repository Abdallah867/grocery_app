import 'package:flutter/material.dart';

import 'favourite_item.dart';

class FavouriteListView extends StatelessWidget {
  const FavouriteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, numb) => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Divider(),
      ),
      itemBuilder: (context, index) => const FavouriteItem(),
      itemCount: 4,
    );
  }
}
