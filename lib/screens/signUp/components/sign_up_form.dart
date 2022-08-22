import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:users/controllers/auth_controller.dart';
import 'package:users/models/user_model.dart';

import '../../../widgets/alert_dialog.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  String respMes = '';
  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var password1Controller = TextEditingController();


  Future<void> _registration() async {
    String userName = userNameController.text.trim();
    String password = passwordController.text.trim();
    String password1 = passwordController.text.trim();

    String email = emailController.text.trim();
    if (userName != '' && password != '' && email != '') {
      setState(() {
        respMes = '';
      });
      Users body = Users(userName: userName, password: password, email: email);
      var provider = Provider.of<AuthController>(context, listen: false);
      await provider.signUp(body);
      if (provider.isBack) {
        Navigator.of(context).pushNamed('/otp');
      }
    } else {
      CustomAlertDialog("Sign Up", "All fields must be filled", context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Create your account',
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
            icon: Icon(Icons.email),
            labelText: 'Email',
          ),
          controller: emailController,
        ),
        const SizedBox(height: 20),
        TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.lock),
            labelText: 'Password',
          ),
          controller: passwordController,
        ),
        const SizedBox(height: 20),
        TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.lock),
            labelText: 'Confirm Password',
          ),
          controller: password1Controller,
        ),
        const SizedBox(height: 55),
        TextButton(
          style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
          onPressed: () {
            _registration();
          },
          child: const Text('Sign Up'),
        ),
        const SizedBox(height: 20),
        Text(respMes),
        const SizedBox(height: 60),
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
