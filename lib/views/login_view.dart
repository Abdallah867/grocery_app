import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/widgets/auth/dont_have_an_account.dart';
import '../cubits/auth_cubit/auth_cubit.dart';
import '../widgets/custom_text.dart';
import '../widgets/auth/login_form.dart';
import '../widgets/logo_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
                  text: "Login",
                  theme: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                CustomText(
                  text: "Enter your emails and password",
                  theme: Theme.of(context).textTheme.titleSmall,
                ),
                const LoginForm(),
                const SizedBox(height: 20),
                const DontHaveAnAccountWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
