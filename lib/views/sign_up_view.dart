import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/widgets/auth/have_an_account_widget.dart';
import '../cubits/auth_cubit/auth_cubit.dart';
import '../widgets/custom_text.dart';
import '../widgets/logo_widget.dart';
import '../widgets/auth/sign_up_form.dart';

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
                const LogoWidget(),
                CustomText(
                  text: "Sign up",
                  theme: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                CustomText(
                  text: "Enter your credentials to continue",
                  theme: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 30),
                const SignUpForm(),
                const SizedBox(height: 20),
                const HaveAnAccountWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
