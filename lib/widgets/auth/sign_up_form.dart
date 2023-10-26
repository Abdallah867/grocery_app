import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            MaterialPageRoute(builder: (context) => HomeView()),
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
                state is SignUpLoading
                    ? const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: CircularProgressIndicator(
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
