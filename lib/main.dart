import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/loading/loading_page.dart';
import './screens/otp/verified_page.dart';
import './screens/start/start_page.dart';
import './screens/otp/verification_page.dart';
import './controllers/auth_controller.dart';
import './screens/home/home_page.dart';
import './screens/signIn/sign_in_page.dart';
import './screens/signUp/sign_up_page.dart';
import './screens/initial/initial_page.dart';
import './screens/signUp/fill_info_page.dart';

void main() {
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
        '/fillInfo': (context) => const FillInfoPage(),
        '/initial': (context) => const InitialPage(),
        '/loading': (context) => const LoadingPage(),
        '/start': (context) => const StartPage(),
        '/home': (context) => const HomePage(),
        '/signIn': (context) => const LogInPage(),
        '/signUp': (context) => const SignUpPage(),
        '/otp': (context) => const VerificationPage(),
        '/verified': (context) => const VerifiedPage(),
      },
      initialRoute: '/initial',
    );
  }
}
