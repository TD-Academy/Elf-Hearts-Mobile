import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Center(
          child: Lottie.network('https://assets2.lottiefiles.com/datafiles/bEYvzB8QfV3EM9a/data.json'),
        ),
      );
  }
}