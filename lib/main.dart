import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/cubits/check_user_if_exists/check_user_if_exists_cubit.dart';
import 'package:grocery_app/helper/cache_helper.dart';
import 'package:grocery_app/views/home_view.dart';
import 'package:grocery_app/views/sign_up_view.dart';
import 'cubits/check_user_if_exists/check_user_if_exists_state.dart';
import 'helper/service_locator.dart';
import 'simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  setupAppwrite();
  setupSharedPrefrences();

  getIt.get<CacheHelper>().init();

  runApp(const GroceryApp());
}

class GroceryApp extends StatelessWidget {
  const GroceryApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(414, 896),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              fontFamily: "Gilroy",
              useMaterial3: true,
              textTheme: TextTheme(
                titleLarge: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Gilroy",
                ),
                titleSmall: TextStyle(
                  color: const Color(0xFF7C7C7C),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Gilroy",
                ),
                titleMedium: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Gilroy",
                ),
              ),
            ),
            home: BlocProvider(
              create: (context) => CheckUserIfExistsCubit()..getUserIfExists(),
              child:
                  BlocBuilder<CheckUserIfExistsCubit, CheckUserIfExistsState>(
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
        });
  }
}
