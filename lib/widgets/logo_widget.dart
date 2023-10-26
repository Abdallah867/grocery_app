import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 80),
        Center(
          child: SvgPicture.asset("assets/images/logo.svg"),
        ),
        const SizedBox(height: 60),
      ],
    );
  }
}
