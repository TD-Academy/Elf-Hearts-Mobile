import 'package:flutter/material.dart';

class StartPageBody extends StatefulWidget {
  const StartPageBody({Key? key}) : super(key: key);

  @override
  State<StartPageBody> createState() => _StartPageBodyState();
}

class _StartPageBodyState extends State<StartPageBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}