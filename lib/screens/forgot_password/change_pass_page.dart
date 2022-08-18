import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/auth_controller.dart';
import '../../models/user_model.dart';

class ChangePassPage extends StatefulWidget {
  const ChangePassPage({Key? key}) : super(key: key);

  @override
  State<ChangePassPage> createState() => _ChangePassPageState();
}

class _ChangePassPageState extends State<ChangePassPage> {
  String respMes = '';
  var newPassController = TextEditingController();
  var confirmPassController = TextEditingController();

  Future<void> _changePass() async {
    String newPassword = newPassController.text.trim();
    String confirmPassword = confirmPassController.text.trim();

    if (newPassword != '' && confirmPassword != '') {
      if (newPassword == confirmPassword) {
        respMes = '';
        Users body = Users(newPassword: newPassword);
        var provider = Provider.of<AuthController>(context, listen: false);
        provider.changePass(body);
        if (provider.isBack == true) {
          Navigator.of(context).pushNamed('signIn');
        }
      } else {
        respMes = "Passwords doesn't match!";
      }
    } else {
      respMes = 'All fields must be filled!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(30),
          child: Center(
            child: SizedBox(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Change Password",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        icon: Icon(Icons.lock_reset_rounded),
                        labelText: "New Password"),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        icon: Icon(Icons.lock), labelText: "Confirm Password"),
                  ),
                  TextButton(
                      onPressed: () {
                        _changePass();
                      },
                      child: const Text("Submit")),
                  const SizedBox(height: 10),
                  Text(respMes)
                ],
              ),
            ),
          )),
    );
  }
}
