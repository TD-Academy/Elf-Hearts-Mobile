import 'package:flutter/material.dart';

const headStyle = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
);
const textStyle = TextStyle(fontSize: 15, fontWeight: FontWeight.w200);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(color: Colors.blue),
  );
}

final otpInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 15),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);