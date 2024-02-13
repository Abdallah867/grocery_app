import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String name;
  final bool isPassword;
  const CustomTextField({
    super.key,
    required this.name,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 9,
        ),
      ],
    );
  }
}
