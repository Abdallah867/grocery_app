import 'package:flutter/material.dart';
import 'package:grocery_app/constants.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: kSecondaryColor,
      ),
    );
  }
}
