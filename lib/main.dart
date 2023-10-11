import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/test.dart';
import 'package:grocery_app/views/sign_up_view.dart';

import 'views/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Client client = Client();
  // client = Client()
  //     .setEndpoint("https://cloud.appwrite.io/v1")
  //     .setProject("651de5a0d4c1158c8b2f");

  // Account account = Account(client);

  runApp(MyApp());
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
      home: SignUpView(),
    );
  }
}
