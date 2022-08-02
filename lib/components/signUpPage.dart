import 'package:flutter/material.dart';
import '../components/homePage.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Go back.'),
          onPressed: () {
            Navigator.of(context).pushNamed('/home');
          }
        )
      ),
    );
  }
}