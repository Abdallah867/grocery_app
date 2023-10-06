import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final TextStyle? theme;
  final String text;
  const CustomText({
    super.key,
    this.theme,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: theme,
    );
  }
}
