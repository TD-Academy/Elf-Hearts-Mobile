import 'package:flutter/material.dart';

class ChangePass extends StatefulWidget {
  const ChangePass({Key? key}) : super(key: key);

  @override
  State<ChangePass> createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(30),
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
                  TextButton(onPressed: () {}, child: const Text("Submit"))
                ],
              ),
            ),
          )),
    );
  }
}
