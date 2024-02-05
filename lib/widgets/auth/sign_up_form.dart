import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/views/home_view.dart';

import '../../constants.dart';
import '../../cubits/auth_cubit/auth_cubit.dart';
import '../../helper/show_snack_bar.dart';
import '../custom_button.dart';
import '../custom_text_field.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          showSnackBar(context, "signed up successfully");
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeView()),
          );
        }
        if (state is SignUpFailure) {
          showSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is SignUpLoading ? true : false,
          child: Form(
            key: authCubit.signupKey,
            child: Column(
              children: [
                CustomTextFormField(
                  onChanged: (username) {
                    authCubit.username = username;
                  },
                  text: 'Username',
                ),
                SizedBox(
                  height: 25.h,
                ),
                CustomTextFormField(
                  onChanged: (email) {
                    authCubit.email = email;
                  },
                  text: 'Email',
                ),
                SizedBox(
                  height: 25.h,
                ),
                CustomTextFormField(
                  onChanged: (password) {
                    authCubit.password = password;
                  },
                  text: 'Password',
                ),
                SizedBox(
                  height: 30.h,
                ),
                state is SignUpLoading
                    ? Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0.h),
                        child: const CircularProgressIndicator(
                          color: kSecondaryColor,
                        ),
                      )
                    : CustomButton(
                        onPressed: () async {
                          if (authCubit.signupKey.currentState!.validate()) {
                            await authCubit.registerNewUser();
                          }
                        },
                        text: "Sign up",
                        // onPressed: ,
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
