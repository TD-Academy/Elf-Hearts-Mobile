import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:users/controllers/auth_controller.dart';

class InitialPage extends StatefulWidget {
  InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  AuthController authController = AuthController();
  @override
  Widget build(BuildContext context) {
    // if user is authorized display homepage
    // if user is unauthorized display startpage
    // if loading = true display Loading page
    return Consumer<AuthController>(
      builder: 
    );
  }
}
