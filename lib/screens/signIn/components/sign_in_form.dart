import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:users/controllers/auth_controller.dart';
import 'package:provider/provider.dart';
import 'package:users/models/user_model.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  var userNameController = TextEditingController(text: 'Tergel');
  var passwordController = TextEditingController(text: 'Tergel88');

  Future<void> _signIn() async {
    String userName = userNameController.text.trim();
    String password = passwordController.text.trim();
    Users body = Users(userName: userName, password: password);
    var provider = Provider.of<AuthController>(context, listen: false);
    await provider.signIn(body);
    if (provider.isBack) {
      Navigator.of(context).pushNamed('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Welcome back',
          style: GoogleFonts.inter(
            fontSize: 17,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Login to your account',
          style: GoogleFonts.inter(
            fontSize: 23,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 35),
        TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.person),
            labelText: 'Username',
          ),
          controller: userNameController,
        ),
        const SizedBox(height: 20),
        TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.lock),
            labelText: 'Password',
          ),
          controller: passwordController,
        ),
        const SizedBox(height: 25),
        TextButton(
          onPressed: () {},
          child: const Text('Forgot password'),
        ),
        const SizedBox(height: 30),
        TextButton(
          style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
          onPressed: () {
            _signIn();
          },
          child: const Text('Log In'),
        ),
        const SizedBox(height: 100),
        ElevatedButton(
          child: const Text('Go Back'),
          onPressed: () {
            Navigator.of(context).pushNamed('/start');
          },
        )
      ],
    );
  }
}
