import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../signUp/fill_info_page.dart';
import '../forgot_password/change_pass_page.dart';
import '../../controllers/auth_controller.dart';

class VerifiedPage extends StatefulWidget {
  const VerifiedPage({Key? key}) : super(key: key);

  @override
  State<VerifiedPage> createState() => _VerifiedPageState();
}

class _VerifiedPageState extends State<VerifiedPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(
      builder: (_, verification, __) {
        return verification.verificationInstance ==
                VerificationInstance.forgotPass
            ? const ChangePassPage()
            : const FillInfoPage();
      },
    );
  }
}
