import 'package:flutter/material.dart';
import 'package:users/screens/signUp/components/sign_up_form.dart';

class SignUpTablet extends StatefulWidget {
  const SignUpTablet({Key? key}) : super(key: key);

  @override
  State<SignUpTablet> createState() => _SignUpTabletState();
}

class _SignUpTabletState extends State<SignUpTablet> {
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
