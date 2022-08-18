import 'package:flutter/material.dart';
import '../../models/user_model.dart';
import 'package:provider/provider.dart';
import 'package:users/controllers/auth_controller.dart';

class ChangePassPage extends StatefulWidget {
  const ChangePassPage({Key? key}) : super(key: key);

  @override
  State<ChangePassPage> createState() => _ChangePassPageState();
}

class _ChangePassPageState extends State<ChangePassPage> {
  var emailController = TextEditingController();

  Future<void> sendOtp() async {
    String email = emailController.text.trim();
    Users body = Users(email: email);
    var provider = Provider.of<AuthController>(context, listen: false);
    await provider.signUp(body);
    if (provider.isBack) {
      Navigator.of(context).pushNamed('/otp');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SizedBox(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Forgot Password?",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          icon: Icon(Icons.email_rounded), labelText: "Email"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextButton(
                        onPressed: () {}, child: const Text("Send Code")),
                    const SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Go back"))
                  ],
                ))));
  }
}
