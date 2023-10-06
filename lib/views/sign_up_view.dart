import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_app/views/login_view.dart';
import 'package:grocery_app/widgets/custom_button.dart';
import 'package:grocery_app/widgets/custom_text.dart';

import '../constants.dart';
import '../widgets/custom_text_field.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              Center(
                child: SvgPicture.asset("assets/images/logo.svg"),
              ),
              const SizedBox(
                height: 60,
              ),
              CustomText(
                text: "Sign up",
                theme: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomText(
                text: "Enter your credentials to continue",
                theme: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(
                height: 30,
              ),
              const CustomTextFormField(
                text: 'Username',
              ),
              const SizedBox(
                height: 25,
              ),
              const CustomTextFormField(
                text: 'Email',
              ),
              const SizedBox(
                height: 25,
              ),
              const CustomTextFormField(
                text: 'Password',
              ),
              const SizedBox(
                height: 30,
              ),
              const CustomButton(
                text: "Sign up",
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Already have an account? ",
                    theme: Theme.of(context).textTheme.titleMedium,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const LoginView()),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
