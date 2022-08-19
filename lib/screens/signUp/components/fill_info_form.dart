import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:users/models/user_model.dart';
import 'package:provider/provider.dart';
import 'package:users/controllers/auth_controller.dart';

class FillInfoForm extends StatefulWidget {
  const FillInfoForm({Key? key}) : super(key: key);

  @override
  State<FillInfoForm> createState() => _FillInfoFormState();
}

class _FillInfoFormState extends State<FillInfoForm> {
  String respMes = '';
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var phoneNumberController = TextEditingController();

  Future<void> _fillInfo() async {
    String firstName = firstNameController.text.trim();
    String lastName = lastNameController.text.trim();
    String phoneNumber = phoneNumberController.text.trim();
    if (firstName != '' && lastName != '' && phoneNumber != '') {
      setState(() {
        respMes = '';
      });
      Users body =
          Users(firstName: firstName, lastName: lastName, phone: phoneNumber);
      var provider = Provider.of<AuthController>(context, listen: false);
      await provider.fillInfo(body);
      if (provider.isBack) {
        Navigator.of(context).pushNamed('/home');
      }
    } else {
      setState(() {
        respMes = 'All fields must be filled!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Fill in your personal info.',
          style: GoogleFonts.inter(
            fontSize: 23,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 35),
        TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.person),
            labelText: 'Firstname',
          ),
          controller: firstNameController,
        ),
        const SizedBox(height: 20),
        TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.person),
            labelText: 'Lastname',
          ),
          controller: lastNameController,
        ),
        const SizedBox(height: 20),
        TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.phone),
            labelText: 'Phone number',
          ),
          controller: phoneNumberController,
        ),
        const SizedBox(height: 55),
        TextButton(
          style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
          onPressed: () {
            _fillInfo();
          },
          child: const Text('Submit'),
        ),
        const SizedBox(height: 20),
        Text(respMes),
      ],
    );
  }
}
