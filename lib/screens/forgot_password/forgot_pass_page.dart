import 'package:flutter/material.dart';
import '../../models/user_model.dart';
import 'package:provider/provider.dart';
import 'package:users/controllers/auth_controller.dart';

class ForgotPassPage extends StatefulWidget {
  const ForgotPassPage({Key? key}) : super(key: key);

  @override
  State<ForgotPassPage> createState() => _ForgotPassPageState();
}

class _ForgotPassPageState extends State<ForgotPassPage> {
  String respMes = '';
  var emailController = TextEditingController();

  Future<void> sendOtp() async {
    String email = emailController.text.trim();
    if (email != null) {
      Users body = Users(email: email);
      var provider = Provider.of<AuthController>(context, listen: false);
      await provider.sendOtp(body);
      if (provider.isBack) {
        respMes = '';
        Navigator.of(context).pushNamed('/otp');
      }
    } else {
      respMes = 'Email field must be filled!';
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
                    Text(respMes),
                    const SizedBox(
                      height: 40,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text("Send Verification Code")),
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
