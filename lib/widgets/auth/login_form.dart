import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants.dart';
import '../../cubits/auth_cubit/auth_cubit.dart';
import '../../helper/show_snack_bar.dart';
import '../../views/home_view.dart';
import '../custom_button.dart';
import '../custom_text_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          showSnackBar(context, "Logged in successfully");
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeView()),
          );
        }
        if (state is SignInFailure) {
          showSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is SignInLoading ? true : false,
          child: Form(
            key: authCubit.loginKey,
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                CustomTextFormField(
                  text: 'Email',
                  onChanged: (email) {
                    authCubit.email = email;
                  },
                ),
                SizedBox(
                  height: 25.h,
                ),
                CustomTextFormField(
                  text: 'Password',
                  onChanged: (password) {
                    authCubit.password = password;
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Forgot Password ?"),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                state is SignInLoading
                    ? Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0.h),
                        child: const CircularProgressIndicator(
                          color: kSecondaryColor,
                        ),
                      )
                    : CustomButton(
                        onPressed: () async {
                          if (authCubit.loginKey.currentState!.validate()) {
                            await authCubit.loginUser();
                          }
                        },
                        text: "Login",
                        // onPressed: ,
                      ),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
