import 'package:flutter/material.dart';

import '../../constants.dart';

class ExpansionWidget extends StatelessWidget {
  final String productDetail;
  const ExpansionWidget({
    super.key,
    required this.productDetail,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.symmetric(vertical: 5),
      title: const Text("Product Detail",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
      childrenPadding: const EdgeInsets.symmetric(vertical: 10),
      shape: const Border(
        top: BorderSide(
          width: 1.0,
          color: Color(0xFFE2E2E2),
        ),
        bottom: BorderSide(
          width: 1.0,
          color: Color(0xFFE2E2E2),
        ),
      ),
      collapsedShape: const Border(
        top: BorderSide(
          width: 1.0,
          color: Color(0xFFE2E2E2),
        ),
        bottom: BorderSide(
          width: 1.0,
          color: Color(0xFFE2E2E2),
        ),
      ),
      children: [
        Text(productDetail,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: kGreyColor,
            )),
      ],
    );
  }
}
