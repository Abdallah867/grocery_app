import 'package:flutter/material.dart';

import '../../constants.dart';

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
