import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          padding: EdgeInsets.symmetric(horizontal: 25.0.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 80.h),
                const LogoWidget(),
                SizedBox(height: 60.h),
                CustomText(
                  text: "Login",
                  theme: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 10.h),
                CustomText(
                  text: "Enter your emails and password",
                  theme: Theme.of(context).textTheme.titleSmall,
                ),
                const LoginForm(),
                SizedBox(height: 20.h),
                const DontHaveAnAccountWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
