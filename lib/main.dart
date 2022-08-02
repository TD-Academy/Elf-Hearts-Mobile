import 'package:flutter/material.dart';
import 'components/homePage.dart';
import 'components/logInPage.dart';
import 'components/signUpPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
        '/signIn':(context) => const LogInPage(),
        '/signUp': (context) => const SignUpPage()
      },
    );
  }
}


