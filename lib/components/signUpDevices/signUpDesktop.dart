import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:users/models/signUpModel.dart';
import 'package:provider/provider.dart';
import 'package:users/state/signUpState.dart';

class SignUpDesktop extends StatefulWidget {
  const SignUpDesktop({Key? key}) : super(key: key);

  @override
  State<SignUpDesktop> createState() => _SignUpDesktopState();
}

class _SignUpDesktopState extends State<SignUpDesktop> {
  // Controllers for getting input data
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var passwordController = TextEditingController();

  // registration function
  // Minii oilgosnoor Future async eer hiideg
  // 3 stage tei: uncompleted, value, error
  // sudlah heregtei
  // Test hiij arai uzeegu bga
  Future<void> _registration() async {
    String userName = userNameController.text.trim();
    String password = passwordController.text.trim();
    String firstName = firstNameController.text.trim();
    String lastName = lastNameController.text.trim();
    String email = emailController.text.trim();
    String phoneNumber = phoneNumberController.text.trim();
    SignUpBody signUpBody = SignUpBody(
        userName: userName,
        password: password,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phoneNumber);
    var provider = Provider.of<DataClass>(context, listen: false);
    await provider.postData(signUpBody);
    if (provider.isBack) {
      Navigator.of(context).pushNamed('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
        Expanded( //<-- Expanded widget
          child: Image.asset(
             '../../../assets/img2.jpg', 
             fit: BoxFit.cover,
        )),
        Expanded( //<-- Expanded widget
          child: Container(
            constraints: const BoxConstraints(maxWidth: 21),
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
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
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20)),
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
            ),
          ),
        ),
      ],
    );
  }
}