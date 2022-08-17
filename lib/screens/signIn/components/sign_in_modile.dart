import 'package:flutter/material.dart';
import 'package:users/screens/signIn/components/sign_in_form.dart';

class LoginMobile extends StatefulWidget {
  const LoginMobile({Key? key}) : super(key: key);

  @override
  State<LoginMobile> createState() => _LoginMobileState();
}

class _LoginMobileState extends State<LoginMobile> {
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
