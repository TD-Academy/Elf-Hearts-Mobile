import 'package:flutter/material.dart';
import 'package:users/screens/signIn/components/sign_in_form.dart';

class LoginDesktop extends StatefulWidget {
  const LoginDesktop({Key? key}) : super(key: key);

  @override
  State<LoginDesktop> createState() => _LoginDesktopState();
}

class _LoginDesktopState extends State<LoginDesktop> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
        Expanded( //<-- Expanded widget
          child: Image.asset(
             '../../../assets/img1.jpg', 
             fit: BoxFit.cover,
        )),
        Expanded( //<-- Expanded widget
          child: Container(
            constraints: const BoxConstraints(maxWidth: 21),
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: const SignInForm()
          ),
        ),
      ],
    );
  }
}