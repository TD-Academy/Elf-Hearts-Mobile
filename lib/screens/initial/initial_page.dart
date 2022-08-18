import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:users/controllers/auth_controller.dart';
import 'package:users/screens/home/home_page.dart';
import 'package:users/screens/loading/loading_page.dart';
import 'package:users/screens/start/start_page.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  AuthController authController = AuthController();
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(
      builder: (_, auth, __) {
        print(auth.status);
        return auth.status == AuthStatus.authorized
            ? const HomePage()
            : auth.status == AuthStatus.loading
                ? const LoadingPage()
                : const StartPage();
      },
    );
  }
}
