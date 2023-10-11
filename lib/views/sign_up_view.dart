import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:grocery_app/views/login_view.dart';
import 'package:grocery_app/widgets/custom_button.dart';
import 'package:grocery_app/widgets/custom_text.dart';

import '../constants.dart';
import '../widgets/custom_text_field.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
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
                SignUpForm(),
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
      ),
    );
  }
}

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);

    return Form(
      key: authCubit.signupKey,
      child: Column(
        children: [
          CustomTextFormField(
            onChanged: (username) {
              authCubit.username = username;
            },
            text: 'Username',
          ),
          const SizedBox(
            height: 25,
          ),
          CustomTextFormField(
            onChanged: (email) {
              authCubit.email = email;
            },
            text: 'Email',
          ),
          const SizedBox(
            height: 25,
          ),
          CustomTextFormField(
            onChanged: (password) {
              authCubit.password = password;
            },
            text: 'Password',
          ),
          const SizedBox(
            height: 30,
          ),
          CustomButton(
            onPressed: () async {
              if (authCubit.signupKey.currentState!.validate()) {
                await authCubit.registerNewUser();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("signed up successfully"),
                  ),
                );
              }
            },
            text: "Sign up",
            // onPressed: ,
          ),
        ],
      ),
    );
  }
}
