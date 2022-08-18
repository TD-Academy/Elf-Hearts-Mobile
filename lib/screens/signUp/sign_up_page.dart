import 'package:flutter/material.dart';
import 'package:users/screens/signUp/components/pages/sign_up/sign_up_desktop.dart';
import 'package:users/screens/signUp/components/pages/sign_up/sign_up_tablet.dart';
import 'components/pages/sign_up/sign_up_mobile.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return const SignUpMobile();
          } else if (constraints.maxWidth > 600 && constraints.maxWidth < 900) {
            return const SignUpTablet();
          } else {
            return const SignUpDesktop();
          }
        },
      ),
    );
  }
}
