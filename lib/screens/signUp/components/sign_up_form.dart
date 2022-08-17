import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:users/controllers/auth_controller.dart';
import 'package:users/models/user_model.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var passwordController = TextEditingController();

  Future<void> _registration() async {
    String userName = userNameController.text.trim();
    String password = passwordController.text.trim();
    String firstName = firstNameController.text.trim();
    String lastName = lastNameController.text.trim();
    String email = emailController.text.trim();
    String phoneNumber = phoneNumberController.text.trim();
    Users body = Users(
        userName: userName,
        password: password,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: '976|$phoneNumber');
    var provider = Provider.of<AuthController>(context, listen: false);
    await provider.signUp(body);
    if (provider.isBack) {
      Navigator.of(context).pushNamed('/otp');
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
            labelText: 'Firstname',
          ),
          controller: firstNameController,
        ),
        const SizedBox(height: 20),
        TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.person),
            labelText: 'Lastname',
          ),
          controller: lastNameController,
        ),
        const SizedBox(height: 20),
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
            icon: Icon(Icons.phone),
            labelText: 'Phone number',
          ),
          controller: phoneNumberController,
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
        const SizedBox(height: 30),
        TextButton(
          style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
          onPressed: () {
            _registration();
          },
          child: const Text('Sign Up'),
        ),
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
