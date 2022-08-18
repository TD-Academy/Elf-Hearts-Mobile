import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:users/controllers/auth_controller.dart';
import './otp_styles.dart';
import 'package:users/services/storage_service.dart';
import 'package:users/models/user_model.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({Key? key}) : super(key: key);

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final storage = LocalStorageService();

  late FocusNode pinFocus1;
  late FocusNode pinFocus2;
  late FocusNode pinFocus3;
  late FocusNode pinFocus4;
  late FocusNode pinFocus5;
  late FocusNode pinFocus6;
  var pin1Controller = TextEditingController();
  var pin2Controller = TextEditingController();
  var pin3Controller = TextEditingController();
  var pin4Controller = TextEditingController();
  var pin5Controller = TextEditingController();
  var pin6Controller = TextEditingController();

  Future<void> _verify() async {
    String pin1 = pin1Controller.text.trim();
    String pin2 = pin2Controller.text.trim();
    String pin3 = pin3Controller.text.trim();
    String pin4 = pin4Controller.text.trim();
    String pin5 = pin5Controller.text.trim();
    String pin6 = pin6Controller.text.trim();
    String otp = pin1 + pin2 + pin3 + pin4 + pin5 + pin6;

    String id = await storage.readData(StorageKey.userId);
    print(id);

    Users otpBody = Users(
      verifyCode: otp,
      id: id,
    );
    var provider = Provider.of<AuthController>(context, listen: false);
    await provider.verify(otpBody);
    if (provider.isBack) {
      Navigator.of(context).pushNamed('/home');
    }
  }

  @override
  void initState() {
    super.initState();
    pinFocus1 = FocusNode();
    pinFocus2 = FocusNode();
    pinFocus3 = FocusNode();
    pinFocus4 = FocusNode();
    pinFocus5 = FocusNode();
    pinFocus6 = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pinFocus1.dispose();
    pinFocus2.dispose();
    pinFocus3.dispose();
    pinFocus4.dispose();
    pinFocus5.dispose();
    pinFocus6.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  void prevField(String value, FocusNode focusNode) {
    if (value.length == 0) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Form(
        child: Column(
      children: [
        SizedBox(
          height: screenHeight * 0.05,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 50,
              child: TextFormField(
                  focusNode: pinFocus1,
                  autofocus: true,
                  obscureText: false,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value, pinFocus2);
                  },
                  controller: pin1Controller,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ]),
            ),
            SizedBox(
              width: 50,
              child: TextFormField(
                  focusNode: pinFocus2,
                  autofocus: true,
                  obscureText: false,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value, pinFocus3);
                    prevField(value, pinFocus1);
                  },
                  controller: pin2Controller,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ]),
            ),
            SizedBox(
              width: 50,
              child: TextFormField(
                  focusNode: pinFocus3,
                  autofocus: true,
                  obscureText: false,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value, pinFocus4);
                    prevField(value, pinFocus2);
                  },
                  controller: pin3Controller,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ]),
            ),
            SizedBox(
              width: 50,
              child: TextFormField(
                  focusNode: pinFocus4,
                  autofocus: true,
                  obscureText: false,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value, pinFocus5);
                    prevField(value, pinFocus3);
                  },
                  controller: pin4Controller,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ]),
            ),
            SizedBox(
              width: 50,
              child: TextFormField(
                  focusNode: pinFocus5,
                  autofocus: true,
                  obscureText: false,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value, pinFocus6);
                    prevField(value, pinFocus4);
                  },
                  controller: pin5Controller,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ]),
            ),
            SizedBox(
                width: 50,
                child: TextFormField(
                    focusNode: pinFocus6,
                    autofocus: true,
                    obscureText: false,
                    style: TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    onChanged: (value) {
                      if (value.length == 1) {
                        pinFocus6.unfocus();
                      }
                      ;
                      prevField(value, pinFocus5);
                    },
                    controller: pin6Controller,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ]))
          ],
        ),
        SizedBox(
          height: screenHeight * 0.05,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () => {_verify()},
              style: ElevatedButton.styleFrom(fixedSize: const Size(100, 50)),
              child: const Text("Submit"),
            )
          ],
        )
      ],
    ));
  }
}
