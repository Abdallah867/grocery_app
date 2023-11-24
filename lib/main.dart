import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/cubits/check_user_if_exists/check_user_if_exists_cubit.dart';
import 'package:grocery_app/views/sign_up_view.dart';
import 'cubits/check_user_if_exists/check_user_if_exists_state.dart';
import 'views/home_view.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Gilroy",
        // colorScheme: ColorScheme.fromSeed(
        //   seedColor: Colors.deepPurple,
        // ),

        useMaterial3: true,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            fontFamily: "Gilroy",
          ),
          titleSmall: TextStyle(
            color: Color(0xFF7C7C7C),
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontFamily: "Gilroy",
          ),
          titleMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            fontFamily: "Gilroy",
          ),
        ),
      ),
      home: BlocProvider(
        create: (context) => CheckUserIfExistsCubit()..getUserIfExists(),
        child: BlocBuilder<CheckUserIfExistsCubit, CheckUserIfExistsState>(
          builder: (context, state) {
            if (state is UserExists) {
              return const HomeView();
            } else {
              return const SignUpView();
            }
          },
        ),
      ),
    );
  }
}
