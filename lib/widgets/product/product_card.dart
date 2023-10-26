import 'package:flutter/material.dart';
import 'package:grocery_app/constants.dart';
import 'package:grocery_app/models/product_model.dart';
import 'package:grocery_app/widgets/custom_text.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 24),
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                ),
                child: Image.network(
                  product.productImage,
                ),
              ),
            ),
            CustomText(
              text: product.productName,
              theme: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
            ),
            CustomText(
              text: product.productUnit,
              theme: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF7C7C7C)),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "${product.productPrice}\$",
                  theme: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.w700),
                ),
                const AddCartButton(),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}

class AddCartButton extends StatelessWidget {
  const AddCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: kSecondaryColor,
      onPressed: () {},
      elevation: 0,
      child: const Icon(
        Icons.add,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}
