import 'package:flutter/material.dart';
import '../../fill_info_form.dart';

class FillInfoMobile extends StatefulWidget {
  const FillInfoMobile({Key? key}) : super(key: key);

  @override
  State<FillInfoMobile> createState() => _FillInfoMobileState();
}

class _FillInfoMobileState extends State<FillInfoMobile> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Center(
            child: SizedBox(width: 300, child: FillInfoForm()),
          ),
        ),
      ),
    );
  }
}
