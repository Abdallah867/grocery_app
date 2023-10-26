import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../views/login_view.dart';
import '../custom_text.dart';

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          text: "Already have an account? ",
          theme: Theme.of(context).textTheme.titleMedium,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const LoginView()),
            );
          },
          child: const Text(
            "Login",
            style: TextStyle(
              color: kSecondaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
