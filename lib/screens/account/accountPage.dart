import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize:MainAxisSize.min,
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
        ),
        const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
        IconButton(
          onPressed: (){},
          icon: const Icon(Icons.add),
        )
      ],
    );
  }
}