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
  String respMes = '';
  var emailController = TextEditingController(text: 'tergel7006@gmail.com');
  var passwordController = TextEditingController(text: 'Tergel88');

  Future<void> _signIn() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    if (email != '' && password != '') {
      setState(() {
        respMes = '';
      });
      Users body = Users(email: email, password: password);
      var provider = Provider.of<AuthController>(context, listen: false);
      await provider.signIn(body);
      if (provider.isBack) {
        Navigator.of(context).pushNamed('/home');
      }
    } else {
      setState(() {
        respMes = 'All fields must be filled!';
      });
    }
  }

  Future<void> _sendOtp() async {
    String email = emailController.text.trim();
    if (email != '') {
      setState(() {
        respMes = '';
      });
      Users body = Users(email: email);
      var provider = Provider.of<AuthController>(context, listen: false);
      await provider.sendOtp(body);
      if (provider.isBack) {
        Navigator.of(context).pushNamed('/otp');
      }
    } else {
      setState(() {
        respMes = 'Email field must be filled!';
      });
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
        const SizedBox(height: 25),
        TextButton(
          onPressed: () {
            _sendOtp();
          },
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
        const SizedBox(height: 30),
        Text(respMes),
        const SizedBox(height: 70),
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
