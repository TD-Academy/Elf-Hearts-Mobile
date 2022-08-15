import 'package:flutter/material.dart';
import 'package:users/screens/start/startPage.dart';
import 'package:users/screens/otp/verificationPage.dart';
import 'package:users/state/loginState.dart';
import 'package:users/state/signUpState.dart';
import 'screens/home/homePage.dart';
import 'screens/signIn/signInPage.dart';
import 'screens/signUp/signUpPage.dart';
import 'package:provider/provider.dart';

void main() {
  // For State Management
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => SignUpClass()),
    ChangeNotifierProvider(create: (_) => SignInClass()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(brightness: Brightness.dark),
      initialRoute: '/start',
      routes: {
        '/start': (context) => const StartPage(),
        '/home': (context) => const HomePage(),
        '/signIn': (context) => const LogInPage(),
        '/signUp': (context) => const SignUpPage(),
        '/otp': (context) => const VerificationPage()
      },
    );
  }
}
