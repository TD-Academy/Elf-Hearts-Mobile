import 'package:flutter/material.dart';
import 'package:users/screens/signUp/components/sign_up_form.dart';

class SignUpMobile extends StatefulWidget {
  const SignUpMobile({Key? key}) : super(key: key);

  @override
  State<SignUpMobile> createState() => _SignUpMobileState();
}

class _SignUpMobileState extends State<SignUpMobile> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Center(
            child: SizedBox(
              width: 300,
              child: SignUpForm()
            ),
          ),
        ),
      ),
    );
  }
}
