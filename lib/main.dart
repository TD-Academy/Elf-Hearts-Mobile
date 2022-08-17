import 'package:flutter/material.dart';
import 'package:users/screens/loading/loading_page.dart';
import 'package:users/screens/start/start_page.dart';
import 'package:users/screens/otp/verification_page.dart';
import 'package:users/controllers/auth_controller.dart';
import 'screens/home/home_page.dart';
import 'screens/signIn/sign_in_page.dart';
import 'screens/signUp/sign_up_page.dart';
import 'package:provider/provider.dart';
import 'screens/initial/initial_page.dart';

void main() {
  // For State Management
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AuthController()),
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
      routes: {
        '/initial': (context) => const InitialPage(),
        '/loading': (context) => const LoadingPage(),
        '/start': (context) => const StartPage(),
        '/home': (context) => const HomePage(),
        '/signIn': (context) => const LogInPage(),
        '/signUp': (context) => const SignUpPage(),
        '/otp': (context) => const VerificationPage()
      },
      initialRoute: '/initial',
    );
  }
}
