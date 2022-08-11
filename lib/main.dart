import 'package:flutter/material.dart';
import 'package:users/components/startPage.dart';
import 'package:users/state/signUpState.dart';
import 'components/homePage.dart';
import 'components/logInPage.dart';
import 'components/signUpPage.dart';
import 'package:provider/provider.dart';

void main() {
  // For State Management
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => DataClass()),
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
        '/signUp': (context) => const SignUpPage()
      },
    );
  }
}
