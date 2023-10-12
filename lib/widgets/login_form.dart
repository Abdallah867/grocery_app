import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants.dart';
import '../cubits/auth_cubit/auth_cubit.dart';
import '../helper/show_snack_bar.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

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
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  text: 'Email',
                  onChanged: (email) {
                    authCubit.email = email;
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTextFormField(
                  text: 'Password',
                  onChanged: (password) {
                    authCubit.password = password;
                  },
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
                state is SignInLoading
                    ? const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: CircularProgressIndicator(
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
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
