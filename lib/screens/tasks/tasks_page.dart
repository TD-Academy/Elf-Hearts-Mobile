import 'package:flutter/material.dart';
import 'package:users/controllers/auth_controller.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  
  logOut() {
    AuthController().logOut();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        logOut();
      },
      child: const Text('Log Out')
    );
  }
}