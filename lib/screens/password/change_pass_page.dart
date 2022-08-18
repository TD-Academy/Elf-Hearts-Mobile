import 'package:flutter/material.dart';

class ChangePassPage extends StatefulWidget {
  const ChangePassPage({Key? key}) : super(key: key);

  @override
  State<ChangePassPage> createState() => _ChangePassPageState();
}

class _ChangePassPageState extends State<ChangePassPage> {
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
                          "Forgot Password?",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              icon: Icon(Icons.email_rounded),
                              labelText: "Email"),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // TextFormField(
                        //   decoration: const InputDecoration(
                        //       icon: Icon(Icons.person), labelText: "Username"),
                        // ),
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
                    )))));
  }
}
