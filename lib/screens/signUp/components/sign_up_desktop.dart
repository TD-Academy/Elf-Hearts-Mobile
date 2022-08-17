import 'package:flutter/material.dart';
import 'package:users/screens/signUp/components/sign_up_form.dart';

class SignUpDesktop extends StatefulWidget {
  const SignUpDesktop({Key? key}) : super(key: key);

  @override
  State<SignUpDesktop> createState() => _SignUpDesktopState();
}

class _SignUpDesktopState extends State<SignUpDesktop> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
        Expanded(
            //<-- Expanded widget
            child: Image.asset(
          '../../../assets/img2.jpg',
          fit: BoxFit.cover,
        )),
        Expanded(
          //<-- Expanded widget
          child: Container(
            constraints: const BoxConstraints(maxWidth: 21),
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: const SignUpForm()
          ),
        ),
      ],
    );
  }
}
