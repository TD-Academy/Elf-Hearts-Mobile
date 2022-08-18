import 'package:flutter/material.dart';
import './components/otp_styles.dart';
import 'components/otp_form.dart';


class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Verification"),
        leading: IconButton(
            onPressed: () => {Navigator.pop(context)},
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.blue,
            )),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.05,
            ),
            Icon(
              Icons.mail_rounded,
              size: screenHeight * 0.1,
            ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            Text(
              "Verification",
              style: headStyle,
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Text(
              "Enter OTP code sent to your number",
              style: textStyle,
            ),
            Text(
              "+976 0000 0000",
              style: textStyle,
            ),
            GestureDetector(
              onTap: () {
                // OTP code resend
              },
              child: Text(
                "Resend OTP Code",
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
            const OtpForm()
          ],
        ),
      ),
    );
  }
}