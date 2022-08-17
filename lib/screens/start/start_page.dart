import 'package:flutter/material.dart';
import 'package:users/screens/start/components/body.dart';

// Starting Page

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: StartPageBody()
    );
  }
}
