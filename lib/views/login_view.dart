import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_app/widgets/custom_button.dart';
import 'package:grocery_app/widgets/custom_text.dart';

import '../constants.dart';
import '../widgets/custom_text_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
                text: "Login",
                theme: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomText(
                text: "Enter your emails and password",
                theme: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(
                height: 30,
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
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Forgot Password ?"),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const CustomButton(
                text: "Login",
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Don't have an account? ",
                    theme: Theme.of(context).textTheme.titleMedium,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Signup",
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
