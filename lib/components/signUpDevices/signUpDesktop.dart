import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpDesktop extends StatefulWidget {
  const SignUpDesktop({Key? key}) : super(key: key);

  @override
  State<SignUpDesktop> createState() => _SignUpDesktopState();
}

class _SignUpDesktopState extends State<SignUpDesktop> {
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
                    
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      labelText: 'Lastname',
                    ),
                    
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      labelText: 'Username',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.email),
                      labelText: 'Email',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.phone),
                      labelText: 'Phone number',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.lock),
                      labelText: 'Password',
                    ),
                  ),
                  const SizedBox(height: 25),
                  const SizedBox(height: 30),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20)
                    ),
                    onPressed: () {  },
                    child: const Text('Sign Up'),
                  ),
                  const SizedBox(height: 60),
                  ElevatedButton(
                    child: const Text('Go Back'),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/home');
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