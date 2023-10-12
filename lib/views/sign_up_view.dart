import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_app/widgets/have_an_account_widget.dart';

import '../constants.dart';
import '../cubits/auth_cubit/auth_cubit.dart';
import '../widgets/custom_text.dart';
import '../widgets/logo_widget.dart';
import '../widgets/sign_up_form.dart';
import 'login_view.dart';

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
                const SizedBox(height: 80),
                const LogoWidget(),
                const SizedBox(height: 60),
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
