import 'package:flutter/material.dart';
import 'components/accountPage.dart';
import 'components/homePage.dart';
import 'components/signInPage.dart';
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
        '/signIn':(context) => const SignInPage(),
        '/signUp': (context) => const SignUpPage()
      },
      // home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


