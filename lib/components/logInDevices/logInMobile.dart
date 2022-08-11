import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:users/state/loginState.dart';
import '../../data/login.dart';

// Not finished
// Works with backend but not on app level

class LoginMobile extends StatefulWidget {
  const LoginMobile({Key? key}) : super(key: key);

  @override
  State<LoginMobile> createState() => _LoginMobileState();
}

class _LoginMobileState extends State<LoginMobile> {
  UserLoginProvider loginProvider = UserLoginProvider();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Center(
            child: SizedBox(
              width: 300,
              child: Column(
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
                    controller: loginProvider.userNameController,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.lock),
                      labelText: 'Password',
                    ),
                    controller: loginProvider.passwordController,
                  ),
                  const SizedBox(height: 25),
                  TextButton(
                    onPressed: () {
                      loginProvider
                          .updateName(loginProvider.userNameController.text);
                      loginProvider.updatePassword(
                          loginProvider.passwordController.text);
                    },
                    child: const Text('Forgot password'),
                  ),
                  const SizedBox(height: 30),
                  TextButton(
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20)),
                    onPressed: () {
                      signIn(loginProvider.userNameController.text,
                          loginProvider.passwordController.text);
                    },
                    child: const Text('Log In'),
                  ),
                  const SizedBox(height: 100),
                  ElevatedButton(
                    child: const Text('Go Back'),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/home');
                    },
                  ),
                  const SizedBox(height: 75),
                  Consumer<UserLoginProvider>(
                      builder: (context, provider, child) {
                    return Column(
                      children: [
                        Text('Username: ${provider.userName}'),
                        Text('Password: ${provider.password}')
                      ],
                    );
                  })
                  // Text('Username: ${loginProvider.userName}'),
                  // Text('Password: ${loginProvider.password}')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
