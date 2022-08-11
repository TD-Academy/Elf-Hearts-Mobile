import 'package:flutter/material.dart';

// Starting Page

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 75,
              width: 200,
              child: ElevatedButton(
                child: const Text('Sign In'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/signIn');
                },
              ),
            ),
            const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 20)),
            SizedBox(
              height: 75,
              width: 200,
              child: ElevatedButton(
                child: const Text('Sign Up'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/signUp');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
