import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_app/constants.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 248.51,
      width: 173.32,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(18),
        ),
        border: Border.all(
          color: const Color(0xFFE2E2E2),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
            ),
            child: Image.asset(
              "assets/images/banana.png",
              height: 80,
              width: 101,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12.0, bottom: 12.0),
                child: FloatingActionButton(
                  backgroundColor: kSecondaryColor,
                  onPressed: () {},
                  elevation: 0,
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
