import 'package:flutter/material.dart';
import 'package:users/screens/signIn/components/sign_in_form.dart';

class LoginTablet extends StatefulWidget {
  const LoginTablet({Key? key}) : super(key: key);

  @override
  State<LoginTablet> createState() => _LoginTabletState();
}

class _LoginTabletState extends State<LoginTablet> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Center(
            child: SizedBox(
              width: 300,
              child: SignInForm()
            ),
          ),
        ),
      ),
    );
  }
}