import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './components/otp_styles.dart';
import './components/otp_form.dart';
import '../../services/storage_service.dart';
import '../../controllers/auth_controller.dart';
import '../../models/user_model.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final email = LocalStorageService().readData(StorageKey.email);
  String otpMes = 'Resend OTP Code';

  Future<void> _resendOtp() async {
    Users body = Users(email: email);
    var provider = Provider.of<AuthController>(context, listen: false);
    await provider.sendOtp(body);
    if (provider.isBack) {
      otpMes = 'Resent Code.';
      Future.delayed(const Duration(seconds: 6), () {
        otpMes = 'Resend OTP Code';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verification"),
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
            const Text(
              "Verification",
              style: headStyle,
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            const Text(
              "Enter OTP code sent to your email.",
              style: textStyle,
            ),
            Text(
              "$email",
              style: textStyle,
            ),
            GestureDetector(
              onTap: () {
                _resendOtp();
              },
              child: const Text(
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
